//import 'package:ana5/Login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
  //var isVisible;
  bool _isSecurePassword = true;
  bool _isPasswordEightCharacters = false;
  bool _hasPasswordOneNumber= false;
  onPasswordChanged(String password){
    final numericRegex = RegExp(r'[0-9]');
    setState(() {
      _isPasswordEightCharacters = false;
      if(password.length >= 8)
        _isPasswordEightCharacters = true;

      _hasPasswordOneNumber =false;
      if(numericRegex.hasMatch(password))
        _hasPasswordOneNumber = true;
    });

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
                  'Sign up',
                  style: TextStyle(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.teal),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Username',
                      style: TextStyle(
                        fontSize: 6.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding:  EdgeInsets.all(3.h.w),
                  child: TextFormField(
                    controller: userNameController,
                    decoration:  InputDecoration(
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
                  height: 1.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
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
                  padding: EdgeInsets.all(3.h.w),
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
                      final regexp = RegExp(r'[^@]+@[^\.]+\..+');
                      if (!regexp.hasMatch(data)) {
                        return 'Enter a valid Email';
                      }
                      return null;
                    },
                  ),
                ),
                 SizedBox(
                  height: 1.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Password',
                      style: TextStyle(
                        fontSize: 7.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.all(3.h.w),
                  child: TextFormField(
                    onChanged: (password) => onPasswordChanged(password),
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
                      return null;
                    },
                  ),
                ),
                Row(
                  children: [
                    AnimatedContainer(
                      duration: Duration(milliseconds: 500),
                      width: 17.r,
                      height: 17.r,
                      decoration: BoxDecoration(
                        color: _isPasswordEightCharacters ? Colors.green : Colors.transparent,
                        border: _isPasswordEightCharacters ? Border.all(color: Colors.transparent) :
                         Border.all(color: Colors.grey.shade400),
                        borderRadius: BorderRadius.circular(50.r),
                      ),
                      child: Center(child: Icon(Icons.check,color: Colors.white,size: 15.r,),),

                    ),
                    SizedBox(width: 3.w,),
                    Text('Contains at least 8 characters')
                  ],
                ),
                SizedBox(height: 3.h,),
                Row(
                  children: [
                    AnimatedContainer(
                      duration: Duration(milliseconds: 500),
                      width: 17.r,
                      height: 17.r,
                      decoration: BoxDecoration(
                        color: _hasPasswordOneNumber ? Colors.green : Colors.transparent,
                        border: _hasPasswordOneNumber ? Border.all(color: Colors.transparent) :
                        Border.all(color: Colors.grey.shade400),
                        borderRadius: BorderRadius.circular(50.r),
                      ),
                      child: Center(child: Icon(Icons.check,color: Colors.white,size: 15.r,),),

                    ),
                    SizedBox(width: 3.w,),
                    Text('Contains at least 1 number')
                  ],
                ),
                Padding(
                  padding: EdgeInsets.all(3.h.w),
                  child: ElevatedButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        print('${userNameController.text}');
                        print('${emailController.text}');
                        print('${passwordController.text}');
                      }
                    },
                    child: Center(
                      child: const Text('Sign up'),
                    ),
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.teal,
                      padding: EdgeInsets.fromLTRB(0.w, 0.h, 0.w, 0.h),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already have an account ? ',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    InkWell(
                      child: Text(
                        'Login',
                        style: TextStyle(
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
