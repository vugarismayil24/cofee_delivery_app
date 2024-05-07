import 'package:cofee_delivery_app/screens/home/widgets/home_app_bar.dart';
import 'package:cofee_delivery_app/screens/home/widgets/home_body.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late int activeScreen;
  @override
  void initState() {
    activeScreen = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffE4EDFA),
      appBar: const HomeAppBar(),
      body: const HomeBodyWidget(),
      bottomNavigationBar: Container(
        height: 100,
        width: double.infinity,
        padding: const EdgeInsets.all(0),
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(24),
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: const Color(0xffffffff),
          showSelectedLabels: false,
          showUnselectedLabels: false,
          selectedItemColor: const Color(0xffC67C4E),
          unselectedItemColor: const Color(0xff8D8D8D),
          iconSize: 32,
          currentIndex: activeScreen,
          onTap: (value) {
            // setState(() {
            //   activeScreen = value;
            // });

            // if (value == 1) {
            //   Navigator.of(context).push(MaterialPageRoute(
            //     builder: (context) => const DetailScreen(),
            //   ));
            // }
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_filled),
              label: "",
            ),
            BottomNavigationBarItem(icon: Icon(Icons.favorite), label: ""),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_bag_outlined), label: ""),
            BottomNavigationBarItem(
                icon: Icon(Icons.notifications_none), label: ""),
          ],
        ),
      ),
    );
  }
}
