import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lazo_client/Constants/Assets.dart';
import 'package:lazo_client/Presentation/Widgets/AppTextField.dart';
import 'package:lazo_client/Presentation/Widgets/SvgIcons.dart';
import 'package:lazo_client/Utils/Extintions.dart';

import '../../Localization/Keys.dart';
import '../Theme/AppTheme.dart';
import 'AppButton.dart';

typedef OnTextChangeListener = Function(String);

class AppSearchBarWithFilter extends StatefulWidget {
  final int? delay;
  final bool hasFilter;
  final VoidCallback onFilterClick;
  final VoidCallback? onSearchClick;
  final OnTextChangeListener? onTextChangeListener;
  final TextEditingController? controller;
  final bool? enableSearch;
  final Widget? prefixIcon;
  final int? numberOfFilterItems;
  final Color? background;
  final Color? contentColor;
  final Color? shadowColor;
  final double? blurRadius;
  const AppSearchBarWithFilter(
      {super.key,
      required this.hasFilter,
      required this.onFilterClick,
      this.onTextChangeListener,
      this.delay,
      this.enableSearch = true,
      this.onSearchClick,
      this.controller,
      this.prefixIcon,
      this.numberOfFilterItems,
      this.background = Colors.white,
      this.shadowColor,
      this.blurRadius,
      this.contentColor});

  @override
  State<AppSearchBarWithFilter> createState() => _AppSearchBarWithFilterState();
}

class _AppSearchBarWithFilterState extends State<AppSearchBarWithFilter> {
  final TextEditingController textEditingController = TextEditingController();
  Timer? _timer;

  @override
  void dispose() {
    _timer?.cancel(); // Cancel the timer when disposing the widget
    super.dispose();
  }

  void executeAfterDelay(value) {
    _timer?.cancel(); // Cancel previous timer if it exists

    _timer = Timer(Duration(seconds: widget.delay ?? 0), () {
      widget.onTextChangeListener?.call(value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: widget.background,
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: widget.enableSearch == false
                    ? InkWell(
                        onTap: () {
                          widget.onSearchClick?.call();
                        },
                        child: TextField(
                          controller: widget.controller,
                          readOnly: widget.enableSearch == false,
                          enabled: widget.enableSearch,
                          style: AppTheme
                              .styleWithTextBlackAdelleSansExtendedFonts14w400,
                          decoration: InputDecoration(
                              fillColor: widget.background,
                              filled: true,
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 16),
                              labelText: "Search",
                              labelStyle: AppTheme
                                  .styleWithTextAppGrey15AdelleSansExtendedFonts14w400,
                              border: InputBorder.none,
                              prefixIcon:
                                  widget.prefixIcon ?? SVGIcons.searchIcon()),
                          onChanged: (value) {
                            executeAfterDelay(value);
                          },
                        ),
                      )
                    : TextField(
                        controller: widget.controller,
                        readOnly: widget.enableSearch == false,
                        enabled: widget.enableSearch,
                        style: AppTheme
                            .styleWithTextBlackAdelleSansExtendedFonts14w400
                            .copyWith(
                                color: widget.contentColor ?? Colors.black),
                        decoration: InputDecoration(
                            fillColor: widget.background,
                            filled: true,
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 16),
                            labelText: "Search",
                            labelStyle: AppTheme
                                .styleWithTextAppGrey15AdelleSansExtendedFonts14w400,
                            border: InputBorder.none,
                            prefixIcon:
                                widget.prefixIcon ?? SVGIcons.searchIcon(
                                  color: widget.contentColor
                                ),
                            suffixIcon: widget.hasFilter
                                ? InkWell(
                                    onTap: () {
                                      widget.onFilterClick.call();
                                    },
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        SVGIcons.filterIcon(
                                          widget.contentColor
                                        ),
                                        (widget.numberOfFilterItems ?? 0) > 0
                                            ? Container(
                                                decoration: const BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: AppTheme.appRedColor,
                                                ),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(5.5),
                                                  child: Text(
                                                    "${widget.numberOfFilterItems}",
                                                    style: AppTheme
                                                        .styleWithTextWhiteAdelleSansExtendedFonts10w400,
                                                  ),
                                                ),
                                              )
                                            : SizedBox(),
                                      ],
                                    ))
                                : SizedBox()),
                        onChanged: (value) {
                          executeAfterDelay(value);
                        },
                      ),
              ),
              widget.hasFilter
                  ? SizedBox(
                      width: 8,
                    )
                  : SizedBox(),
            ],
          ),
          Container(
            // Height of the divider
            decoration: BoxDecoration(
              color: Colors.white, // Background color
              boxShadow: [
                BoxShadow(
                  color: widget.shadowColor ??
                      Colors.black.withOpacity(1), // Shadow color
                  blurRadius: widget.blurRadius ?? .8, // Blur effect
                  spreadRadius: .1, // Spread effect
                  offset: const Offset(0, .5), // Shadow position
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
