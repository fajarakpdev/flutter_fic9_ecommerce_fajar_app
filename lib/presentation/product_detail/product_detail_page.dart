// ignore_for_file: public_member_api_docs, sort_constructors_first, library_prefixes
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../common/components/button.dart';
import '../../common/components/spaces.dart';
import '../../common/constants/colors.dart';
import '../../common/constants/images.dart' as localImages;
import '../../common/constants/variables.dart';
import '../../data/models/responses/product_resnponse_model.dart';
import '../cart/bloc/cart/cart_bloc.dart';
import '../cart/cart_page.dart';
import '../cart/widgets/cart_model.dart';
import '../home/widgets/image_slider.dart';
import 'widgets/product_description_widget.dart';
import 'widgets/product_info_widget.dart';

class ProductDetailPage extends StatefulWidget {
  const ProductDetailPage({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  EdgeInsets paddingHorizontal = const EdgeInsets.symmetric(horizontal: 20.0);
  final List<String> images = [
    localImages.Images.product3,
    localImages.Images.product3,
    localImages.Images.product3,
    localImages.Images.product3,
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail Produk"),
      ),
      body: ListView(
        children: [
          ImageSlider(
            items: [
              '${Variables.baseUrl}${widget.product.attributes.images.data.first.attributes.url}'
            ],
            isAsset: false,
          ),
          const SpaceHeight(16.0),
          ProductInfoWidget(
            padding: paddingHorizontal,
            product: widget.product,
            onWishlistTap: (isWishlist) {},
          ),
          const SpaceHeight(11.0),
          ProductDescriptionWidget(
              padding: paddingHorizontal,
              description: widget.product.attributes.description
              // 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquet arcu id tincidunt tellus arcu rhoncus, turpis nisl sed. Neque viverra ipsum orci, morbi semper. Nulla bibendum purus tempor semper purus. Ut curabitur platea sed blandit. Amet non at proin justo nulla et. A, blandit morbi suspendisse vel malesuada purus massa mi. Faucibus neque a mi hendrerit.',
              ),
          const SpaceHeight(11.0),
          Padding(
            padding: paddingHorizontal,
            child: Divider(
              color: ColorName.grey.withOpacity(0.18),
            ),
          ),
          const SpaceHeight(11.0),
        ],
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(color: Colors.grey.withOpacity(0.18)),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
              child: Button.filled(
                onPressed: () {
                  context.read<CartBloc>().add(CartEvent.add(
                      CartModel(product: widget.product, quantity: 1)));
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const CartPage()),
                  );
                },
                label: "Add to Cart",
              ),
            ),
            const SpaceWidth(15.0),
            Flexible(
              child: Button.outlined(
                onPressed: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //       builder: (context) => const PaymentPage()),
                  // );
                },
                label: "Buy Now",
                color: ColorName.light,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
