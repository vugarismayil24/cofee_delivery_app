import 'package:flutter/material.dart';

import '../screens/home/widgets/product_grid_view_widget.dart';

List<Widget> homePages = [
  ProductsGridViewWidget(
    activeCategory: "Cappucino",
  ),
  ProductsGridViewWidget(
    activeCategory: "Machiato",
  ),
  ProductsGridViewWidget(
    activeCategory: "Latte",
  ),
  ProductsGridViewWidget(
    activeCategory: "Americano",
  ),
  ProductsGridViewWidget(
    activeCategory: "Espresso",
  ),
  ProductsGridViewWidget(
    activeCategory: "Turkish",
  ),
  ProductsGridViewWidget(
    activeCategory: "Mocha",
  )
];
PageController pageController = PageController();
