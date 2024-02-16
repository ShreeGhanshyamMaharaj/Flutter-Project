// import 'dart:js';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ssb_ecommerce/provider/user_provider.dart';

class AddressBox extends StatelessWidget {
  const AddressBox({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user;
    return Container(
      height: 50,
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          Color.fromARGB(255, 114, 226, 221),
          Color.fromARGB(255, 163, 236, 231)
        ], stops: [
          0.5,
          1.0
        ]),
      ),
      padding: EdgeInsets.only(left: 10),
      child: Row(
        children: [
          Icon(
            Icons.location_on_outlined,
            size: 24,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 5),
              child: Text(
                'Delivery to ${user.name} - ${user.address}',
                style: TextStyle(fontWeight: FontWeight.w500),
                overflow: TextOverflow
                    .ellipsis, // we can use fade,... instead of ellipsis as per requirements
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 5, top: 2, right: 10),
            child: Icon(
              Icons.arrow_drop_down_outlined,
              size: 28,
            ),
          )
        ],
      ),
    );
  }
}
