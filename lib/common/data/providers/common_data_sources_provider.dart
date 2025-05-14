
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/network/http_operation.dart';
import '../data_sources/common_data_sources.dart';

final httpOperationsProvider = Provider<HttpOperations>((ref)  {
  return HttpOperations(ref);
});

final commonDataSourcesProvider = Provider<CommonRemoteDataSource>((ref){
  return CommonRemoteDataSource(ref.read(httpOperationsProvider));
});