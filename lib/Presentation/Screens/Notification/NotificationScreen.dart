import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lazo_client/Doman/CommenProviders/ApiProvider.dart';
import 'package:lazo_client/Presentation/Widgets/CustomAppBar.dart';
import 'package:lazo_client/Presentation/Widgets/EmptyDataView.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../Constants.dart';
import '../../../Data/Models/StateModel.dart';
import '../../../Data/Network/lib/api.dart';
import '../../../Localization/Keys.dart';
import '../../StateNotifiersViewModel/NotificationStateNotifiers.dart';
import 'componants/NotificationDateView.dart';
import 'componants/NotificationItemView.dart';

class NotificationScreen extends ConsumerStatefulWidget {
  const NotificationScreen({super.key});

  @override
  ConsumerState<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends ConsumerState<NotificationScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ref.read(showNotificationStateNotifiers.notifier).getNotification();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final notificationState = ref.watch(showNotificationStateNotifiers);
    handleState(makeNotificationReadStateNotifiers, showLoading: true,
        onSuccess: (res) {
      if (res.data?.data?.type == "order") {
        ref.read(showNotificationStateNotifiers.notifier).getNotification();
        navigateToOrderDetails(res.data?.data?.orderId.toString() ?? "");
      }
    });

    return Scaffold(
        appBar: CustomAppBar(
          appContext: context,
          title: "Notifications",
          isCenter: false,
          navigated: true,
        ),
        body: SafeArea(
            child: notificationState.state == DataState.EMPTY
                ? Expanded(
                    child: Center(child: Text("there is any notification yet")))
                : ListView.builder(
                    itemCount: notificationState.state == DataState.LOADING
                        ? 10
                        : ref
                            .watch(showNotificationStateNotifiers.notifier)
                            .notificationDates
                            .length,
                    itemBuilder: (context, index) {
                      if (notificationState.state == DataState.LOADING) {
                        return Skeletonizer(
                          enabled: notificationState.state == DataState.LOADING,
                          child: NotificationItemView(
                            notification:
                                ClientNotification(
                                    isRead: 1),
                            onNotificationItemClick: (notificationItem) {},
                          ),
                        );
                      } else if (ref
                          .watch(showNotificationStateNotifiers.notifier)
                          .notificationDates[index] is String) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8.0, vertical: 20.0),
                          child: NotificationDateView(
                              date: ref
                                  .watch(
                                      showNotificationStateNotifiers.notifier)
                                  .notificationDates[index]),
                        );
                      } else if (ref
                              .watch(showNotificationStateNotifiers.notifier)
                              .notificationDates[index]
                          is ClientNotification) {
                        return NotificationItemView(
                          notification:
                              (ref
                                      .watch(showNotificationStateNotifiers
                                          .notifier)
                                      .notificationDates[index]!
                                  as ClientNotification),
                          onNotificationItemClick: (notificationItem) {
                            if (notificationItem?.type == "order") {
                              if (notificationItem?.isRead == 0) {
                                ref
                                    .read(makeNotificationReadStateNotifiers
                                        .notifier)
                                    .readANotification(
                                        notificationItem?.id.toString() ?? "0");
                              } else {
                                navigateToOrderDetails(
                                    notificationItem?.orderId.toString() ??
                                        "0");
                              }
                            }
                          },
                        );
                      }
                    })));
  }

  void navigateToOrderDetails(String orderId) {
    context.push(R_OrderDetails, extra: {orderIdKey: orderId});
  }
}
