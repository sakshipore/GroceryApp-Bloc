// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'home_bloc_bloc.dart';

@immutable
sealed class HomeBlocState {}

//? States are of two types
//? Simple states that are going to build the UI
//? Actionable states that are going to perform some action

abstract class HomeActionState extends HomeBlocState {}

final class HomeBlocInitial extends HomeBlocState {}

class HomeLoadingState extends HomeBlocState {}

class HomeLoadedSuccessState extends HomeBlocState {
  final List<ProductModel> products;
  HomeLoadedSuccessState({
    required this.products,
  });
}

class HomeErrorState extends HomeBlocState {}

class HomeNavigateToWishlistScreenActionState extends HomeActionState {}

class HomeNavigateToCartScreenActionState extends HomeActionState {}

class HomeProductItemWishlistedActionState extends HomeBlocState {}

class HomeProductItemCartedActionState extends HomeBlocState {}
