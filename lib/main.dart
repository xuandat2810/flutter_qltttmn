import 'package:flutter/material.dart';
import 'package:quanlysvthuctap/views/ListTreEm/WrapperList.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quản lý thông tin lý lịch trẻ em ở trường mầm non',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: WrapperList(),
    );
  }
}
