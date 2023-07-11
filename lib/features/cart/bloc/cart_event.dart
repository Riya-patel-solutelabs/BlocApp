part of 'cart_bloc.dart';

@immutable
abstract class CartEvent {}

class CartInitialEvent extends CartEvent{}

class CartRemoveFromCartEvent  extends CartEvent{
  final HomeProductDataModel productDataModel;

  CartRemoveFromCartEvent(this.productDataModel);
  
}



