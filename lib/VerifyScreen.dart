import 'package:ana5/NewPassword.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class Verify extends StatefulWidget {
  const Verify({Key? key}) : super(key: key);

  @override
  State<Verify> createState() => _Verify();
}

class _Verify extends State<Verify> {
  final formKey = GlobalKey<FormState>();

  Widget _buildPinCodeFields (BuildContext context){
    return Container(
      child: PinCodeTextField(
        appContext:context ,
        autoFocus: true,
        cursorColor: Colors.black,
        keyboardType: TextInputType.number,
        length: 4,
        obscureText: false,
        animationType: AnimationType.fade,
        pinTheme: PinTheme(
          shape: PinCodeFieldShape.box,
          borderRadius: BorderRadius.circular(5),
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

          print("Code is Completed");
        },
        onChanged: (value) {
          print(value);
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
                  height: 5.h,
                ),
                InkWell(
                  child: Text(
                    'Resend Code',
                    style: TextStyle(
                        fontSize: 8.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.teal),
                  ),
                  onTap: (){
                    print('Resend Code');
                    Navigator.push(context, MaterialPageRoute(builder: (context) => Verify()),);
                  },
                ),
                SizedBox(
                  height: 12.h,
                ),
                Padding(
                  padding: EdgeInsets.all(8.h.w),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => NewPassword()),);
                    },
                    child: Center(
                      child: const Text('Verify'),
                    ),
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.teal,
                      padding: EdgeInsets.fromLTRB(0.w, 20.h, 0.w, 20.h),
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
