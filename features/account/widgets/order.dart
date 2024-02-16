import 'package:flutter/material.dart';
import 'package:ssb_ecommerce/constants/global_variable.dart';
import 'package:ssb_ecommerce/features/account/widgets/single_product.dart';

class Orders extends StatefulWidget {
  const Orders({super.key});

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  List list = [
    {
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS7ho4V4Rul9e9ctlaEnOUuGTtDNgSyiTdDGw&usqp=CAU',
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS7ho4V4Rul9e9ctlaEnOUuGTtDNgSyiTdDGw&usqp=CAU',
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.only(left: 16),
              child: Text(
                'Your orders',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  // color: Colors.black,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(right: 16),
              child: Text(
                'see all',
                style: TextStyle(
                  color: GlobalVariables.selectedNavBarColor,
                ),
              ),
            )
          ],
        ),
        Container(
          height: 163,
          padding: EdgeInsets.only(left: 10, top: 20, right: 0),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: list.length,
            itemBuilder: ((context, index) {
              return SingleProduct(
                image: list[index],
                // list[index],
              );
            }),
          ),
        )
      ],
    );
  }
}
