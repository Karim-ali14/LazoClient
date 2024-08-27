import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lazo_client/Presentation/Theme/AppTheme.dart';

import '../../StateNotifiersViewModel/PublicStateNotifiers.dart';
import '../../Widgets/CustomAppBar.dart';

class TermsAndConditionsScreen extends ConsumerStatefulWidget {
  const TermsAndConditionsScreen({super.key});

  @override
  ConsumerState<TermsAndConditionsScreen> createState() => _TermsAndConditionsScreenState();
}

class _TermsAndConditionsScreenState extends ConsumerState<TermsAndConditionsScreen> {
  @override
  Widget build(BuildContext context) {
    final appInfoData = ref.watch(getAppInfoStateNotifier);
    return Scaffold(
      appBar: CustomAppBar(
        appContext: context,
        title: "Terms & Conditions",
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
