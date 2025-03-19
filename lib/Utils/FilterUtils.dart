
import '../Data/Models/FilterData.dart';

int getNumberOfFilterItems(FilterData? filterData) {
  if (filterData == null) {
    print("FilterData is null");
    return 0;
  }

  bool shipmentSelected = filterData.shipmentTypeSelected != null;
  bool priceRangeSelected = filterData.priceToSelected != null && filterData.priceFromSelected != null;
  bool categoriesSelected = filterData.categoriesIdsSelected?.isNotEmpty == true;
  bool occasionsSelected = filterData.occasionsIdsSelected?.isNotEmpty == true;
  bool ratingSelected = filterData.ratingValueSelected?.isNotEmpty == true;

  // طباعة كل القيم للتحقق من حالة الفلاتر
  print("Shipment Selected: ${filterData.shipmentTypeSelected}");
  print("Price Range Selected: $priceRangeSelected");
  print("Categories Selected: $categoriesSelected");
  print("Occasions Selected: $occasionsSelected");
  print("Rating Selected: $ratingSelected");

  int count = [
    shipmentSelected,
    priceRangeSelected,
    categoriesSelected,
    occasionsSelected,
    ratingSelected,
  ].where((element) => element).length;

  print("Total Selected Filters: $count");
  return count;
}