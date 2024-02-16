import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
// import 'package:provider/provider.dart';
import 'package:ssb_ecommerce/constants/global_variable.dart';
import 'package:ssb_ecommerce/features/home/widgets/address_box.dart';
import 'package:ssb_ecommerce/features/home/widgets/carousel_image.dart';
import 'package:ssb_ecommerce/features/home/widgets/deal_of_the_day.dart';
import 'package:ssb_ecommerce/features/home/widgets/top_categories.dart';
// import 'package:ssb_ecommerce/provider/user_provider.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/home';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    // final user = Provider.of<UserProvider>(context).user;

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
                Expanded(
                  child: Container(
                      height: 42,
                      margin: EdgeInsets.only(left: 16),
                      child: Material(
                        borderRadius: BorderRadius.circular(7),
                        elevation: 1,
                        child: TextFormField(
                          decoration: InputDecoration(
                              prefixIcon: InkWell(
                                onTap: () {},
                                child: Padding(
                                  padding: EdgeInsets.only(left: 6),
                                  child: Icon(
                                    Icons.search,
                                    color: Colors.black,
                                    size: 29,
                                  ),
                                ),
                              ),
                              filled: true,
                              fillColor: Colors.white,
                              contentPadding: EdgeInsets.only(top: 10),
                              border: const OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(7),
                                ),
                                borderSide: BorderSide.none,
                              ),
                              enabledBorder: const OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(7),
                                ),
                                borderSide:
                                    BorderSide(color: Colors.orange, width: 1),
                              ),
                              hintText: 'search products',
                              hintStyle: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 16)),
                        ),
                      )),
                ),
                Container(
                  color: Colors.transparent,
                  height: 42,
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  child: Icon(
                    Icons.mic,
                    color: Colors.black54,
                    size: 29,
                  ),
                )
              ],
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              AddressBox(),
              SizedBox(height: 11),
              TopCategories(),
              SizedBox(height: 1),
              CarouselImage(),
              DealOfTheDay(),
            ],
          ),
        ));
  }
}
