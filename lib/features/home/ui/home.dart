
import 'package:blocdemoapp/features/home/ui/product_tile_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../routes/app_routes_constants.dart';
import '../bloc/home_bloc.dart';

///home class for ui
class Home extends StatefulWidget {
  ///default constructor
  const Home({super.key});

  @override
  State<StatefulWidget> createState() => _Home();
}

class _Home extends State<Home> {
  @override
  void initState() {
    homeBloc.add(HomeInitialEvent());
    super.initState();
  }

  final HomeBloc homeBloc = HomeBloc();

  @override
  Widget build(BuildContext context) => BlocConsumer<HomeBloc, HomeState>(
      bloc: homeBloc,
      listenWhen: (HomeState previous, HomeState current) =>
          current is HomeActionState,
      buildWhen: (HomeState previous, HomeState current) =>
          current is! HomeActionState,
      listener: (BuildContext context, HomeState state) {
        if (state is HomeNavigateToWishlistPageActionState) {
          GoRouter.of(context).pushNamed(AppRouteConstants.wishlist);
        } else if (state is HomeNavigateToCartPageActionState) {
          GoRouter.of(context).pushNamed(AppRouteConstants.cart);
        } else if (state is HomeProductItemCartActionState) {
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text('Item added to Cart')));
        }else if(state is HomeProductItemWishlistActionState){
          ScaffoldMessenger.of(context)
              .showSnackBar(const SnackBar(content: Text('Item added to Wishlist')));
        }
      },
      builder: (BuildContext context, HomeState state) {
        switch (state.runtimeType) {
          case HomeLoadingState:
            return const Scaffold(
              body: Center(
                  child: CircularProgressIndicator(
                color: Colors.blue,
              )),
            );

          case HomeLoadedSuccessState:
            final successState = state as HomeLoadedSuccessState;
            return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.teal,
                title: const Text('Grocery App'),
                actions: [
                  IconButton(
                      onPressed: () {
                        homeBloc.add(HomeWishlistButtonNavigateClickedEvent());
                      },
                      icon: const Icon(Icons.favorite_border)),
                  const SizedBox(
                    width: 10,
                  ),
                  IconButton(
                      onPressed: () {
                        homeBloc.add(HomeCartButtonNavigateClickedEvent());
                      },
                      icon: const Icon(Icons.shopping_bag_outlined))
                ],
              ),
              body: ListView.builder(
                  itemCount: successState.products.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ProductTileWidget(
                      productDataModel: successState.products[index],
                      homeBloc: homeBloc,
                    );
                  }),
            );

          case HomeErrorState:
            return const Scaffold(
              body: Center(
                  child: Text(
                'Error',
                style: TextStyle(color: Colors.red, fontSize: 20),
              )),
            );

          default:
            return const SizedBox();
        }
      });
}
