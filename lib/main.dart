import 'package:flutter/material.dart';
//import 'package:flutter/widgets.dart';
import 'package:ana5/Login_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize:const Size(360,690),
      minTextAdapt : true,
      splitScreenMode : true,
      builder: (BuildContext context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          //title: 'ana5',
          home: LoginScreen(),

        );

      },
    );
  }
}


