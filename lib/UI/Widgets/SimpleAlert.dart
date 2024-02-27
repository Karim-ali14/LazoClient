import 'package:flutter/material.dart';
import 'package:shake_animation_widget/shake_animation_widget.dart';

import '../Theme/AppColors.dart';

class SimpleAlert extends StatefulWidget {
  final SimpleAlertType alertType;
  final String text;
  final bool? toastMode;
  final VoidCallback? onClose;
  final VoidCallback? onClick;
  final Widget? action;
  const SimpleAlert(
      {super.key, required this.alertType, required this.text, this.onClose,this.onClick, this.toastMode, this.action});

  @override
  State<SimpleAlert> createState() => SimpleAlertState();
}

class SimpleAlertState extends State<SimpleAlert> {
  var _isVisible = true;
  var _isGone = false;
  String? _message;
  SimpleAlertType? _alertType;

  final ShakeAnimationController _shakeAnimationController = ShakeAnimationController();
  @override
  void initState() {
    _isVisible = widget.toastMode == true ? false : true;
    _isGone = widget.toastMode == true ? true : false;
    _message = widget.text;
    _alertType = widget.alertType;
    setState(() {

    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ShakeAnimationWidget(
      shakeAnimationController: _shakeAnimationController,
      shakeAnimationType: ShakeAnimationType.SkewShake,
      isForward: false,
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 300),
        opacity: _isVisible ? 1 : 0,
        child: !_isGone ? IntrinsicHeight(
            child:  Container(
              key: ValueKey(1),
              margin: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(6),
                  boxShadow: [
                    BoxShadow(
                        color: AppColors.appGrey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 10)
                  ]),
              child: InkWell(
                  onTap: (){
                    widget.onClick?.call();
                  },
                  child:Row(
                    children: [
                      Container(
                        margin: const EdgeInsetsDirectional.only(end: 8),
                        width: 8,
                        decoration: BoxDecoration(
                            color: _alertType == SimpleAlertType.danger ? AppColors.failureColor : _alertType == SimpleAlertType.alert ? AppColors.pendingColor : AppColors.successColor,
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(6),
                              bottomLeft: Radius.circular(6),
                            )),
                      ),
                      if(widget.action == null) Padding(
                        padding: const EdgeInsets.symmetric(vertical: 14.0),
                        child: Icon(
                          _alertType == SimpleAlertType.danger ? Icons.cancel : _alertType == SimpleAlertType.alert ? Icons.info : Icons.check_circle,
                          color: _alertType == SimpleAlertType.danger ? AppColors.failureColor : _alertType == SimpleAlertType.alert ? AppColors.pendingColor : AppColors.successColor,
                          size: 29,
                        ),
                      ),

                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            _message ?? "",
                            style: AppColors.appTextTheme.titleLarge
                                ?.copyWith(fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 6),
                        child: widget.action?? Material(
                          shape: const CircleBorder(),
                          clipBehavior: Clip.hardEdge,
                          color: Colors.white,
                          child: IconButton(
                              onPressed: widget.onClose != null ? () {
                                widget.onClose?.call();
                              } : () {
                                hide();
                              },
                              icon: const Icon(
                                Icons.close,
                                color: AppColors.appGrey,
                              )),
                        ),
                      )
                    ],
                  ),
              )
            ),
        ) : SizedBox(),
      ),
    );
  }

  void hide(){
    setState(() {
      _isVisible = false;
      Future.delayed(const Duration(milliseconds: 360),(){
        setState(() => _isGone = true);
      });
    });
  }
  void showAlert({String? message,SimpleAlertType? alertType,ScrollController? scrollController}){
    setState(() {
      _isGone = false;
      _isVisible = true;

      if(message != null){
        _message = message;
      }

      if(alertType != null){
        _alertType = alertType;
      }
    });

    scrollController?.animateTo(0, duration: const Duration(milliseconds: 300), curve: Curves.easeInSine);

    // if(widget.toastMode == true){
    //   Future.delayed(const Duration(seconds: 6),(){
    //     _hide();
    //   });
    // }
  }

  void highlight({ScrollController? scrollController}){
    debugPrint("Shake");

    if(_isGone){
      showAlert();
    }

    if (_shakeAnimationController.animationRunging) {
      _shakeAnimationController.stop();
    } else {
      scrollController?.animateTo(0, duration: const Duration(milliseconds: 300), curve: Curves.easeInSine);
      _shakeAnimationController.start(shakeCount: 2);
    }
  }
}

enum SimpleAlertType { alert, danger, success }
