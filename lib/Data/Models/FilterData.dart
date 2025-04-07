import '../../Constants/Eunms.dart';

class FilterData {
  final int? promotionSelected;
  int? shipmentTypeSelected;
  String? priceFromSelected;
  String? priceToSelected;
  final List<int>? categoriesIdsSelected;
  final List<int>? occasionsIdsSelected;
  final List<int>? ratingValueSelected;
  FilterData(
      {this.promotionSelected,
      this.shipmentTypeSelected,
      this.categoriesIdsSelected,
      this.occasionsIdsSelected,
      this.ratingValueSelected,this.priceFromSelected, this.priceToSelected,});
}
