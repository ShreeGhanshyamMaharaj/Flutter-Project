// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:ssb_ecommerce/constants/global_variable.dart';
import 'package:ssb_ecommerce/features/account/widgets/below_app_bar.dart';
import 'package:ssb_ecommerce/features/account/widgets/order.dart';
import 'package:ssb_ecommerce/features/account/widgets/top_buttons.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(63),
        child: AppBar(
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: GlobalVariables.appBarGradient,
            ),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                alignment: Alignment.topLeft,
                child: Image.asset(
                  'assets/images/amazon_in.png',
                  width: 108,
                  height: 45,
                  color: Colors.black,
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 16, right: 16),
                child: Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: 16),
                      child: Icon(Icons.notifications_outlined),
                    ),
                    Icon(Icons.search),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          BelowAppBar(),
          SizedBox(height: 10),
          TopButtons(),
          SizedBox(height: 16),
          Orders(),
        ],
      ),
    );
  }
}
