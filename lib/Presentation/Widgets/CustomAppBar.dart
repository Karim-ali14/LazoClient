import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../Theme/AppTheme.dart';


class CustomAppBar extends StatelessWidget implements PreferredSizeWidget  {
  final double appBarHeight = 90.0;
  final String? title;
  final bool navigated;
  final Widget? trailingWidget;
  final BuildContext appContext;
  final bool isCenter;
  final VoidCallback? customCallBack;
  final Color? appBarColor;
  final Widget? leadingWidget;
  final bool isHomeScreen;
  const CustomAppBar({Key? key, this.trailingWidget,this.title , this.navigated = false,required this.appContext, this.customCallBack, this.isCenter = true, this.appBarColor,this.leadingWidget, this.isHomeScreen = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return IntrinsicHeight(
      child: AppBar(
        toolbarHeight: leadingHeightCount(),
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: appBarColor??AppTheme.mainBackgroundLightColor,
        centerTitle: isCenter,
        actions: trailingWidget != null ? [trailingWidget!] : [],
        leadingWidth: leadingWithCount(),
        leading: leadingWidget ?? (navigated ? IconButton(onPressed: (){

          if(customCallBack != null) {
            customCallBack?.call();
            return;
          }

          try{
            GoRouter.of(appContext).pop(appContext);
          }catch(e){
            Navigator.pop(context);
          }

        }, icon: Icon(Icons.arrow_back,color: themeData.textTheme.bodyLarge!.color,),) : const SizedBox()),
        title: Text(title??"",textAlign: TextAlign.center,style: themeData.textTheme.displayLarge?.copyWith(fontSize: 22),overflow: TextOverflow.ellipsis,),
      ),
    );
  }
  double? leadingWithCount(){
    if(!navigated && leadingWidget == null){
      return 0;
    }
    else if(navigated) {
      return 25;
    } else if(isHomeScreen) {
      return 120;
    }
    return null;
  }
  double? leadingHeightCount(){
    if(isHomeScreen){
      return 100;
    }
    return null;
  }

  @override
  Size get preferredSize => const Size.fromHeight(90);

}