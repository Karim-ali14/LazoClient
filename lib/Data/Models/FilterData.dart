import '../../Constants/Eunms.dart';

class FilterData {
  final int? promotionSelected;
  final int? shipmentTypeSelected;
  final String? priceFromSelected;
  final String? priceToSelected;
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
