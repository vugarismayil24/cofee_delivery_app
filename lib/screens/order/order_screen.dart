// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cofee_delivery_app/widgets/main_button_widget.dart';
import 'package:cofee_delivery_app/screens/order/widgets/swicth_button_wiget.dart';
import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';

import '../../model/coffee_model.dart';

class OrderScreen extends StatefulWidget {
  final CoffeeModel product;

  const OrderScreen({
    super.key,
    required this.product,
  });

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back,
          ),
        ),
        title: Text(
          "Order",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 315,
              height: 48,
              decoration: BoxDecoration(
                color: Color(0xffF2F2F2),
                borderRadius: BorderRadius.all(
                  Radius.circular(14),
                ),
              ),
              child: ToggleSwitch(
                minWidth: 160.0,
                cornerRadius: 20.0,
                activeBgColors: [
                  [Color(0xffC67C4E)],
                  [Color(0xffC67C4E)]
                ],
                activeFgColor: Colors.white,
                inactiveBgColor: Color(0xffF2F2F2),
                inactiveFgColor: Color(0xff000000),
                initialLabelIndex: 0,
                totalSwitches: 2,
                labels: ['Deliver', 'Pick Up'],
                radiusStyle: true,
                
              ),
            ),
            SizedBox(
              height: 24,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Delivery Address",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff2F2D2C),
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Text(
                  "Jl. Kpg Sutoyo",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff303336),
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  "Kpg. Sutoyo No. 620, Bilzen, Tanjungbalai.",
                  style: TextStyle(
                    fontSize: 12,
                    color: Color(0xff808080),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: SizedBox(
                    width: 280,
                    height: 27,
                    child: Row(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          width: 120,
                          height: 27,
                          decoration: BoxDecoration(
                              color: Color(0xffFFFFFF),
                              border: Border.all(
                                strokeAlign: 1,
                                color: Color(0xffDEDEDE),
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.edit,
                                size: 16,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Edit Address",
                                style: TextStyle(
                                  color: Color(0xff303336),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          alignment: Alignment.center,
                          width: 120,
                          height: 27,
                          decoration: BoxDecoration(
                              color: Color(0xffFFFFFF),
                              border: Border.all(
                                strokeAlign: 1,
                                color: Color(0xffDEDEDE),
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.file_present,
                                size: 16,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Add Note",
                                style: TextStyle(
                                  color: Color(0xff303336),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Divider(
                  thickness: 1,
                  color: Color(0xffEAEAEA),
                ),
              ],
            ),
            Container(
              width: 315,
              height: 55,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: Row(
                children: [
                  SizedBox(
                    width: 50,
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      child: Image.network(
                        "${widget.product.imageUrl}",
                        fit: BoxFit.cover,
                        height: 54,
                        width: 54,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${widget.product.title}",
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Text(
                          "${widget.product.subTitle}",
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              thickness: 4,
              color: Color(0xffEAEAEA),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: ListView(
                  children: [
                    Container(
                      width: 200,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(strokeAlign: 1, color: Colors.grey),
                        borderRadius: BorderRadius.all(Radius.circular(14)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(Icons.discount),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "1 Discount is applied",
                            ),
                            SizedBox(
                              width: 100,
                            ),
                            Icon(Icons.arrow_circle_right_outlined),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Payment Summary",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 14,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Price"),
                        Text(
                          "${widget.product.price}",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Delivery fee"),
                        Spacer(),
                        Text(
                          "\$2.0",
                          style: TextStyle(
                              fontSize: 14,
                              decoration: TextDecoration.lineThrough),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "\$1.0",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Divider(
                      thickness: 1,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Total Payment",
                        ),
                        Text(
                          "${widget.product.price! + 1}",
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        height: 160,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(24)),
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                SizedBox(
                  width: 30,
                ),
                Icon(
                  Icons.payments,
                  color: Color(0xffC67C4E),
                ),
                SizedBox(
                  width: 20,
                ),
                Container(
                  width: 110,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Color(0xffF2F2F2),
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                  child: Row(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        width: 50,
                        height: 40,
                        decoration: BoxDecoration(
                            color: Color(0xffC67C4E),
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        child: Text(
                          "Cash",
                          style: TextStyle(
                              color: Color(0xffffffff),
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        width: 60,
                        height: 40,
                        child: Text(
                          "${widget.product.price! + 1}",
                          style: TextStyle(
                            color: Color(0xff2F2D2C),
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Spacer(),
                CircleAvatar(
                  backgroundColor: Color(0xff808080),
                  child: Icon(
                    Icons.more_horiz,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  width: 30,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Container(
                width: 345,
                height: 60,
                margin: EdgeInsets.only(top: 20),
                padding: EdgeInsets.only(left: 150),
                decoration: BoxDecoration(
                  color: Color(0xffC67C4E),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(right: 140),
                  child: MainButtonWidget(
                    onTap: () {
                      return null;
                    },
                    buttontext: "Order",
                    color: Colors.white,
                    height: 62,
                    width: 315,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
