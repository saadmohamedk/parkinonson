import 'dart:async';

import 'package:ana5/NewPassword.dart';
import 'package:flutter/material.dart';
//import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class Verify extends StatefulWidget {
  const Verify({Key? key}) : super(key: key);

  @override
  State<Verify> createState() => _Verify();
}

class _Verify extends State<Verify> {
  final formKey = GlobalKey<FormState>();
  final codeController = TextEditingController();
  int _counter=30;
  late Timer _timer;
  void startTimer(){
    _counter=30;
    _timer=Timer.periodic(Duration(seconds: 1),(timer){
      if(_counter>0){
        setState(() {
          _counter--;
        });
      }else{
        _timer.cancel();
        //_counter=30;
    }
  });
}

  Widget _buildPinCodeFields(BuildContext context) {
    return Container(
      child: PinCodeTextField(
        appContext: context,
        autoFocus: true,
        cursorColor: Colors.black,
        controller: codeController,

        keyboardType: TextInputType.number,
        //scrollPadding: EdgeInsets.all(20),
        length: 4,
        obscureText: false,
        animationType: AnimationType.scale,
        pinTheme: PinTheme(
          shape: PinCodeFieldShape.box,
          borderRadius: BorderRadius.circular(5.r),
          fieldHeight: 70.h,
          fieldWidth: 20.w,
          fieldOuterPadding: EdgeInsets.fromLTRB(30.w, 0.h, 30.w, 0.h),
          borderWidth: 1.w,
          activeColor: Colors.blue,
          inactiveColor: Colors.white,
          inactiveFillColor: Colors.grey,
          activeFillColor: Colors.teal,
          selectedColor: Colors.blue,
          selectedFillColor: Colors.white,
        ),
        animationDuration: Duration(milliseconds: 300),
        backgroundColor: Colors.white,
        enableActiveFill: true,
        onCompleted: (code) {
          //otpCode = code,
          print(code);
          print("Code is Completed");

        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Text(
                    'Verify Your Email',
                    style: TextStyle(
                        fontSize: 8.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ),
                SizedBox(
                  height: 18.h,
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(12.w, 0.h, 10.w, 0.h),
                  //padding: EdgeInsets.fromLTRB(20, 0, 0,0 ),
                  child: Image(
                    image: AssetImage('images/Verify.png'),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Text(
                  'Please Enter Your Verification Code',
                  style: TextStyle(
                      fontSize: 8.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                SizedBox(
                  height: 20.h,
                ),
                _buildPinCodeFields(context),
                SizedBox(
                  height: 4.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      child: Text(
                        'Resend Code',
                        style: TextStyle(
                            fontSize: 10.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.teal),
                      ),
                      onTap:  () {
                        startTimer();
                        print('Resend Code');
                      },
                    ),
                    SizedBox(
                      width: 14.w,
                    ),
                    Text('$_counter',style: TextStyle(fontSize: 10.sp,fontWeight: FontWeight.bold,color: Colors.teal),),
                    SizedBox(
                      width: 3.w,
                    ),
                    Text('Seconds',style: TextStyle(fontSize: 10.sp,fontWeight: FontWeight.bold,color: Colors.teal),),
                  ],
                ),
                SizedBox(
                  height: 12.h,
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(3.w, 5.h, 3.w, 3.h),
                  child: ElevatedButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => NewPassword()),
                        );
                        print('${codeController.text}');
                      }
                    },
                    child: Center(
                      child: Text(
                        'Verify',
                        style: TextStyle(
                          fontSize: 10.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.teal,
                      padding: EdgeInsets.fromLTRB(0.w, 20.h, 0.w, 20.h),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14.r)),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
