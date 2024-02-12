import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
//import 'package:intl_phone_field/intl_phone_field.dart';
//import 'package:date_field/date_field.dart';
//import 'package:intl/intl.dart';
import 'package:intl/intl_standalone.dart' if (dart.library.html) 'package:intl/intl_browser.dart';

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
  DateTime? selectedDate;
  DateTime? selectedTime;
  DateTime? selectedDateTime;

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
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Welcome',
                      style: TextStyle(
                          fontSize: 8.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Please fill your information',
                      style: TextStyle(
                          fontSize: 4.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Name',
                      style: TextStyle(
                        fontSize: 6.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding:  EdgeInsets.all(2.h.w),
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Phone Number',
                      style: TextStyle(
                        fontSize: 6.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding:  EdgeInsets.all(3.h.w),
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
                      final regexp = RegExp(r'^\s*(?:\+?(\d{1,3}))?[-. (]*(\d{3})[-. ]*(\d{4})(?: *x(\d+))?\s*$');
                      if(!regexp.hasMatch(value)) {
                        return 'Enter a valid Email';
                      }
                      return null;
                    },

                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Address',
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Working Days',
                      style: TextStyle(
                        fontSize: 6.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding:  EdgeInsets.all(3.h.w),
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
                SizedBox(
                  height: 15.h,
                ),
                Padding(
                  padding: EdgeInsets.all(2.h.w),
                  child: ElevatedButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        print('${nameController.text}');
                        print('${phoneNumberController.text}');
                        print('${addressController.text}');
                        print('${workingDaysController.text}');
                        //print('${workingHoursController.text}');
                        //Navigator.push(context, MaterialPageRoute(builder: (context) => Welcome()),);
                      }
                    },
                    child: Center(
                      child: const Text('Continue'),
                    ),
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.teal,
                      //padding: EdgeInsets.fromLTRB(0.w, 20.h, 0.w, 20.h),

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