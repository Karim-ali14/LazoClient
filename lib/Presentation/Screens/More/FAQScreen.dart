import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../Constants/Constants.dart';
import '../../../Localization/Keys.dart';
import '../../StateNotifiersViewModel/PublicStateNotifiers.dart';
import '../../Widgets/CustomAppBar.dart';
import 'Componants/FAQItemCard.dart';

class FAQScreen extends ConsumerStatefulWidget {
  const FAQScreen({super.key});

  @override
  ConsumerState<FAQScreen> createState() => _FAQScreenState();
}

class _FAQScreenState extends ConsumerState<FAQScreen> {
  @override
  Widget build(BuildContext context) {
    final appInfoData = ref.watch(getAppInfoStateNotifier);
    print("${appInfoData.data?.data?.faqs.length}");
    return Scaffold(
      appBar: CustomAppBar(
        appContext: context,
        title: context.tr(faqKey),
        navigated: true,
        isCenter: false,
      ),
      body: SafeArea(
        child: Padding(
          padding:
              const EdgeInsets.symmetric(horizontal: defaultPaddingHorizontal),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 32,
                ),
                ...(List.generate(
                    appInfoData.data?.data?.faqs.length ?? 0,
                    (int index) => Column(
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.symmetric(vertical: 8),
                              child: FAQItemCard(
                                title:
                                    appInfoData.data?.data?.faqs[index].question ??
                                        "",
                                description:
                                    appInfoData.data?.data?.faqs[index].answer ??
                                        "",
                              ),
                            )
                          ],
                        )))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
