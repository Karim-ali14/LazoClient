import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../Data/Models/StateModel.dart';
import '../../Data/Network/lib/api.dart';
import '../../Doman/CommenProviders/ApiProvider.dart';
import '../../Doman/useCases/NotificationUseCase.dart';

final showNotificationStateNotifiers = StateNotifierProvider.autoDispose<
        GetNotificationStateNotifiers,
        StateModel<ShowNotifications2200Response>>(
    (ref) => GetNotificationStateNotifiers(ref, ref.read(notificationApi)));


final makeNotificationReadStateNotifiers = StateNotifierProvider.autoDispose<
        MakeNotificationRead,
        StateModel<ReadANotification122200Response>>(
    (ref) => MakeNotificationRead(ref, ref.read(notificationApi)));
