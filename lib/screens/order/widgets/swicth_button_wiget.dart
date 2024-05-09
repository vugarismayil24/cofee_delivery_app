import 'package:flutter/material.dart';

class SwicthButtonWidget extends StatelessWidget {
  const SwicthButtonWidget({
    super.key,

  });



  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          alignment: Alignment.center,
          width: 153.5,
          height: 40,
          decoration: const BoxDecoration(
              color: Color(0xffC67C4E),
              borderRadius: BorderRadius.all(Radius.circular(10))),
          child: const Text(
            "Delivery",
            style: TextStyle(
                color: Color(0xffffffff),
                fontSize: 16,
                fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          alignment: Alignment.center,
          width: 153.5,
          height: 48,
          child: const Text(
            "Pick Up",
            style: TextStyle(
              color: Color(0xff2F2D2C),
              fontSize: 16,
            ),
          ),
        ),
      ],
    );
  }
}
