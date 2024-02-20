import 'package:ana5/Forget_Password.dart';
import 'package:ana5/Sign_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

//import 'Welcome.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool _isSecurePassword = true;
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
                Container(
                  margin: EdgeInsets.fromLTRB(12.w, 0.h, 10.w, 0.h),
                  //padding: EdgeInsets.fromLTRB(20, 0, 0,0 ),
                  child: Image(
                    image: AssetImage('images/login.jpg'),
                  ),
                ),
                 SizedBox(
                  height: 20.h,
                ),
                Text(
                  'LogIn',
                  style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.teal),
                ),
                 SizedBox(
                  height: 15.h,
                ),
                Padding(
                  padding:  EdgeInsets.fromLTRB(0.w, 0.h, 334.w, 0.h),
                  child: Text(
                    'Email',
                    style: TextStyle(
                        fontSize: 7.sp,
                        fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
                Padding(
                  padding:  EdgeInsets.fromLTRB(3.w, 5.h, 3.w, 3.h),
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
                      if(data!.isEmpty) {
                        return 'This field is required';
                      }
                      final regexp = RegExp(r'[^@]+@[^\.]+\..+');
                      if(!regexp.hasMatch(data)) {
                        return 'Enter a valid Email';
                      }
                      return null;
                    },
                  ),
                ),
                 SizedBox(
                  height: 20.h,
                ),
                Padding(
                  padding:  EdgeInsets.fromLTRB(0.w, 0.h, 320.w, 0.h),
                  child: Text(
                    'Password',
                    style: TextStyle(
                      fontSize: 7.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding:  EdgeInsets.fromLTRB(3.w, 5.h, 3.w, 3.h),
                  child: TextFormField(
                    obscureText: _isSecurePassword,
                    controller: passwordController,
                    decoration:  InputDecoration(
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
                      if(data!.isEmpty) {
                        return 'This field is required';
                      }
                      return null;
                    },
                  ),
                ),
                InkWell(
                  child: Container(
                    margin: EdgeInsets.fromLTRB(296.w, 0.h, 0.w, 5.h),
                    child: Text(
                      'Forget password?',
                      style: TextStyle(
                        fontSize: 7.sp,
                        color: Colors.teal,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ForgetPassword()),);
                    //print('forget password');
                  },
                ),
                 SizedBox(
                  height: 20.h,
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(3.w, 5.h, 3.w, 3.h),
                  child: ElevatedButton(
                    onPressed: () {
                      if(formKey.currentState!.validate()) {
                        print('${emailController.text}');
                        print('${passwordController.text}');
                        //Navigator.push(context, MaterialPageRoute(builder: (context) => homePage()),);
                      }
                    },
                    child: Center(
                      child:  Text('Login' ,style: TextStyle(
                        fontSize: 10.sp,
                        fontWeight: FontWeight.bold,
                      ),),
                    ),
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.teal,
                      padding: EdgeInsets.fromLTRB(0.w, 20.h, 0.w, 20.h),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14.r)),

                    ),
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Not have an account ? ',
                      style: TextStyle(
                        fontSize: 7.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    InkWell(
                      child: Text(
                        'Sign up',
                        style: TextStyle(
                          fontSize: 7.sp,
                          color: Colors.teal,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => SignUp()),);
                        print('Sign up');
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
  Widget togglePassword(){
    return IconButton(onPressed: (){
      setState(() {
        _isSecurePassword = !_isSecurePassword;
      });
    }, icon: _isSecurePassword ? Icon(Icons.visibility): Icon(Icons.visibility_off),
      color: Colors.grey,);
  }
}
