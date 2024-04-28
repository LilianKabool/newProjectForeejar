
import '../../../core/constant/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/services.dart';

import '../../../core/constant/colors.dart';
import '../../../feature/user/entity/profile_entity.dart';
class EditProfileScreen extends StatefulWidget {
  final BaseProfileEntity baseProfileEntity;

  const EditProfileScreen({super.key, required this.baseProfileEntity});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 30.h,),
              Padding(
                padding: EdgeInsets.all(8.0.r),
                child: TextFormField(
                  initialValue: widget.baseProfileEntity.profile.phone,
                  decoration: InputDecoration(
                    hintText: 'Phone Number',
                    prefixIcon: Icon(Icons.phone),
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.phone,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                ),
              ),
              SizedBox(height: 10.h,),
              Padding(
                padding: EdgeInsets.all(8.0.r),
                child: TextFormField(
                  initialValue: widget.baseProfileEntity.profile.address,
                  decoration: InputDecoration(
                    hintText: 'Address',
                    prefixIcon: Icon(Icons.location_on),
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.streetAddress,
                ),
              ),
              SizedBox(height: 10.h,),
              CupertinoButton(
                color: AppColors.darkGolden,
                child: Text("Done"),
                onPressed: () {
                  // Save the edited information logic here
                }
              ),
            ],
          ),
        ),
      ),
    );
  }
}
