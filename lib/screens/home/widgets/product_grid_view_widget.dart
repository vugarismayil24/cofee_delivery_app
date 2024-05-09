// ignore_for_file: prefer_const_constructors_in_immutables

import 'dart:math';

import 'package:flutter/material.dart';

class ProductsGridViewWidget extends StatelessWidget {
  late String activeCategory;
  ProductsGridViewWidget({super.key, required this.activeCategory});

  @override
  Widget build(BuildContext context) {
    List<String> characters0 = activeCategory.split("");
    List<String> characters = [];
    for (int i = 0; i < characters0.length; i++) {
      if (i == 0) {
        characters.add(characters0[i].toUpperCase());
      } else {
        characters.add(characters0[i]);
      }
    }
    activeCategory = characters.join();
    return GridView.builder(
        itemCount: 15,
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
            childAspectRatio: 1 / 1.6),
        itemBuilder: (context, index) {
          return Stack(
            children: [
              Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                    color: const Color(0xffffffff),
                    borderRadius: BorderRadius.circular(16)),
              ),
              Positioned(
                top: 4,
                left: 4,
                right: 4,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset(
                    height: 130,
                    "assets/products/${activeCategory.toLowerCase()}.png",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                top: 4,
                left: 4,
                child: Container(
                  padding: const EdgeInsets.only(
                      left: 8, right: 15, top: 6, bottom: 6),
                  width: 51,
                  height: 25,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.16),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(16),
                      bottomRight: Radius.circular(
                        16,
                      ),
                    ),
                  ),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.star,
                        color: Color(0xffFBBE21),
                        size: 10,
                      ),
                      Text(
                        ((Random().nextDouble() * 4) + 1).toStringAsFixed(1),
                        style: const TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w600,
                          color: Color(0xffffffff),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 52,
                left: 12,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      activeCategory,
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w600),
                    ),
                    const Text(
                      "with Chocolate",
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: 12,
                left: 12,
                right: 12,
                child: SizedBox(
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "\$ ${(Random().nextDouble() * 5 + Random().nextInt(5)).toStringAsFixed(2)}",
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Color(0xff2F4B4E),
                        ),
                      ),
                      Container(
                        width: 32,
                        height: 32,
                        decoration: BoxDecoration(
                          color: const Color(0xffC67C4E),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Icon(
                          Icons.add,
                          color: Color(0xffffffff),
                          size: 16,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          );
        });
  }
}
