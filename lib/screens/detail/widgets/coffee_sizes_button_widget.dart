// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class CoffeeSizesButtonwidget extends StatelessWidget {
  final String size;
  final bool isSelected;
  final Function() onTap;
  const CoffeeSizesButtonwidget(
      {super.key,
      required this.size,
      required this.isSelected,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      child: Container(
        alignment: Alignment.center,
        width: 100,
        height: 50,
        margin: EdgeInsets.all(7),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
        decoration: BoxDecoration(
          color: isSelected ? Color(0xffFFF5EE) : Color(0xffFFFFFF),
          border: Border.all(
              color: isSelected ? Color(0xffC67C4E) : Color(0xffDEDEDE)),
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
        child: Text(
          size,
          style: TextStyle(
            color: isSelected ? Color(0xffC67C4E) : Color(0xff000000),
          ),
        ),
      ),
    );
  }
}
