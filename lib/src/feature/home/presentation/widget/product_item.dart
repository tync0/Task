import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:task/src/config/router/app_router.dart';
import 'package:task/src/core/extension/extension.dart';
import 'package:task/src/feature/home/domain/entity/product_entity.dart';

class ProductItem extends StatelessWidget {
  final ProductEntity product;
  const ProductItem({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(24),
      onTap: () {
        context.router.push(
          DetailRoute(product: product),
        );
      },
      child: Container(
        width: context.mediaQueryWidth,
        height: 140,
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: Colors.black),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              height: 90,
              width: 90,
              child: Image.network(
                product.image!,
                fit: BoxFit.fill,
              ),
            ),
            const SizedBox(width: 30),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    product.title!,
                    style: context.textTheme.labelLarge,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 10),
                  Text("${product.price}\$"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
