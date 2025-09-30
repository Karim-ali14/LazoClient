package com.pomac.lazo_client

import android.app.Activity
import android.content.Intent
import android.net.Uri
import android.os.Bundle
import android.os.Handler
import android.os.Looper
import android.util.Log
import android.widget.Toast
import androidx.activity.result.ActivityResultLauncher
import androidx.activity.result.contract.ActivityResultContracts
import io.flutter.embedding.android.FlutterFragmentActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import com.oppwa.mobile.connect.checkout.meta.CheckoutActivityResult
import com.oppwa.mobile.connect.checkout.meta.CheckoutActivityResultContract
import com.oppwa.mobile.connect.checkout.meta.CheckoutSettings
import com.oppwa.mobile.connect.exception.PaymentError
import com.oppwa.mobile.connect.exception.PaymentException
import com.oppwa.mobile.connect.payment.BrandsValidation
import com.oppwa.mobile.connect.payment.CheckoutInfo
import com.oppwa.mobile.connect.payment.ImagesRequest
import com.oppwa.mobile.connect.payment.PaymentParams
import com.oppwa.mobile.connect.payment.card.CardPaymentParams
import com.oppwa.mobile.connect.payment.token.TokenPaymentParams
import com.oppwa.mobile.connect.provider.Connect
import com.oppwa.mobile.connect.provider.ITransactionListener
import com.oppwa.mobile.connect.provider.OppPaymentProvider
import com.oppwa.mobile.connect.provider.ThreeDSWorkflowListener
import com.oppwa.mobile.connect.provider.Transaction
import com.oppwa.mobile.connect.provider.TransactionType

