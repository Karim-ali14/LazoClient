
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/providers/common_data_sources_provider.dart';
import '../../data/repositories/common_repository_imp.dart';
import '../repositories/common_repository.dart';

final commonRepoProvider = Provider<CommonRepository>((ref)  {
  return CommonRepositoryImp(ref.watch(commonDataSourcesProvider));
});