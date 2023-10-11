// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:grocery_bloc/features/home/bloc/home_bloc_bloc.dart';
import 'package:grocery_bloc/features/home/model/product_model.dart';

class ProductTile extends StatelessWidget {
  final ProductModel productModel;
  final HomeBlocBloc homeBlocBloc;
  const ProductTile({
    Key? key,
    required this.productModel,
    required this.homeBlocBloc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 200,
            width: double.maxFinite,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(productModel.imageUrl),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            productModel.name,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(productModel.description),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "\$ ${productModel.price}",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      homeBlocBloc.add(HomeProductWishlistButtonClickedEvent(
                        clickedProduct: productModel,
                      ));
                    },
                    icon: Icon(Icons.favorite_border),
                  ),
                  IconButton(
                    onPressed: () {
                      homeBlocBloc.add(HomeProductCartButtonClickedEvent(
                        clickedProduct: productModel,
                      ));
                    },
                    icon: Icon(Icons.shopping_basket_outlined),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
