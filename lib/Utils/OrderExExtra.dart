import '../Data/Network/lib/api.dart';

extension OrderExe on ClientOrderDetails{
  String getStoreName(){
    bool isSingleProvider = orderFamily == "ready_made" ;
    // var productId = orderItems.first.productId;
    // for (var order in orderItems) {
    //   if(productId != order.productId){
    //     isSingleProvider = false;
    //   }
    // }
    return isSingleProvider ? orderItems.first.provider?.name ?? "" : "More stores" ;
  }

  String getCancellationItemsNames(){
    String itemName = rejectedOrderItems??"" ;


    return itemName ;
  }

  String? getStoreImage(){
    bool isSingleProvider = orderFamily == "ready_made" ;
    // var productId = orderItems.first.productId;
    // for (var order in orderItems) {
    //   if(productId != order.productId){
    //     isSingleProvider = false;
    //   }
    // }
    return isSingleProvider ? orderItems.first.provider?.imagePath : null ;
  }
}