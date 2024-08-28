import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lazo_client/Presentation/Theme/AppTheme.dart';

import '../../StateNotifiersViewModel/PublicStateNotifiers.dart';
import '../../Widgets/CustomAppBar.dart';

class PrivacyAndPolicyScreen extends ConsumerStatefulWidget {
  const PrivacyAndPolicyScreen({super.key});

  @override
  ConsumerState<PrivacyAndPolicyScreen> createState() => _PrivacyAndPolicyScreenState();
}

class _PrivacyAndPolicyScreenState extends ConsumerState<PrivacyAndPolicyScreen> {
  @override
  Widget build(BuildContext context) {
    final appInfoData = ref.watch(getAppInfoStateNotifier);
    return Scaffold(
      appBar: CustomAppBar(
        appContext: context,
        title: "Privacy & PolicyScreen",
        navigated: true,
        isCenter: false,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            appInfoData.data?.data?.clientAppInfo?.termsConditions ?? "",
            style: AppTheme.styleWithTextAppBlackAdelleSansExtendedFonts14w700,
          ),
        ),
      ),
    );
  }
}