class MainActivity : FlutterFragmentActivity(),
    ITransactionListener,
    ThreeDSWorkflowListener,
    MethodChannel.Result {

    private val CHANNEL = "Hyperpay.demo.fultter/channel"
    private val scheme = "com.pomac.lazo_client://result"
    private var checkoutId: String = ""
    private var methodResult: MethodChannel.Result? = null

    private var type: String = ""
    private var number: String? = null
    private var holder: String? = null
    private var cvv: String? = null
    private var year: String? = null
    private var month: String? = null
    private var brand: String? = null
    private var mode: String = ""
    private var STCPAY: String = ""
    private var ptMadaVExp: String = ""
    private var ptMadaMExp: String = ""
    private var brands: String = ""
    private var isToken: String = ""
    private var token: String = ""

    private var paymentProvider: OppPaymentProvider =
        OppPaymentProvider(this, Connect.ProviderMode.TEST)

    private lateinit var checkoutSettings: CheckoutSettings
    private val handler = Handler(Looper.getMainLooper())

    // لوجيك التحقق من صحة الكارت
    private fun check(ccNumber: String): Boolean {
        var sum = 0
        var alternate = false
        for (i in ccNumber.length - 1 downTo 0) {
            var n = ccNumber.substring(i, i + 1).toInt()
            if (alternate) {
                n *= 2
                if (n > 9) n = (n % 10) + 1
            }
            sum += n
            alternate = !alternate
        }
        return sum % 10 == 0
    }

    override fun success(result: Any?) {
        handler.post { methodResult?.success(result) }
    }

    override fun error(errorCode: String, errorMessage: String?, errorDetails: Any?) {
        handler.post { methodResult?.error(errorCode, errorMessage, errorDetails) }
    }

    override fun notImplemented() {
        handler.post { methodResult?.notImplemented() }
    }

    private val checkoutLauncher: ActivityResultLauncher<CheckoutSettings> =
        registerForActivityResult(CheckoutActivityResultContract()) { result ->
            handleCheckoutResult(result)
        }

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        MethodChannel(
            flutterEngine.dartExecutor.binaryMessenger,
            CHANNEL
        ).setMethodCallHandler { call: MethodCall, result: MethodChannel.Result ->
            methodResult = result
            if (call.method == "gethyperpayresponse") {
                type = call.argument("type") ?: ""
                mode = call.argument("mode") ?: ""
                checkoutId = call.argument("checkoutid") ?: ""

                if (type == "ReadyUI") {
                    openCheckoutUI(checkoutId)
                } else {
                    brands = call.argument("brand") ?: ""
                    STCPAY = call.argument("STCPAY") ?: ""
                    number = call.argument("card_number")
                    holder = call.argument("holder_name")
                    year = call.argument("year")
                    month = call.argument("month")
                    cvv = call.argument("cvv")
                    ptMadaVExp = call.argument("MadaRegexV") ?: ""
                    ptMadaMExp = call.argument("MadaRegexM") ?: ""
                    isToken = call.argument("istoken") ?: ""
                    token = call.argument("token") ?: ""

                    openCustomUI(checkoutId)
                }
            } else {
                error("1", "Method name is not found", "")
            }
        }
    }

    private fun openCheckoutUI(checkoutId: String) {
        val paymentBrands = linkedSetOf<String>()
        if (brands == "mada") {
            paymentBrands.add("MADA")
        } else {
            paymentBrands.add("VISA")
            paymentBrands.add("MASTER")
        }

        checkoutSettings = CheckoutSettings(
            checkoutId,
            paymentBrands,
            if (mode == "LIVE") Connect.ProviderMode.LIVE else Connect.ProviderMode.TEST
        )

        startCheckout()
    }

    private fun startCheckout() {
        checkoutLauncher.launch(checkoutSettings)
    }

    private fun handleCheckoutResult(result: CheckoutActivityResult) {
        when {
            result.isCanceled -> {
                Toast.makeText(this, "canceled", Toast.LENGTH_LONG).show()
                error("2", "Canceled", "")
            }

            result.isErrored -> {
                val error = result.paymentError
                Toast.makeText(this, "error", Toast.LENGTH_LONG).show()
                Log.e("error", error?.errorInfo ?: "unknown")
                error("3", "Checkout Result Error", "")
            }

            else -> {
                val transaction = result.transaction
                if (transaction != null && transaction.transactionType == TransactionType.SYNC) {
                    success("SYNC")
                }
            }
        }
    }

    private fun openCustomUI(checkoutId: String) {
        Toast.makeText(this, "Waiting..", Toast.LENGTH_LONG).show()

        if (mode == "LIVE") {
            paymentProvider = OppPaymentProvider(this, Connect.ProviderMode.LIVE)
        }

        try {
            when {
                STCPAY == "enabled" -> {
                    val paymentParams = PaymentParams(checkoutId, "STC_PAY").apply {
                        shopperResultUrl = scheme
                    }
                    val transaction = Transaction(paymentParams)
                    paymentProvider.setThreeDSWorkflowListener(this)
                    paymentProvider.submitTransaction(transaction, this)
                }

                isToken == "true" -> {
                    if (!CardPaymentParams.isCvvValid(cvv)) {
                        Toast.makeText(this, "CVV is Invalid", Toast.LENGTH_LONG).show()
                    } else {
                        val paymentParams =
                            TokenPaymentParams(checkoutId, token, " ", cvv).apply {
                                shopperResultUrl = scheme
                            }
                        val transaction = Transaction(paymentParams)
                        paymentProvider.setThreeDSWorkflowListener(this)
                        paymentProvider.submitTransaction(transaction, this)
                    }
                }

                else -> {
                    val cardNumber = number ?: ""
                    if (!check(cardNumber)) {
                        Toast.makeText(this, "Card Number is Invalid", Toast.LENGTH_LONG).show()
                        return
                    }

                    val firstNumber = cardNumber.first().toString()
                    brand = when {
                        brands == "mada" && (cardNumber.substring(0, 6)
                            .matches(ptMadaVExp.toRegex()) ||
                                cardNumber.substring(0, 6).matches(ptMadaMExp.toRegex())) -> "MADA"
                        firstNumber == "4" -> "VISA"
                        firstNumber == "5" -> "MASTER"
                        else -> null
                    }

                    val paymentParams = CardPaymentParams(
                        checkoutId, brand, cardNumber, holder, month, year, cvv
                    ).apply {
                        shopperResultUrl = scheme
                    }
                    val transaction = Transaction(paymentParams)
                    paymentProvider.setThreeDSWorkflowListener(this)
                    paymentProvider.submitTransaction(transaction, this)
                }
            }
        } catch (e: PaymentException) {
            e.printStackTrace()
        }
    }

    // Transaction listener
    override fun brandsValidationRequestSucceeded(brandsValidation: BrandsValidation) {}
    override fun brandsValidationRequestFailed(paymentError: PaymentError) {}
    override fun imagesRequestSucceeded(imagesRequest: ImagesRequest) {}
    override fun imagesRequestFailed() {}
    override fun paymentConfigRequestSucceeded(checkoutInfo: CheckoutInfo) {}
    override fun paymentConfigRequestFailed(paymentError: PaymentError) {}

    override fun transactionCompleted(transaction: Transaction) {
        if (transaction.transactionType == TransactionType.SYNC) {
            success("SYNC")
        } else {
            val uri = Uri.parse(transaction.redirectUrl)
            startActivity(Intent(Intent.ACTION_VIEW, uri))
        }
    }

    override fun transactionFailed(transaction: Transaction, paymentError: PaymentError) {
        Log.e("HyperPay", "Transaction failed: ${paymentError.errorInfo}")
        error("4", "Transaction Failed", paymentError.errorInfo)
    }

    override fun onThreeDSChallengeRequired(): Activity {
        return this
    }

    override fun onNewIntent(intent: Intent) {
        super.onNewIntent(intent)

        val uri: Uri? = intent.data

        if (uri != null) {
            Log.e("HyperPay", """
            🔗 New Intent Received
            - Full URI: $uri
            - Scheme: ${uri.scheme}
            - Host: ${uri.host}
            - Path: ${uri.path}
            - Query: ${uri.query}
        """.trimIndent())

            if (uri.scheme == "com.pomac.lazo_client" && uri.host == "result") {
                success("success")
            } else {
                Log.e("HyperPay", "❌ URI does not match expected scheme/host")
            }
        } else {
            Log.e("HyperPay", "❌ Intent has no data (uri is null)")
        }
    }

}
