import 'package:carebmi/states/authen.dart';
import 'package:carebmi/states/onboarding_screen.dart';
import 'package:flutter/material.dart';

final Map<String,WidgetBuilder> routes =  <String,WidgetBuilder>{
  '/authen' : (BuildContext context) => Authen(),
  '/onboardingScreen' : (BuildContext context) => OnBoardingScreen(),
};