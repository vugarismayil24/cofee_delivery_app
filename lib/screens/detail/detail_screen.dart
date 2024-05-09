// ignore_for_file: prefer_const_constructors

import 'package:cofee_delivery_app/model/coffee_model.dart';
import 'package:cofee_delivery_app/model/coffee_size_enum.dart';
import 'package:cofee_delivery_app/screens/detail/widgets/detail_app_bar.dart';
import 'package:cofee_delivery_app/screens/order/order_screen.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

import '../../widgets/main_button_widget.dart';
import 'widgets/coffee_sizes_button_widget.dart';

class DetailScreen extends StatefulWidget {
  final CoffeeModel product;
  const DetailScreen({
    super.key,
    required this.product,
  });

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  int activeButton = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFFFFF),
      appBar: const DetailAppBar(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.network(
                    widget.product.imageUrl.toString(),
                    width: double.infinity,
                    height: 250,
                    fit: BoxFit.fitWidth,
                    filterQuality: FilterQuality.low,
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.product.title.toString(),
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        widget.product.subTitle.toString(),
                        style: TextStyle(
                          fontSize: 15,
                          color: Color(0xff9B9B9B),
                        ),
                      ),
                      SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "⭐${widget.product.rating}",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            " (${widget.product.voteCount})",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.grey,
                            ),
                          ),
                          Spacer(),
                          Container(
                            margin: EdgeInsets.only(right: 10),
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: Color(0xffF9F9F9),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            child: Icon(
                              Icons.coffee,
                              color: Color(0xffC67C4E),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: Color(0xffF9F9F9),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            child: Icon(
                              Icons.coffee,
                              color: Color(0xffC67C4E),
                            ),
                          ),
                        ],
                      ),
                      Divider(
                        color: Colors.black,
                        thickness: .5,
                      ),
                      Text(
                        "Description",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      ReadMoreText(
                        "${widget.product.description}",
                        trimMode: TrimMode.Line,
                        trimLines: 1,
                        colorClickableText: Color(0xffC67C4E),
                        trimCollapsedText: 'Read more',
                        trimExpandedText: 'Show less',
                        moreStyle: TextStyle(
                          color: Color(0xffC67C4E),
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Size",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                      Row(
                        children: [
                          CoffeeSizesButtonwidget(
                            isSelected: activeButton == 0,
                            onTap: () {
                              setState(() {
                                activeButton = 0;
                              });
                            },
                            size: CoffeeSizes.S
                                .toString()
                                .split("CoffeeSizes.")
                                .join(),
                          ),
                          CoffeeSizesButtonwidget(
                            isSelected: activeButton == 1,
                            onTap: () {
                              setState(() {
                                activeButton = 1;
                              });
                            },
                            size: CoffeeSizes.M
                                .toString()
                                .split("CoffeeSizes.")
                                .join(),
                          ),
                          CoffeeSizesButtonwidget(
                            isSelected: activeButton == 2,
                            onTap: () {
                              setState(() {
                                activeButton = 2;
                              });
                            },
                            size: CoffeeSizes.L
                                .toString()
                                .split("CoffeeSizes.")
                                .join(),
                          ),
                        ],
                      ),
                      // SizedBox(
                      //   height: 96,
                      // ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 88,
          ),
        ],
      ),
      bottomNavigationBar: Container(
        width: double.infinity,
        height: 88,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            )),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Price",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    "\$ ${activeButton == 0 ? widget.product.price : activeButton == 1 ? widget.product.price! + 4 : widget.product.price! + 6}",
                    style: TextStyle(
                        fontSize: 20,
                        color: Color(0xffC67C4E),
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              MainButtonWidget(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return OrderScreen(product: widget.product);
                      },
                    ),
                  );
                },
                color: Color(0xffC67C4E),
                buttontext: "Buy Now",
                height: 20,
                width: 200,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
