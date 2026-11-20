import 'package:flutter/material.dart';
import '../utils/SizeOfConfig.dart';

  AppBar myAppBar(String name) {
    return AppBar(title: Text(name , style: TextStyle(color: Colors.white),),
      backgroundColor:Colors.grey,
      centerTitle: true,
      // لتنزيل الشريط
      toolbarHeight: getProportionalHeight(100),
      // لعمل انحنا في الزوايا السفلية
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(20),
        ),
      ),
      // لعمل ضل شفاف
      elevation: 5,
      shadowColor: Colors.black,
    );
  }
