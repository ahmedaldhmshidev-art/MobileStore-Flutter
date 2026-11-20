import 'package:flutter/material.dart';
import 'package:myapplogin/pages/login_screen.dart';
import 'package:myapplogin/utils/SizeOfConfig.dart';
void main(){
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // استدعا كلاس يتعرف علي جميع احجام الشاشات
    SizeOfConfig().init(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen() ,
    );

  }
}



