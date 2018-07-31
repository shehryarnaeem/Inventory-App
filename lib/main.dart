import 'package:flutter/material.dart';
import 'package:profile_app/profile.dart';
import 'package:profile_app/inventory.dart';
import 'package:profile_app/test.dart';
 class MyApp extends StatelessWidget {
   @override
   Widget build(BuildContext context) {
     return new MaterialApp(home: new test());
   }
 }


 void main() => runApp(new MyApp());