
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled/presentaion/auth/screens/resend_otp.dart';
import '../../../core/constant/colors.dart';
import 'login_screen.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image(
          image: AssetImage("assets/images/logo2.jpg"),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => LoginScreen()),
            );
          },
          icon: Icon(
            Icons.chevron_left,
            color: AppColors.semiDarkGolden,
          ),
        ),
        actions: [
          IconButton(onPressed: (){
           // return showOption(context);
    }, icon: Icon(Icons.menu),),
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1.0.h),
          child: Container(
            color: AppColors.gray,
            height: 2.0.h,
          ),
        ),
      ),
    );
  }
}showOption (BuildContext context){
  return showDialog(
    context: context,
    builder: (context) =>AlertDialog(
      content: SingleChildScrollView(
        child: Column(
          children: [
            ListTile(
              leading : Icon(Icons.settings_outlined,color: AppColors.lightGolden,),
              title: Text(
                'resend otp',
              ),
              onTap:() {Navigator.push(context, MaterialPageRoute(builder: (context)=>ResendOtpScreen()));},
            ),
            ListTile(
              leading : Icon(Icons.logout_outlined,color:AppColors.lightGolden,),
              title: Text(
                'Log Out',
              ),
              onTap:() {},
            ), ListTile(
              leading : Icon(Icons.logout_outlined,color:AppColors.lightGolden,),
              title: Text(
                'change password',
              ),
              onTap:() {},
            ),
          ],
        ),
      ),
    ),
  );
}