import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ana5/VerifyScreen.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({Key? key}) : super(key: key);

  @override
  State<ForgetPassword> createState() => _ForgetPassword();
}

class _ForgetPassword extends State<ForgetPassword> {
  final emailController = TextEditingController();
  //final passwordController = TextEditingController();
  //bool _isSecurePassword = true;
  final formKey = GlobalKey<FormState>();

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
                    'Forget Password',
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
                    image: AssetImage('images/Forget.png'),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Text(
                  'Please Enter Your Email Address'
                      ' to receive a Verification Code',
                  style: TextStyle(
                      fontSize: 8.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                SizedBox(
                  height: 15.h,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Email',
                      style: TextStyle(
                        fontSize: 7.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding:  EdgeInsets.all(5.h.w),
                  child: TextFormField(
                    controller: emailController,
                    decoration:  InputDecoration(
                      prefixIcon: Icon(Icons.email_outlined),
                      //labelText: 'Email',
                      hintText: 'Email',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.r),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                    ),
                    validator: (data) {
                      if (data!.isEmpty) {
                        return 'This field is required';
                      }
                      final regexp = RegExp(r'^[\w\.-]+@[\w-]+\.\w{2,3}(\.\w{2,3})?$');
                      if (!regexp.hasMatch(data)) {
                        return 'Enter a valid Email';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                SizedBox(
                  height: 5.h,
                ),
                Padding(
                  padding:  EdgeInsets.all(8.h.w),
                  child: ElevatedButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Verify()),);
                        print('${emailController.text}');
                      }
                    },
                    child: Center(
                      child: const Text('Send'),
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