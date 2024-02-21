import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
//import 'package:intl_phone_field/intl_phone_field.dart';
//import 'package:date_field/date_field.dart';
//import 'package:intl/intl.dart';
import 'package:intl/intl_standalone.dart' if (dart.library.html) 'package:intl/intl_browser.dart';

import 'Login_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await findSystemLocale();
  runApp(const Welcome());
}

class Welcome extends StatefulWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  State<Welcome> createState() => _Welcome();
}

class _Welcome extends State<Welcome> {
  //final emailController = TextEditingController();
  final nameController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final addressController = TextEditingController();
  final workingDaysController = TextEditingController();
  //final workingHoursController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  //DateTime? selectedDate;
  //DateTime? selectedTime;
  //DateTime? selectedDateTime;

  //final passwordController = TextEditingController();
  //bool _isSecurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  alignment: Alignment.center,
                  //margin: EdgeInsets.fromLTRB(12.w, 0.h, 10.w, 0.h),
                  //padding: EdgeInsets.fromLTRB(20, 0, 0,0 ),
                  child: Image(
                    image: AssetImage('images/login.jpg'),
                  ),
                ),
                Text(
                  textAlign:TextAlign.center,
                  'Welcome',
                  style: TextStyle(
                      fontSize: 8.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                Text(
                  textAlign:TextAlign.center,
                  'Please fill your information',
                  style: TextStyle(
                      fontSize: 6.sp,
                      //fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0.w, 0.h, 334.w, 0.h),
                  child: Text(
                    'Name',
                    style: TextStyle(
                      fontSize: 7.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(3.w, 5.h, 3.w, 3.h),
                  child: TextFormField(
                    controller: nameController,
                    decoration:  InputDecoration(
                      prefixIcon: Icon(Icons.person),
                      prefixIconColor: Colors.teal,
                      hintText: 'Enter your Name',
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
                Padding(
                  padding: EdgeInsets.fromLTRB(0.w, 0.h, 305.w, 0.h),
                  child: Text(
                    'Phone Number',
                    style: TextStyle(
                      fontSize: 7.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(3.w, 5.h, 3.w, 3.h),
                  //child:IntlPhoneField(
                  child: TextFormField(
                    keyboardType: TextInputType.phone,
                    focusNode: FocusNode(),
                    controller: phoneNumberController,
                    decoration:  InputDecoration(
                      prefixIcon: Icon(Icons.call),
                      prefixIconColor: Colors.teal,
                      hintText: 'Phone Number',
                      border: OutlineInputBorder(
                        borderRadius:BorderRadius.circular(10.r),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.r),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                    ),
                    validator: (value) {
                      if(value!.isEmpty) {
                        return 'This field is required';
                      }
                      //final regexp = RegExp(r'^\s*(?:\+?(\d{1,3}))?[-. (]*(\d{3})[-. ]*(\d{4})(?: *x(\d+))?\s*$');
                      //if(!regexp.hasMatch(value)) {
                        //return 'Enter a Valid Phone Number';
                      //}
                      return null;
                    },

                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0.w, 0.h, 325.w, 0.h),
                  child: Text(
                    'Address',
                    style: TextStyle(
                      fontSize: 7.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(3.w, 5.h, 3.w, 3.h),
                  child: TextFormField(
                    controller: addressController,
                    decoration:  InputDecoration(
                      prefixIcon: Icon(Icons.location_pin),
                      prefixIconColor: Colors.teal,
                      hintText: 'Address',
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
                Padding(
                  padding: EdgeInsets.fromLTRB(0.w, 0.h, 310.w, 0.h),
                  child: Text(
                    'Working Days',
                    style: TextStyle(
                      fontSize: 7.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(3.w, 5.h, 3.w, 3.h),
                  //child: DateTimeFormField(
                  child: TextFormField(
                    controller: workingDaysController,
                    decoration:  InputDecoration(
                      suffixIcon: Icon(Icons.date_range_outlined),
                      suffixIconColor: Colors.teal,
                      hintText: 'Working Days',
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
                    //value: selectedDate,
                    //dateFormat: DateFormat.yMMMd(),
                    //mode: DateTimeFieldPickerMode.date,
                    //onChanged: (DateTime? value) {
                      //setState(() {
                        //selectedDate = value;
                      //});
                    //},
                  ),
                  ),
                Padding(
                  padding: EdgeInsets.fromLTRB(3.w, 2.h, 3.w, 1.h),
                  child: ElevatedButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        print('${nameController.text}');
                        print('${phoneNumberController.text}');
                        print('${addressController.text}');
                        print('${workingDaysController.text}');
                        Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()),);
                      }
                    },
                    child: Center(
                      child:  Text('Continue' ,style: TextStyle(
                      fontSize: 10.sp,
                        fontWeight: FontWeight.bold,
                      ),),
                    ),
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.teal,
                      padding: EdgeInsets.fromLTRB(0.w, 13.h, 0.w, 13.h),
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