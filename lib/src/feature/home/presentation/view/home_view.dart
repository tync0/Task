import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task/src/core/extension/extension.dart';
import 'package:task/src/feature/home/presentation/bloc/product_bloc.dart';
import 'package:task/src/feature/home/presentation/widget/product_item.dart';

import '../../domain/entity/product_entity.dart';

@RoutePage()
class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  String? _selectedCategory;
  @override
  void initState() {
    BlocProvider.of<ProductBloc>(context).add(GetProductsEvent());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          children: [
            const SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  context.l10n.category,
                  style: context.textTheme.headlineSmall,
                ),
                DropdownButton<String>(
                  hint: Text(context.l10n.selectCategory),
                  value: _selectedCategory,
                  items: [
                    'all',
                    'men\'s clothing',
                    'women\'s clothing',
                    'jewelery',
                    'electronics'
                  ]
                      .map((category) => DropdownMenuItem(
                            value: category,
                            child: Text(category),
                          ))
                      .toList(),
                  onChanged: (newValue) {
                    setState(() {
                      _selectedCategory = newValue;
                    });
                  },
                ),
              ],
            ),
            Expanded(
              child: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: BlocBuilder<ProductBloc, ProductState>(
                      builder: (context, state) {
                        if (state is ProductLoading) {
                          return const Center(
                              child: CircularProgressIndicator());
                        } else if (state is ProductSuccess) {
                          List<ProductEntity> products = state.products!
                              .where(
                                (product) =>
                                    _selectedCategory == null ||
                                    product.category == _selectedCategory ||
                                    _selectedCategory == 'all',
                              )
                              .toList();
                          return SizedBox(
                            height: products.length * 165,
                            child: ListView.separated(
                              physics: const NeverScrollableScrollPhysics(),
                              separatorBuilder: (context, index) =>
                                  const SizedBox(
                                height: 15,
                              ),
                              itemCount: products.length,
                              itemBuilder: (context, index) => ProductItem(
                                product: products[index],
                              ),
                            ),
                          );
                        } else {
                          return const SizedBox();
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
