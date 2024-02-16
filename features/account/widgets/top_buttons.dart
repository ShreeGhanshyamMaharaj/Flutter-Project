import 'package:flutter/material.dart';
import 'package:ssb_ecommerce/features/account/widgets/account_button.dart';

class TopButtons extends StatefulWidget {
  const TopButtons({super.key});

  @override
  State<TopButtons> createState() => _TopButtonsState();
}

class _TopButtonsState extends State<TopButtons> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            AccountButton(
              text: 'your orders',
              onTap: () {},
            ),
            AccountButton(
              text: 'turn seller',
              onTap: () {},
            )
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          children: [
            AccountButton(
              text: 'log out',
              onTap: () {},
            ),
            AccountButton(
              text: 'your wish list',
              onTap: () {},
            )
          ],
        )
      ],
    );
  }
}
