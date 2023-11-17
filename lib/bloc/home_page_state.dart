part of 'home_page_bloc.dart';

@immutable
abstract class HomePageState {}

class HomePageInitial extends HomePageState {}

class Loading extends HomePageState{}

class Loaded extends HomePageState{
  List<CryptoCurrencyList> cryptolist;
  var defaultindex;

  Loaded(this.cryptolist, this.defaultindex);
}

class Error extends HomePageState{

  final String error;

  Error(this.error);
}
