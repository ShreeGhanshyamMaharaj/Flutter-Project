import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ssb_ecommerce/common/widgets/bottom_bar.dart';
import 'package:ssb_ecommerce/constants/error_handling.dart';
import 'package:ssb_ecommerce/constants/global_variable.dart';
import 'package:ssb_ecommerce/constants/utills.dart';
// import 'package:ssb_ecommerce/features/home/screen/home_screen.dart';
import 'package:ssb_ecommerce/models/user.dart';
import 'package:http/http.dart' as http;
import 'package:ssb_ecommerce/provider/user_provider.dart';

class AuthService {
  // sign up user

  void signUpUser({
    required BuildContext context,
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      SSB_user user = SSB_user(
          id: '',
          name: name,
          password: password,
          email: email,
          address: '',
          type: '',
          token: '');

      http.Response res = await http.post(
        Uri.parse('$uri/api/signup'),
        body: user.toJson(),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        },
      );
      httpErrorHandle(
          response: res,
          context: context,
          onSuccess: () {
            showSnackBar(
                context, 'account created, login with same cradentials');
          });
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  // sign in
  void signInUser({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    try {
      // where the entire response body is known in advance, then Response (http.Response) is used.
      http.Response res = await http.post(
        Uri.parse('$uri/api/signin'),
        body: jsonEncode({
          'email': email,
          'password': password,
        }),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      // print(res.body);
      httpErrorHandle(
          response: res,
          context: context,
          onSuccess: () async {
            // to store token in device > use sharedpreferences
            WidgetsFlutterBinding.ensureInitialized();
            SharedPreferences prefs = await SharedPreferences.getInstance();
            // to store data in device > user provider
            Provider.of<UserProvider>(context, listen: false).setUser(res.body);
            // nicheni line Sharedpreferences line pachhi lakhi shkay > Sharedpreferences ane nicheni line token mate chhe
            await prefs.setString(
                'x-auth-token', jsonDecode(res.body)['token']);

            // nichenu if video ni comments mathi lakhelu chhe.
            if (context.mounted) {
              Navigator.pushNamedAndRemoveUntil(
                  // ignore: use_build_context_synchronously
                  context,
                  BottomBar.routeName,
                  (route) => false);
              //whatever navigation you are doing
            }
          });
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

// get user data
  void getUserData(
    BuildContext context,
  ) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('x-auth-token');

      if (token == null) {
        prefs.setString('x-auth-screen', '');
      }

      var tokenRes = await http.post(
        Uri.parse('$uri/tokenIsValid'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'x-auth-token': token!
        },
      );

      var response = jsonDecode(tokenRes.body);

      if (response == true) {
        // get user data
        http.Response userRes = await http.get(
          Uri.parse('$uri/'),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
            'x-auth-token':
                token // we not write token! , because receiver is not null.
          },
        );
        var userProvider = Provider.of<UserProvider>(context, listen: false);
        userProvider.setUser(userRes.body);
      }
      // http.Response res = await http.post(
      //   Uri.parse('$uri/api/signin'),
      //   body: jsonEncode({
      //     'email': email,
      //     'password': password,
      //   }),
      //   headers: <String, String>{
      //     'Content-Type': 'application/json; charset=UTF-8',
      //   },
      // );

      // print(res.body);
      // httpErrorHandle(
      //     response: res,
      //     context: context,
      //     onSuccess: () async {
      //       // to store token in device > use sharedpreferences
      //       SharedPreferences pref = await SharedPreferences.getInstance();
      //       // to store data in device > user provider
      //       Provider.of<UserProvider>(context, listen: false).setUser(res.body);
      //       // nicheni line Sharedpreferences line pachhi lakhi shkay > Sharedpreferences ane nicheni line token mate chhe
      //       await pref.setString('x-auth-token', jsonDecode(res.body)['token']);
      //       Navigator.pushNamedAndRemoveUntil(
      //           context, HomeScreen.routeName, (route) => false);
      //     });
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}
