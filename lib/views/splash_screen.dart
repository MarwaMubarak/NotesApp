import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notes_app/views/sign_in_view.dart';

import '../cores/navigation.dart';
import '../cores/size_config.dart';
import '../services/sp_screen/cache_helper.dart';
import 'home_view.dart';




class SplachScreen extends StatefulWidget {
  @override
  _SplachScreenState createState() => _SplachScreenState();
}

class _SplachScreenState extends State<SplachScreen> {

  void initState() {
    // TODO: implement initState
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(

      body: Container(
        color: Colors.black,
        child: Center(
          child:Image.asset('assets/images/log1.png')
          ),
      ),


    );
  }

  startTime() async {
    var duration = new Duration(seconds: 2);
    return new Timer(duration, route);
  }

  route() {
    var token = SharedPreferencesHelper.getData(key: 'token');
    if (token == null)
      AppNavigator.customNavigator(context: context, screen: SignInView(), finish: true);
    else
      AppNavigator.customNavigator(context: context, screen: HomeView(), finish: true);
    //TODO :: Get token and   Check it
  }


}

// import 'package:flutter/material.dart';
// import 'package:easy_splash_screen/easy_splash_screen.dart';
// import 'package:notes_app/views/sign_in_view.dart';
//
// import 'home_view.dart';
//
// class SplashScreen extends StatelessWidget {
//   const SplashScreen({Key? key}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return EasySplashScreen(
//       backgroundColor: Colors.black,
//       logo: Image.asset('assets/images/logo1.png'),
//       logoSize: 300,
//       loaderColor: Colors.white,
//       navigator: const SignInView(),
//       durationInSeconds: 3,
//       showLoader: true,
//       loadingText: const Text('loading..'),
//     );
//   }
// }