import '../../Constants/Eunms.dart';

class FilterData {
  final int? promotionSelected;
  final int? priceFromSelected;
  final int? priceToSelected;
  final List<int>? categoriesIdsSelected;
  final List<int>? occasionsIdsSelected;
  final List<int>? ratingValueSelected;
  FilterData(
      {this.promotionSelected,
      this.categoriesIdsSelected,
      this.occasionsIdsSelected,
      this.ratingValueSelected,this.priceFromSelected, this.priceToSelected,});
}
