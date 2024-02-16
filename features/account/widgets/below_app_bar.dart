import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ssb_ecommerce/constants/global_variable.dart';
import 'package:ssb_ecommerce/provider/user_provider.dart';

class BelowAppBar extends StatelessWidget {
  const BelowAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;
    return Container(
      decoration: BoxDecoration(gradient: GlobalVariables.appBarGradient),
      padding: EdgeInsets.only(left: 16, right: 16, bottom: 16),
      child: Row(
        children: [
          RichText(
            text: TextSpan(
                text: 'hello, ',
                style: TextStyle(fontSize: 22, color: Colors.black),
                children: [
                  TextSpan(
                      text: user.name,
                      style: TextStyle(
                          fontSize: 22,
                          color: Colors.black,
                          fontWeight: FontWeight.w600))
                ]),
          ),
        ],
      ),
    );
  }
}
