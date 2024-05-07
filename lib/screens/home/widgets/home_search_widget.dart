import 'package:flutter/material.dart';

class HomeSearchWidget extends StatelessWidget {
  const HomeSearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(left: 16, right: 4, top: 4, bottom: 4),
      height: 52,
      decoration: BoxDecoration(
        color: const Color(0xff313131),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Row(
            children: [
              Icon(
                Icons.search,
                size: 20,
                color: Color(0xffffffff),
              ),
              SizedBox(
                width: 12,
              ),
              Text(
                "Search coffee",
                style: TextStyle(fontSize: 14, color: Color(0xff989898)),
              )
            ],
          ),
          Container(
            width: 44,
            height: 44,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: const Color(0xffC67C4E),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(
              Icons.filter_list_sharp,
              size: 20,
              color: Color(0xffffffff),
            ),
          )
        ],
      ),
    );
  }
}
