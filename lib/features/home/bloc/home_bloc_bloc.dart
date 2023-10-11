import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:grocery_bloc/data/cart_items.dart';
import 'package:grocery_bloc/data/grocery_data.dart';
import 'package:grocery_bloc/data/wishlist_items.dart';
import 'package:grocery_bloc/features/home/model/product_model.dart';
import 'package:meta/meta.dart';

part 'home_bloc_event.dart';
part 'home_bloc_state.dart';

class HomeBlocBloc extends Bloc<HomeBlocEvent, HomeBlocState> {
  HomeBlocBloc() : super(HomeBlocInitial()) {
    on<HomeInitalEvent>(homeInitialEvent);
    on<HomeProductWishlistButtonClickedEvent>(
        homeProductWishlistButtonClickedEvent);
    on<HomeProductCartButtonClickedEvent>(homeProductCartButtonClickedEvent);
    on<HomeWishlistButtonNavigateEvent>(homeWishlistButtonNavigateEvent);
    on<HomeCartButtonNavigateEvent>(homeCartButtonNavigateEvent);
  }

  FutureOr<void> homeInitialEvent(
      HomeInitalEvent event, Emitter<HomeBlocState> emit) async {
    emit(HomeLoadingState());
    await Future.delayed(Duration(seconds: 3));
    try {
      emit(
        HomeLoadedSuccessState(
          products: GroceryData.groceryList
              .map((e) => ProductModel.fromMap(e))
              .toList(),
        ),
      );
    } catch (e) {
      emit(HomeErrorState());
      log(e.toString());
    }
  }

  FutureOr<void> homeProductWishlistButtonClickedEvent(
      HomeProductWishlistButtonClickedEvent event,
      Emitter<HomeBlocState> emit) {
    log("Wishlist Product clicked");
    wishlistItems.add(event.clickedProduct);
    emit(HomeProductItemWishlistedActionState());
  }

  FutureOr<void> homeProductCartButtonClickedEvent(
      HomeProductCartButtonClickedEvent event, Emitter<HomeBlocState> emit) {
    log("Cart Product clicked");
    cartItems.add(event.clickedProduct);
    emit(HomeProductItemCartedActionState());
  }

  FutureOr<void> homeWishlistButtonNavigateEvent(
      HomeWishlistButtonNavigateEvent event, Emitter<HomeBlocState> emit) {
    log("Wishlist Navigate Clicked");
    emit(HomeNavigateToWishlistScreenActionState());
  }

  FutureOr<void> homeCartButtonNavigateEvent(
      HomeCartButtonNavigateEvent event, Emitter<HomeBlocState> emit) {
    log("Cart Navigate Clicked");
    emit(HomeNavigateToCartScreenActionState());
  }
}
