import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:lazo_client/Presentation/Widgets/SvgIcons.dart';
import '../../../../Constants/Assets.dart';
import '../../../../Constants/Constants.dart';
import '../../../../Data/Network/lib/api.dart';
import '../../../Theme/AppTheme.dart';
import '../../../Widgets/CircleImage.dart';

class OrderRatingItem extends StatefulWidget {
  final ClientOrderDetailsOrderItemsInner? item;
  final ValueChanged<Map<String, dynamic>> onUpdate; // Callback to send data back

  const OrderRatingItem({super.key, this.item, required this.onUpdate});

  @override
  State<OrderRatingItem> createState() => _OrderRatingItemState();
}

class _OrderRatingItemState extends State<OrderRatingItem> {
  double _rating = 0;
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // widget.onItemClick.call(widget.item?.id?.toInt() ?? 0);
      },
      child: IntrinsicHeight(
        child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: AppTheme.appGrey8, width: 1)),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      clipBehavior: Clip.antiAlias,
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: Colors.white),
                      child: ImageView(
                        width: MediaQuery.of(context).size.width,
                        height: 122,
                        initialImg: widget.item?.product != null
                            ? widget.item?.product?.coverImagePath
                            : widget.item?.service?.coverImagePath,
                        placeHolder: placeholder,
                      ),
                    ),
                    const SizedBox(
                      width: defaultPaddingHorizontal,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width - 140,
                          child: Row(
                            children: [
                              Text(
                                widget.item?.product != null
                                    ? widget.item?.product?.name ?? ""
                                    : widget.item?.service?.name ?? "",
                                style: AppTheme
                                    .styleWithTextBlackAdelleSansExtendedFonts16w500,
                              ),
                              const Spacer(),
                              Text(
                                widget.item?.id?.toString() ?? "",
                                style: AppTheme
                                    .styleWithTextAppGrey7AdelleSansExtendedFonts14w400,
                                textAlign: TextAlign.end,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 2,
                        ),
                        widget.item?.selectedProductsListItemsNames
                                        .isNotEmpty ==
                                    true ||
                                widget.item?.selectedServicesListItemsNames
                                        .isNotEmpty ==
                                    true
                            ? const SizedBox(
                                height: 5,
                              )
                            : const SizedBox(),
                        SizedBox(
                          width: MediaQuery.of(context).size.width - 160,
                          child: Text(
                            "${widget.item?.product != null ? widget.item?.selectedProductsListItemsNames.join(", ") : widget.item?.selectedServicesListItemsNames.join(", ")}",
                            style: AppTheme
                                .styleWithTextAppGrey7AdelleSansExtendedFonts10w400,
                          ),
                        ),
                        widget.item?.selectedProductsListItemsNames
                                        .isNotEmpty ==
                                    true ||
                                widget.item?.selectedServicesListItemsNames
                                        .isNotEmpty ==
                                    true
                            ? const SizedBox(
                                height: 5,
                              )
                            : const SizedBox(),
                      ],
                    )
                  ],
                ),
                const SizedBox(
                  height: 24,
                ),
                RatingBar(
                  initialRating: 0,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  ratingWidget: RatingWidget(
                    full: SVGIcons.fullStarIcon(),
                    half: SVGIcons.halfStarIcon(),
                    empty: SVGIcons.emptyStarIcon(),
                  ),
                  itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                  onRatingUpdate: (rating) {
                    _rating = rating;
                    widget.onUpdate({
                      'rating': _rating,
                      'comment': controller.text,
                      'itemId': widget.item?.id ?? 0
                    });
                  },
                ),
                SizedBox(
                  height: 24,
                ),
                Container(
                  height: 112,
                  child: TextField(
                    controller: controller,
                    onChanged: (value) {
                      widget.onUpdate({
                        'rating': _rating,
                        'comment': value,
                        'itemId': widget.item?.id ?? 0
                      });
                    },
                    maxLines: null,
                    expands: true,
                    style: AppTheme.styleWithTextGray7AdelleSansExtendedFonts12w400,
                    textAlignVertical: TextAlignVertical.top,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4),
                        borderSide: BorderSide(
                          color: AppTheme.appGrey6,
                          width: 1,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4),
                        borderSide: BorderSide(
                          color: AppTheme.appGrey6,
                          width: 1,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4),
                        borderSide: BorderSide(
                          color: AppTheme.secondaryAppColorLight,
                          width: 1,
                        ),
                      ),
                      hintText: 'Enter your text here...',
                    ),
                  ),
                )
              ],
            )),
      ),
    );
  }
}
