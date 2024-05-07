import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DetailAppBar extends StatelessWidget implements PreferredSizeWidget {
  const DetailAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        systemOverlayStyle: SystemUiOverlayStyle.dark,
        backgroundColor: Colors.transparent,
        leadingWidth: 0,
        titleSpacing: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const BackButton(
              style: ButtonStyle(iconSize: MaterialStatePropertyAll(24)),
              color: Color(0xff2F2D2C),
            ),
            const Text(
              "Detail",
              style: TextStyle(
                  color: Color(0xff2F2D2C),
                  fontSize: 22,
                  fontWeight: FontWeight.w600),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.favorite_border),
              iconSize: 28,
              color: const Color(0xff2F2D2C),
            )
          ],
        ),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
