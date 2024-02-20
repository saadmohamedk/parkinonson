import 'package:ana5/Login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
//import 'package:ana5/Welcome.dart';

class NewPassword extends StatefulWidget {
  const NewPassword({Key? key}) : super(key: key);

  @override
  State<NewPassword> createState() => _NewPasswordState();
}

class _NewPasswordState extends State<NewPassword> {
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  bool _isSecurePassword = true;
  bool _isSecureConfirmPassword = true;
  final formKey = GlobalKey<FormState>();
  late String password;
  //late String togglePassword;
  double strength = 0;
  String text = 'Please enter a password';
  RegExp numReg = RegExp(r'.*[0-9].*');
  RegExp letterReg = RegExp(r'.*[A-Za-z].*');

  void checkPassword(String value) {
    password = value.trim();

    if (password.isEmpty) {
      setState(() {
        strength = 0;
        text = 'Please enter a password';
      });
    } else if (password.length < 6) {
      setState(() {
        strength = 1 / 4;
        text = 'Your password is too short';
      });
    } else if (password.length < 8) {
      setState(() {
        strength = 2 / 4;
        text = 'Your password is acceptable but not strong';
      });
    } else if (!letterReg.hasMatch(password) || !numReg.hasMatch(password)) {
        setState(() {
          strength = 3 / 4;
          text = 'Your password is strong';
        });

      } else {
        setState(() {
          strength = 1;
          text = 'Your password is great';
        });
      }
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
                      'Create New Password',
                      style: TextStyle(
                          fontSize: 8.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(12.w, 0.h, 10.w, 0.h),
                    //padding: EdgeInsets.fromLTRB(20, 0, 0,0 ),
                    child: Image(
                      image: AssetImage('images/NewPassword.png'),
                    ),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Text(
                    'New Password',
                    style: TextStyle(
                        fontSize: 8.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  SizedBox(
                    height: 2.h,
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
                      onChanged: (val) => checkPassword(val),
                      obscureText: _isSecurePassword,
                      controller: passwordController,
                      decoration: InputDecoration(
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
                    ),
                  ),
                  Text(
                    text,
                    style: TextStyle(
                        fontSize: 8.sp,
                        color: strength <= 1 / 4
                            ? Colors.red
                            : strength == 2 / 4
                                ? Colors.yellow
                                : strength == 3 / 4
                                    ? Colors.blue
                                    : Colors.green),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0.w, 0.h, 295.w, 0.h),
                    child: Text(
                      'Confirm Password',
                      style: TextStyle(
                        fontSize: 7.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(3.w, 5.h, 3.w, 3.h),
                    child: TextFormField(
                      obscureText: _isSecureConfirmPassword,
                      controller: confirmPasswordController,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.lock_outline),
                        //labelText: 'password',
                        hintText: 'password',
                        suffixIcon: toggleConfirmPassword(),
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
                    height: 2.h,
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(3.w, 5.h, 3.w, 3.h),
                    child: ElevatedButton(
                      onPressed: strength<1/2? null: (){
                        if(passwordController.text==confirmPasswordController.text){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()),);
                          print('${passwordController.text}');
                          print('${confirmPasswordController.text}');
                        }
                      },
                      child: Center(
                        child:  Text('Reset Password' ,style: TextStyle(
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
  Widget toggleConfirmPassword() {
    return IconButton(
      onPressed: () {
        setState(() {
          _isSecureConfirmPassword = !_isSecureConfirmPassword;
        });
      },
      icon: _isSecureConfirmPassword
          ? Icon(Icons.visibility)
          : Icon(Icons.visibility_off),
      color: Colors.grey,
    );
  }
  }

