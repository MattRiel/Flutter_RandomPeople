import 'package:flutter/material.dart';
import 'package:randompeople/detailscreen.dart';
import 'homescreen.dart';

void main() => runApp(MaterialApp(
  initialRoute: '/',
  routes: {
    '/' : (context) => HomeScreen(),
    '/detail': (context) => DetailScreen(),
  },
));