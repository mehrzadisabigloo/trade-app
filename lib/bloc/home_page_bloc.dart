import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import '../model/CryptoCurrencyList.dart';
import '../model/Topcaps.dart';
import '../network/apiprovider.dart';

part 'home_page_event.dart';
part 'home_page_state.dart';

class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  HomePageBloc() : super(Loading()) {
    on<HomePageEvent>((event, emit) async {
      ApiProvider apiProvider = ApiProvider();
       var response;
       TopCaps datafuture;


      if(event is EventOne){
        emit(Loading());
        response = await apiProvider.getTopMarketCapData();
        datafuture = TopCaps.fromJson(response.data);
        if(response.statusCode == 200){
          emit(Loaded(datafuture.data!.cryptoCurrencyList as List<CryptoCurrencyList>,0));
        }
        else{
          emit(Error("check you connection"));
        }
      }

      else if(event is EventTwo){
        emit(Loading());
      response = await apiProvider.getTopGainerData();
      datafuture = TopCaps.fromJson(response.data);
      if(response.statusCode == 200){
      emit(Loaded(datafuture.data!.cryptoCurrencyList as List<CryptoCurrencyList>,1));
      }
      else{
      emit(Error("check you connection"));
      }
      }

      else{
        emit(Loading());
        response = await apiProvider.getTopLosersData();
        datafuture = TopCaps.fromJson(response.data);
        if(response.statusCode == 200){
          emit(Loaded(datafuture.data!.cryptoCurrencyList as List<CryptoCurrencyList>,2));
        }
        else{
          emit(Error("check you connection"));
        }
      }

    });
  }
}
