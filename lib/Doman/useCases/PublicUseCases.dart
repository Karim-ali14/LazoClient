import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lazo_client/Data/Models/StateModel.dart';
import 'package:lazo_client/Data/Network/lib/api.dart';
import 'package:lazo_client/Doman/CommenProviders/ApiProvider.dart';

class CitiesUseCases extends StateNotifier<StateModel<CitiesResponse?>>{
  final Ref ref;
  final PublicApi publicApi;
  CitiesUseCases(this.ref, this.publicApi):super(StateModel());

  void getCities() async {
    state = StateModel.loading();
    request(()=> publicApi.citiesGet(lang: "ar"));
  }

}

class HomeDataUseCase extends StateNotifier<StateModel<ShowHome200Response>>{

  final Ref ref;
  final PublicApi publicApi;
  HomeDataUseCase(this.ref, this.publicApi):super(StateModel());

  void getHomeData() async {
    state = StateModel.loading();
    request(() => publicApi.showHome());
  }
}