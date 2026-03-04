import 'dart:async';

import 'package:flutter/material.dart';

import 'package:isabarder/pages/onboarding_pages.dart';

import 'package:lottie/lottie.dart';


class LoadingPage extends StatefulWidget {
  const LoadingPage({super.key});

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}


class _LoadingPageState extends State<LoadingPage> {

  @override
  void initState(){
    super.initState();
    loadAnimation();
  }

  Future<Timer> loadAnimation() async{
    return Timer(const Duration(seconds: 7) , onLoaded);
  }
  onLoaded(){
    Navigator.of(context).pushReplacement(
     MaterialPageRoute(builder: (context)=>  OnboardingPages() ) ,
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Lottie.asset("assets/lotties/Barberanimation.json" , repeat: false),
      ),
    );
  }
}
