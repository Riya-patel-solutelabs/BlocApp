part of 'wishlist_bloc.dart';

@immutable
abstract class WishlistState {}

abstract class WishlistActionState extends WishlistState {}

class WishlistInitial extends WishlistState {}

class WishlistSuccessState extends WishlistState {
  final List<HomeProductDataModel> wishlistItems;

  WishlistSuccessState({required this.wishlistItems});
}

class WishlistRemoveActionState extends WishlistActionState {}
