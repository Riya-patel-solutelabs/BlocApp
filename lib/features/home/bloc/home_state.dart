part of 'home_bloc.dart';

@immutable
abstract class HomeState {}

abstract class HomeActionState extends HomeState {}

class HomeInitial extends HomeState {}


class HomeLoadingState extends HomeState {}

class HomeLoadedSuccessState extends HomeState {
  ///list of product result
  final List<HomeProductDataModel> products;

  ///default constructor
  HomeLoadedSuccessState({required this.products});
}

class HomeErrorState extends HomeState {}

class HomeNavigateToWishlistPageActionState extends HomeActionState {}

class HomeNavigateToCartPageActionState extends HomeActionState {}


class HomeProductItemWishlistActionState extends HomeActionState{

}

class HomeProductItemCartActionState extends HomeActionState{}


