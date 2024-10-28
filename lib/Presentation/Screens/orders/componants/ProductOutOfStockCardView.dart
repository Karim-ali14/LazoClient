import 'package:flutter/cupertino.dart';
import 'package:lazo_client/Presentation/Theme/AppTheme.dart';

class ProductOutOfStockCardView extends StatefulWidget {
  final Color? backgroundColor;
  final String description;
  const ProductOutOfStockCardView({super.key, required this.description,this.backgroundColor});

  @override
  State<ProductOutOfStockCardView> createState() => _ProductOutOfStockCardViewState();
}

class _ProductOutOfStockCardViewState extends State<ProductOutOfStockCardView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 16),
      height: 118,
      decoration: BoxDecoration(
        color: widget.backgroundColor ?? CupertinoColors.white,
        borderRadius: BorderRadius.circular(4),
        border: Border.all(
          color: AppTheme.appGrey6,
          width: 1
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(widget.description,
          style: AppTheme.styleWithTextBlackAdelleSansExtendedFonts14w500,)
        ],
      ),
    );
  }
}
