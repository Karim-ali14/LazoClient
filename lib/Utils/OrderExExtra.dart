import 'package:lazo_client/Constants/Eunms.dart';

import '../Data/Network/lib/api.dart';

extension OrderExe on ClientOrderDetails{
  String getStoreName(){

    return isSingleProvider() ? orderItems.first.provider?.name ?? "" : "More stores" ;
  }

  String getCancellationItemsNames(){
    String itemName = rejectedOrderItems??"" ;


    return itemName ;
  }

  String? getStoreImage(){

    return isSingleProvider() ? orderItems.first.provider?.imagePath : null ;
  }

  bool isCanceledOrder(){
    return statusId == 9 || statusId == 10 || statusId == 11 || statusId == 12 ;
  }
  bool isFinishedOrder(){
    return statusId == 8 ;
  }

  bool isSingleProvider(){
    return orderFamily == "ready_made" ;
  }
}