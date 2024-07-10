
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../Data/Models/ItemSelector.dart';
import '../../Doman/useCases/SearchFilterUseCase.dart';

final searchFilterStateNotifier = StateNotifierProvider.autoDispose<SearchFilterUseCase,List<ItemSelector>>((ref) => SearchFilterUseCase());