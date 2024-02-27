// import 'package:flutter/material.dart';
//
// import '../Theme/AppColors.dart';
//
// class AppVersion extends StatefulWidget {
//   const AppVersion({super.key});
//
//   @override
//   State<AppVersion> createState() => _AppVersionState();
// }
//
// class _AppVersionState extends State<AppVersion> {
//
//   String? version;
//
//   @override
//   void initState() {
//     WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
//       PackageInfo.fromPlatform().then((value) => setState(() => version = value.version));
//     });
//     super.initState();
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Text(version ?? "",style: AppColors.appTextTheme.titleSmall?.copyWith(fontSize: 16),);
//   }
// }
