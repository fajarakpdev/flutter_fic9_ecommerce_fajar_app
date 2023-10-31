// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_fic9_ecommerce_app_fajar/common/extensions/string_ext.dart';
import 'package:flutter_fic9_ecommerce_app_fajar/data/models/responses/product_resnponse_model.dart';

class CartModel {
  final Product product;
  int quantity;

  CartModel({
    required this.product,
    this.quantity = 0,
  });

  String get priceFormat => product.attributes.price.currencyFormatRp;
}
