import 'package:cofee_delivery_app/screens/home/home_screen.dart';
import 'package:flutter/material.dart';


void main() => runApp(const CofeeDeliveryApp());

class CofeeDeliveryApp extends StatelessWidget {
  const CofeeDeliveryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: HomeScreen(),
    );
  }
}
