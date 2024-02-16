import 'package:flutter/material.dart';
import 'package:ssb_ecommerce/constants/global_variable.dart';

class TopCategories extends StatelessWidget {
  const TopCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemExtent: 100,
          itemCount: GlobalVariables.categoryImages.length,
          itemBuilder: (context, Index) {
            return Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image.asset(
                      GlobalVariables.categoryImages[Index]['image']!,
                      fit: BoxFit.cover,
                      height: 63,
                      width: 63,
                    ),
                  ),
                ),
                Text(GlobalVariables.categoryImages[Index]['title']!),
              ],
            );
          }),
    );
  }
}
