import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:task/src/core/extension/extension.dart';
import 'package:task/src/feature/home/domain/entity/product_entity.dart';

@RoutePage()
class DetailView extends StatefulWidget {
  final ProductEntity product;
  const DetailView({
    super.key,
    required this.product,
  });

  @override
  State<DetailView> createState() => _DetailViewState();
}

class _DetailViewState extends State<DetailView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 200.0,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Padding(
                padding: const EdgeInsets.only(
                  right: 120,
                  left: 120,
                  top: 50,
                ),
                child: Image.network(
                  widget.product.image!,
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 50),
                  Text(
                    widget.product.title!,
                    style: context.textTheme.labelLarge,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    widget.product.category!,
                    style: context.textTheme.labelLarge,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "${widget.product.price}\$",
                    style: context.textTheme.labelLarge!.copyWith(
                      color: Colors.red,
                    ),
                  ),
                  const SizedBox(height: 50),
                  Text(
                    "Description:",
                    style: context.textTheme.labelLarge,
                  ),
                  const SizedBox(height: 10),
                  Text(widget.product.description!),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
