import 'package:flutter/material.dart';
import 'package:ssb_ecommerce/constants/global_variable.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  const CustomButton({
    super.key,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      child: Text(
        text,
      ),
      style: ElevatedButton.styleFrom(
          minimumSize: Size(double.infinity, 63),
          backgroundColor: GlobalVariables.secondaryColor),
    );
  }
}
