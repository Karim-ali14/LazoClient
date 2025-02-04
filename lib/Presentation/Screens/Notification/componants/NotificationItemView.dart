import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lazo_client/Utils/DateUtils.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../Constants/Constants.dart';
import '../../../../Data/Network/lib/api.dart';
import '../../../Theme/AppTheme.dart';
import '../../../Widgets/SvgIcons.dart';

typedef OnNotificationItemClick = Function(ClientNotification?);
class NotificationItemView extends StatefulWidget {
  final ClientNotification? notification;
  final OnNotificationItemClick onNotificationItemClick;
  const NotificationItemView(
      {super.key, required this.notification, required this.onNotificationItemClick});

  @override
  State<NotificationItemView> createState() => _NotificationItemViewState();
}

class _NotificationItemViewState extends State<NotificationItemView> {
  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: InkWell(
        onTap: (){
          if(widget.notification != null ){
            widget.onNotificationItemClick.call(widget.notification);
          }
        },
        child: Container(
          padding:
              const EdgeInsets.symmetric(horizontal: defaultPaddingHorizontal),
          color: widget.notification?.isRead == 1 ? Colors.white : AppTheme.appGrey12,
          child: Column(
            children: [
              const SizedBox(
                height: 18,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Skeleton.replace(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Image.network(
                          fit: BoxFit.cover,
                          widget.notification?.imagePath ??"",
                          width: 42,
                          height: 42, errorBuilder: (
                        BuildContext context,
                        Object error,
                        StackTrace? stackTrace,
                      ) {
                        return SVGIcons.defaultUserIcon();
                      }),
                    ),replacement: Icon(Icons.abc,size: 42,),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    child: Text(
                      "${(widget.notification?.notification?? "lskdjflksadjflk sdf sdjf kjd fkjsa dlkfj sldfsl dfjjsdf lajs dfljsdflkj ")}",
                      style: AppTheme
                          .styleWithTextBlackAdelleSansExtendedFonts16w400,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(
                    "${(widget.notification?.createdAt?.hhMm()??"sklj")}",
                    style:
                        AppTheme.styleWithTextGray13AdelleSansExtendedFonts11w400,
                  )
                ],
              ),
              const SizedBox(
                height: 18,
              ),
              const Divider(
                height: 1,
                color: AppTheme.appGrey11,
              )
            ],
          ),
        ),
      ),
    );
  }
}
