
import '../Data/Network/lib/api.dart';

extension CopyObject on Category{
  Category copyWith({bool? isChecked}) {
    return Category(
      id: id,
      name:name,
      imagePath:imagePath,
      isChecked: isChecked ?? this.isChecked,
    );
  }
}