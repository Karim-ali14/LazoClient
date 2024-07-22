import '../../Constants/Eunms.dart';

class FilterData {
  final int? promotionSelected;
  final List<int>? categoriesIdsSelected;
  final List<int>? occasionsIdsSelected;
  final List<int>? ratingValueSelected;
  FilterData(
      {this.promotionSelected,
      this.categoriesIdsSelected,
      this.occasionsIdsSelected,
      this.ratingValueSelected});
}
