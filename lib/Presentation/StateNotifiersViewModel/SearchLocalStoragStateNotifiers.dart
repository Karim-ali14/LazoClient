import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchLocalStorage extends StateNotifier<List<String>>{
  SearchLocalStorage(super.state);
  void updateList(List<String> newState){
    state = [];
    state = newState;
  }
  void clearData(){
    state = [];
  }
}

final productSearchLocalStorageStateNotifier = StateNotifierProvider.autoDispose<SearchLocalStorage,List<String>>(
    (ref) => SearchLocalStorage([])
);

final serviceSearchLocalStorageStateNotifier = StateNotifierProvider.autoDispose<SearchLocalStorage,List<String>>(
    (ref) => SearchLocalStorage([])
);

final sellerSearchLocalStorageStateNotifier = StateNotifierProvider.autoDispose<SearchLocalStorage,List<String>>(
    (ref) => SearchLocalStorage([])
);