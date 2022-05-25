// ignore_for_file: prefer_const_constructors
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/modules/Bmi/Bmi.dart';
import 'package:flutter_project/modules/Messenger/Chats.dart';
import 'package:flutter_project/modules/Count/Count.dart';
import 'package:flutter_project/shared/BlocObserver.dart';
import 'layout/TODO.dart';
import 'modules/Login/Login.dart';
import 'modules/User/User.dart';

void main() {
  Bloc.observer= MyBlocObserver();
// init your dependency injection here
    runApp(MyApp());
}
class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:false,
      home: TODO(),
    );
  }
}



