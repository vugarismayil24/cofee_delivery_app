import 'package:cofee_delivery_app/model/coffee_model.dart';
import 'package:cofee_delivery_app/screens/detail/widgets/detail_app_bar.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  final CoffeeModel product;
  const DetailScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffE4EDFA),
      appBar: const DetailAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.network(
                product.imageUrl.toString(),
                width: double.infinity,
                height: 250,
                fit: BoxFit.fitWidth,
                filterQuality: FilterQuality.low,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
