import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lazo_client/Data/Models/StateModel.dart';
import 'package:lazo_client/Doman/CommenProviders/ApiProvider.dart';
import 'package:lazo_client/Doman/useCases/PublicUseCases.dart';
import '../../Data/Network/lib/api.dart';
import '../../Doman/useCases/AuthUaseCases.dart';

final getCities =
    StateNotifierProvider<CitiesUseCases, StateModel<CitiesResponse?>>(
        (ref) => CitiesUseCases(ref, ref.read(publicApi)));

final uploadFilesStateNotifiers =
    StateNotifierProvider<UploadFilesUseCase, StateModel<Object>>(
        (ref) => UploadFilesUseCase(ref, ref.read(publicApi)));
