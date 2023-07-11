
import 'package:flutter/material.dart';

import '../bloc/home_bloc.dart';
import '../models/home_product_data_model.dart';

class ProductTileWidget extends StatelessWidget {
  final HomeProductDataModel productDataModel;

  final HomeBloc homeBloc;
  const ProductTileWidget({required this.productDataModel, required this.homeBloc});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(10)),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 200,
            width: double.infinity,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(productDataModel.imageUrl),
                    fit: BoxFit.fill
                    )),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            productDataModel.name,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold
            ),
          ),
          Text(productDataModel.description),
          const SizedBox(
            height: 20,
          ),
          Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '\$ '+productDataModel.price.toString(),
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold
                ),
              ),

              Row(children: [
                 IconButton(
                      onPressed: () {
                        homeBloc.add(HomeProductWishlistButtonClickedEvent(
                          clickedProduct: productDataModel)
                        );
                      },
                      icon: const Icon(Icons.favorite_border)),
                  const SizedBox(
                    width: 10,
                  ),
                  IconButton(
                      onPressed: () {
                        homeBloc.add(HomeProductCartButtonClickedEvent(
                          clickedProduct: productDataModel
                        ));
                      },
                      icon: const Icon(Icons.shopping_bag_outlined))
              ],)
            ],
          ),
          
        ],
      ),
    );
  }
}
