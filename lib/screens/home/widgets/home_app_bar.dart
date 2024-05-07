import 'package:cofee_delivery_app/screens/home/widgets/home_search_widget.dart';
import 'package:flutter/material.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 52),
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(color: Color(0xff131313)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              height: kTextTabBarHeight,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "Location",
                        style: TextStyle(
                          fontSize: 12,
                          color: Color(0xffB7B7B7),
                        ),
                      ),
                      Text(
                        "Bilzen, Tanjungbalai ▼",
                        style: TextStyle(
                          fontSize: 14,
                          color: Color(0xffDDDDDD),
                        ),
                      )
                    ],
                  ),
                  Container(
                    width: 44,
                    height: 44,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        image: const DecorationImage(
                            image: AssetImage("assets/pngs/prof_pic.jpeg"))),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            const HomeSearchWidget(),
            Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.bottomCenter,
              children: [
                Positioned(
                  top: 40,
                  child: Container(
                    width: MediaQuery.sizeOf(context).width - 60,
                    height: 180,
                    decoration: BoxDecoration(
                        image: const DecorationImage(
                          fit: BoxFit.fitWidth,
                          image: NetworkImage(
                            "https://wallpaperswide.com/download/coffee_heart-wallpaper-2880x1620.jpg",
                          ),
                        ),
                        borderRadius: BorderRadius.circular(16)),
                  ),
                ),
                Positioned(
                    left: -160,
                    top: 65,
                    child: Container(
                      alignment: Alignment.center,
                      width: 75,
                      height: 30,
                      decoration: BoxDecoration(
                        color: const Color(0xffED5151),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Text(
                        "Promo",
                        style: TextStyle(
                            color: Color(0xffffffff),
                            fontSize: 18,
                            fontWeight: FontWeight.w600),
                      ),
                    )),
                const Positioned(
                  left: -160,
                  top: 113,
                  child: Text(
                    "------..----\n---------",
                    style: TextStyle(
                      color: Color(0xff000000),
                      fontSize: 34,
                      fontWeight: FontWeight.w700,
                      decorationColor: Colors.black,
                      decorationStyle: TextDecorationStyle.solid,
                      decoration: TextDecoration.lineThrough,
                      decorationThickness: 13,
                    ),
                  ),
                ),
                const Positioned(
                  left: -160,
                  top: 105,
                  child: Text(
                    "Buy one get\none FREE",
                    style: TextStyle(
                      color: Color(0xffffffff),
                      fontSize: 32,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                const SizedBox()
              ],
            )
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 210);
}
