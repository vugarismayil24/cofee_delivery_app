
import 'package:cofee_delivery_app/model/coffee_model.dart';
import 'package:cofee_delivery_app/model/coffee_size_enum.dart';
import 'package:cofee_delivery_app/screens/detail/widgets/detail_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class DetailScreen extends StatelessWidget {
  final CoffeeModel product;
  const DetailScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFFFFFF),
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
            Container(
              alignment: Alignment.centerLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.title.toString(),
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    product.subTitle.toString(),
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
                        "⭐${product.rating}",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        " (${product.voteCount})",
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
                    "${product.description}",
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
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  Row(
                    children: [
                      CoffeeSizesButtonwidget(
                        size: CoffeeSizes.S
                            .toString()
                            .split("CoffeeSizes.")
                            .join(),
                      ),
                      CoffeeSizesButtonwidget(
                        size: CoffeeSizes.M
                            .toString()
                            .split("CoffeeSizes.")
                            .join(),
                      ),
                      CoffeeSizesButtonwidget(
                        size: CoffeeSizes.L
                            .toString()
                            .split("CoffeeSizes.")
                            .join(),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 96,
                  ),
                ],
              ),
            ),
            Text("Price"),
            Container(
              width: 400,
              height: 80,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}

class CoffeeSizesButtonwidget extends StatelessWidget {
  final String size;
  const CoffeeSizesButtonwidget({
    super.key,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 2),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      child: TextButton(
        onPressed: () {},
        child: Text(
          size,
          style: TextStyle(
            color: Colors.black,
          ),
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



