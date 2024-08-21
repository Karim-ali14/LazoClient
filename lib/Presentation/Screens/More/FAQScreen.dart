import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../Constants/Constants.dart';
import '../../Widgets/CustomAppBar.dart';
import 'Componants/FAQItemCard.dart';

class FAQScreen extends StatefulWidget {
  const FAQScreen({super.key});

  @override
  State<FAQScreen> createState() => _FAQScreenState();
}

class _FAQScreenState extends State<FAQScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        appContext: context,
        title: "FAQ",
        navigated: true,
      ),
      body: SafeArea(
        child: Padding(
          padding:
              const EdgeInsets.symmetric(horizontal: defaultPaddingHorizontal),
          child: Column(
            children: [
              SizedBox(
                height: 32,
              ),
              FAQItemCard(
                title: '1. Lorem ipsum dolor sit amasvwet?',
                description: '',
              ),
              SizedBox(height: defaultPaddingHorizontal),
              FAQItemCard(
                title: '2. Lorem ipsum dolor sit amasvwet?',
                description: '',
              ),
              SizedBox(height: defaultPaddingHorizontal),
              FAQItemCard(
                title: '3. Lorem ipsum dolor sit amasvwet?',
                description: '',
              ),
              SizedBox(height: defaultPaddingHorizontal),
              FAQItemCard(
                title: '4. Lorem ipsum dolor sit amasvwet?',
                description: '',
              ),
              SizedBox(height: defaultPaddingHorizontal),
              FAQItemCard(
                title: '5. Lorem ipsum dolor sit amasvwet?',
                description: '',
              ),
              SizedBox(height: defaultPaddingHorizontal),
            ],
          ),
        ),
      ),
    );
  }
}
