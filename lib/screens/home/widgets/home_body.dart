import 'dart:convert';
import 'package:cofee_delivery_app/model/coffee_model.dart';
import 'package:cofee_delivery_app/model/cat_enum.dart';
import 'package:cofee_delivery_app/model/main_model.dart';
import 'package:cofee_delivery_app/screens/detail/detail_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeBodyWidget extends StatefulWidget {
  const HomeBodyWidget({super.key});

  @override
  State<HomeBodyWidget> createState() => _HomeBodyWidgetState();
}

class _HomeBodyWidgetState extends State<HomeBodyWidget> {
  late String activeCategory;
  late ScrollController _scrollController;
  late ScrollController _gridScrollController;
  List<CoffeeModel> dataList = [];
  late final Future<String> future;

  @override
  void initState() {
    future =
        DefaultAssetBundle.of(context).loadString("assets/api/my_api.json");
    _scrollController = ScrollController();
    _gridScrollController = ScrollController();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      dataList = await getInitialData(future, dataList);
    });

    activeCategory = "Cappucino";

    super.initState();
  }

  Future<List<CoffeeModel>> getInitialData(
      Future<String> data, List<CoffeeModel> dataList) async {
    await data;
    MainModel initialModel = MainModel.fromJson(jsonDecode(await data));
    dataList = initialModel.cappucino;
    return dataList;
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _gridScrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: FutureBuilder(
        future: future,
        builder: ((context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          } else {
            if (snapshot.hasError) {
              return Center(
                child: Text(snapshot.error.toString()),
              );
            } else {
              final json = jsonDecode(snapshot.data!);
              MainModel model = MainModel.fromJson(json);
              return Column(
                children: [
                  const SizedBox(
                    height: 76,
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 62,
                    child: ListView.builder(
                      controller: _scrollController,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 12),
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: Categories.values.length,
                      itemBuilder: (context, index) {
                        List<String> catList =
                            Categories.values.map<String>((e) {
                          List<String> catNames =
                              e.name.split(".")[0].split("");
                          catNames[0] = catNames[0].toUpperCase();
                          return catNames.join();
                        }).toList();

                        return InkWell(
                          onTap: () {
                            setState(() {
                              _gridScrollController.animateTo(
                                0,
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.ease,
                              );
                              _scrollController.animateTo(
                                MediaQuery.of(context).size.width / 3 * index,
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.ease,
                              );
                              activeCategory = catList[index];
                              switch (activeCategory) {
                                case "Cappucino":
                                  setState(() {
                                    dataList = model.cappucino;
                                  });
                                case "Americano":
                                  setState(() {
                                    dataList = model.americano;
                                  });
                                case "Latte":
                                  setState(() {
                                    dataList = model.latte;
                                  });
                                case "Turkish":
                                  dataList = model.turkish;
                                case "Machiato":
                                  dataList = model.machiato;
                                case "Mocha":
                                  dataList = model.mocha;
                                case "Espresso":
                                  dataList = model.espresso;
                              }
                            });
                          },
                          child: Container(
                            margin: const EdgeInsets.only(right: 8),
                            alignment: Alignment.center,
                            width: 121,
                            height: 38,
                            decoration: BoxDecoration(
                              color: catList[index] == activeCategory
                                  ? const Color(0xffC67C4E)
                                  : const Color(0xffffffff),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              catList[index],
                              style: const TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w600),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Expanded(
                    child: GridView.builder(
                        controller: _gridScrollController,
                        shrinkWrap: true,
                        itemCount: dataList.length,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30, vertical: 12),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: 16,
                                crossAxisSpacing: 16,
                                childAspectRatio: 1 / 1.6),
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              Navigator.of(context).push(CupertinoPageRoute(
                                builder: (context) =>
                                    DetailScreen(product: dataList[index]),
                              ));
                            },
                            child: Stack(
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
                                    child: Image.network(
                                      filterQuality: FilterQuality.low,
                                      height: 130,
                                      dataList[index].imageUrl.toString(),
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
                                          dataList[index].rating.toString(),
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
                                  top: 140,
                                  left: 12,
                                  child: SizedBox(
                                    width: 125,
                                    height: 93,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          dataList[index].title.toString(),
                                          maxLines: 1,
                                          style: const TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        Text(
                                          dataList[index].subTitle.toString(),
                                          maxLines: 2,
                                          style: const TextStyle(
                                              fontSize: 11,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Positioned(
                                  bottom: 8,
                                  left: 12,
                                  right: 12,
                                  child: SizedBox(
                                    width: double.infinity,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "\$ ${dataList[index].price}",
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
                                            borderRadius:
                                                BorderRadius.circular(10),
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
                            ),
                          );
                        }),
                  ),
                ],
              );
            }
          }
        }),
      ),
    );
  }
}
