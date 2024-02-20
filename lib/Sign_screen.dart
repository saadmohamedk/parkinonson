//import 'package:ana5/Login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'Welcome.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUp();
}

class _SignUp extends State<SignUp> {
  final userNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  bool _isSecurePassword = true;


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
                Container(
                  margin: EdgeInsets.fromLTRB(12.w, 0.h, 10.w, 0.h),
                  //padding: EdgeInsets.fromLTRB(20, 0, 0,0 ),
                  child: Image(
                    image: AssetImage('images/login.jpg'),
                  ),
                ),
                SizedBox(
                  height: 1.h,
                ),
                Text(
                  'SignUp',
                  style: TextStyle(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.teal),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0.w, 0.h, 320.w, 0.h),
                  child: Text(
                    'Username',
                    style: TextStyle(
                      fontSize: 7.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(3.w, 5.h, 3.w, 3.h),
                  child: TextFormField(
                    controller: userNameController,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.person_outline),
                      //labelText: 'Email',
                      hintText: 'Username',
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
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0.w, 0.h, 334.w, 0.h),
                  child: Text(
                    'Email',
                    style: TextStyle(
                      fontSize: 7.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(3.w, 5.h, 3.w, 3.h),
                  child: TextFormField(
                    controller: emailController,
                    decoration: InputDecoration(
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
                      final regexp = RegExp(r'[^@]+@[^\.]+\..+');
                      if (!regexp.hasMatch(data)) {
                        return 'Enter a valid Email';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0.w, 0.h, 320.w, 0.h),
                  child: Text(
                    'Password',
                    style: TextStyle(
                      fontSize: 7.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(3.w, 5.h, 3.w, 3.h),
                  child: TextFormField(
                    //onChanged: (password) => onPasswordChanged(password),
                    obscureText: _isSecurePassword,
                    controller: passwordController,
                    decoration: InputDecoration(
                      //suffixIcon: InkWell(child: Icon(Icons.visibility_off_sharp),
                      prefixIcon: Icon(Icons.lock_outline),
                      //labelText: 'password',
                      hintText: 'password',
                      suffixIcon: togglePassword(),
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
                      final regexp = RegExp(r"^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$");
                      if (!regexp.hasMatch(data)) {
                        return 'Enter a Strong Password';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  height: 35.h,
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(3.w, 5.h, 3.w, 3.h),
                  child: ElevatedButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        print('${userNameController.text}');
                        print('${emailController.text}');
                        print('${passwordController.text}');
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Welcome()),
                        );
                      }
                    },
                    child: Center(
                      child: Text(
                        'Sign up',
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already have an account ? ',
                      style: TextStyle(
                        fontSize: 7.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    InkWell(
                      child: Text(
                        'Login',
                        style: TextStyle(
                          fontSize: 7.sp,
                          color: Colors.teal,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onTap: () {
                        Navigator.of(context).pop();
                        print('Login');
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget togglePassword() {
    return IconButton(
      onPressed: () {
        setState(() {
          _isSecurePassword = !_isSecurePassword;
        });
      },
      icon: _isSecurePassword
          ? Icon(Icons.visibility)
          : Icon(Icons.visibility_off),
      color: Colors.grey,
    );
  }
}
