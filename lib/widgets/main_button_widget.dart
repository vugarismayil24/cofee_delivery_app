// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class MainButtonWidget extends StatelessWidget {
  final Color? color;
  final String buttontext;
  final double width;
  final double height;
  final Function() onTap;
  const MainButtonWidget({
    super.key,
    required this.buttontext,
    required this.width,
    required this.height,
    required this.onTap,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: width,
        height: height,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Text(
          buttontext,
          style: TextStyle(color: color),
        ),
      ),
    );
  }
}



// Future<CoffeeModel?>?getDetailProducts() async {
//   var url = 'https://www.jsonkeeper.com/b/S7ET';
//   Dio currentDio = Dio();
//   Response response = await currentDio.get(url);

//   try {
//     if (response.statusCode == 200) {
       
//       MainModel coffeeModel = MainModel.fromJson(response.data);
//     }
//   } catch (e) {
//     print("server error $e");
//   }
//   return null;
// }



