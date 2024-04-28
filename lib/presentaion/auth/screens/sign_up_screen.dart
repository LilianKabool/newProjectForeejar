import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled/presentaion/auth/screens/register_verifiy_screen.dart';

import '../../../components.dart';
import '../../../core/constant/colors.dart';import '../../../network_exceptions.dart';
import '../manager/check_box/check_box_cubit.dart';
import '../manager/check_box/check_box_state.dart';
import '../manager/drop_down_button/drop_down_button_cubit.dart';
import '../manager/drop_down_button/drop_down_button_state.dart';
import '../manager/register/register_cubit.dart';
import '../manager/register/register_state.dart';
import '../manager/visibality_password/visibility_password_cubit.dart';
import '../manager/visibality_password/visibility_password_state.dart';
import 'login_screen.dart';

class SignUpScreen extends StatelessWidget {
  bool passwordVisible = true;
  var first_name = TextEditingController();
  var last_name = TextEditingController();
  var email_adress = TextEditingController();
  var password = TextEditingController();
  var confirm_password = TextEditingController();
  var gender = TextEditingController();
  var formKey = GlobalKey<FormState>();
  var selectGender = ["Male", "Female", "Other", ""];

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Sign Up',
            style: TextStyle(
              color: AppColors.semiDarkGolden,
              fontFamily: 'Bahnschrift',
              fontSize: 20,
            ),
          ),
          centerTitle: true,
          leading: IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => LoginScreen(),
                ),
              );
            },
            icon: Icon(
              Icons.chevron_left,
              color: AppColors.semiDarkGolden,
            ),
          ),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(1.0.h),
            child: Container(
              color: AppColors.gray,
              height: 2.0.h,
            ),
          ),
        ),
        body: Form(
          key: formKey,
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 30.0),
                child: Image(
                  image: AssetImage("assets/images/logo2.jpg"),
                  width: 230.w,
                  height: 83.h,
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                child: TextFormField(
                  controller: first_name,
                  decoration: InputDecoration(
                    isDense: true,
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 1.0.w,
                        color: AppColors.mediumGolden1,
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(4.0.r),
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 1.0.w,
                        color: AppColors.mediumGolden1,
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(4.0.r),
                      ),
                    ),
                    labelText: 'First Name',
                    labelStyle: TextStyle(
                      color: AppColors.mediumGray,
                      fontSize: 14.0.sp,
                      fontFamily: 'Bahnschrift',
                    ),
                    hintText: 'enter your name',
                    hintStyle: TextStyle(
                      color: AppColors.gray,
                      fontSize: 13.0.sp,
                      fontFamily: 'Bahnschrift',
                    ),
                  ),
                  onChanged: (value) {
                    print(value);
                  },
                  onFieldSubmitted: (value) {
                    print(value);
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'this field must not be empty';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                child: TextFormField(
                  controller: last_name,
                  decoration: InputDecoration(
                    isDense: true,
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 1.0.w,
                        color: AppColors.mediumGolden1,
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(4.0.r),
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 1.0.w,
                        color: AppColors.mediumGolden1,
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(4.0.r),
                      ),
                    ),
                    labelText: 'Last Name',
                    labelStyle: TextStyle(
                      color: AppColors.mediumGray,
                      fontSize: 14.0.sp,
                      fontFamily: 'Bahnschrift',
                    ),
                    hintText: 'enter your name',
                    hintStyle: TextStyle(
                      color: AppColors.gray,
                      fontSize: 13.0.sp,
                      fontFamily: 'Bahnschrift',
                    ),
                  ),
                  onChanged: (value) {
                    print(value);
                  },
                  onFieldSubmitted: (value) {
                    print(value);
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'this field must not be empty';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                child: TextFormField(
                  controller: email_adress,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    isDense: true,
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 1.0.w,
                        color: AppColors.mediumGolden1,
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(4.0.r),
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 1.0.w,
                        color: AppColors.mediumGolden1,
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(4.0.r),
                      ),
                    ),
                    labelText: 'Email Address',
                    labelStyle: TextStyle(
                      color: AppColors.mediumGray,
                      fontSize: 14.0.sp,
                      fontFamily: 'Bahnschrift',
                    ),
                    hintText: 'enter email address',
                    hintStyle: TextStyle(
                      color: AppColors.gray,
                      fontSize: 13.0.sp,
                      fontFamily: 'Bahnschrift',
                    ),
                  ),
                  onChanged: (value) {
                    print(value);
                  },
                  onFieldSubmitted: (value) {
                    print(value);
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'this field must not be empty';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                child: BlocBuilder<VisibilityPasswordCubit,
                    VisibilityPasswordState>(
                  builder: (context, state) {
                    return TextFormField(
                      controller: password,
                      obscureText: passwordVisible,
                      decoration: InputDecoration(
                        isDense: true,
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 1.0,
                            color: AppColors.mediumGolden1,
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(4.0.r),
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 1.0,
                            color: AppColors.mediumGolden1,
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(4.0.r),
                          ),
                        ),
                        labelText: 'Password',
                        labelStyle: TextStyle(
                          color: AppColors.mediumGray,
                          fontSize: 14.0.sp,
                          fontFamily: 'Bahnschrift',
                        ),
                        hintText: 'enter password',
                        hintStyle: TextStyle(
                          color: AppColors.gray,
                          fontSize: 13.0.sp,
                          fontFamily: 'Bahnschrift',
                        ),
                        suffixIcon: IconButton(
                          onPressed: () {
                            BlocProvider.of<VisibilityPasswordCubit>(context)
                                .emitChangeVisibilityPassword();
                            passwordVisible =
                                BlocProvider.of<VisibilityPasswordCubit>(
                                        context)
                                    .password;
                          },
                          icon: Icon(
                            passwordVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: AppColors.mediumGolden1,
                          ),
                        ),
                      ),
                      onTap: () {},
                      onFieldSubmitted: (value) {
                        print(value);
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'this field must not be empty';
                        }
                        return null;
                      },
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                child: BlocBuilder<VisibilityPasswordCubit,
                    VisibilityPasswordState>(
                  builder: (context, state) {
                    return TextFormField(
                      controller: confirm_password,
                      obscureText: passwordVisible,
                      decoration: InputDecoration(
                        isDense: true,
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 1.0.w,
                            color: AppColors.mediumGolden1,
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(4.0.r),
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 1.0,
                            color: AppColors.mediumGolden1,
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(4.0.r),
                          ),
                        ),
                        labelText: 'Confirm Password',
                        labelStyle: TextStyle(
                          color: AppColors.mediumGray,
                          fontSize: 14.0,
                          fontFamily: 'Bahnschrift',
                        ),
                        hintText: 'enter password',
                        hintStyle: TextStyle(
                          color: AppColors.gray,
                          fontSize: 13.0.sp,
                          fontFamily: 'Bahnschrift',
                        ),
                        suffixIcon: IconButton(
                          onPressed: () {
                            BlocProvider.of<VisibilityPasswordCubit>(context)
                                .emitChangeVisibilityPassword();
                            passwordVisible =
                                BlocProvider.of<VisibilityPasswordCubit>(
                                        context)
                                    .password;
                          },
                          icon: Icon(
                            passwordVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: AppColors.mediumGolden1,
                          ),
                        ),
                      ),
                      onFieldSubmitted: (value) {
                        print(value);
                      },
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'this field must not be empty';
                        }
                        if (password.text != confirm_password.text) {
                          return "doesn\'t match with your password";
                        }
                        return null;
                      },
                    );
                  },
                ),
              ),
              BlocBuilder<DropDownButtonCubit, DropDownButtonState>(
                builder: (context, state) {
                  return Container(
                    height: screenHeight / 13,
                    margin: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                    child: DropdownButtonFormField<String>(
                      isDense: true,
                      value: BlocProvider.of<DropDownButtonCubit>(context)
                          .selectedGender,
                      onChanged: (newValue) {
                        BlocProvider.of<DropDownButtonCubit>(context)
                            .emitDropDownButtonBox(newValue);
                      },
                      items: selectGender.map((String item) {
                        return DropdownMenuItem<String>(
                          value: item,
                          child: Text(
                            item,
                            style: TextStyle(
                              color: AppColors.mediumGray,
                              fontSize: 14.0.sp,
                              fontFamily: 'Bahnschrift',
                            ),
                          ),
                        );
                      }).toList(),
                      borderRadius: BorderRadius.circular(31.0.r),
                      iconEnabledColor: AppColors.mediumGolden1,
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.person,
                        ),
                        prefixIconColor: AppColors.mediumGolden1,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: AppColors.mediumGolden1,
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(4.0.r),
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: AppColors.mediumGolden1,
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(4.0.r),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
                child: Row(
                  children: [
                    BlocBuilder<CheckBoxCubit, CheckBoxState>(
                      builder: (context, state) {
                        return Checkbox(
                            activeColor: AppColors.gray,
                            value: BlocProvider.of<CheckBoxCubit>(context)
                                .isFirstChecked,
                            onChanged: (bool? value) {
                              BlocProvider.of<CheckBoxCubit>(context)
                                  .emitFirstChangeCheckBox(value);
                            });
                      },
                    ),
                    Expanded(
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'I agree to the',
                              style: TextStyle(
                                fontSize: 15.sp,
                                fontFamily: 'Bahnschrift',
                                color: AppColors.mediumGray,
                              ),
                            ),
                            TextSpan(
                              text: ' terms of service',
                              style: TextStyle(
                                fontSize: 15.sp,
                                fontFamily: 'Bahnschrift',
                                color: AppColors.mediumGolden1,
                              ),
                            ),
                            TextSpan(
                              text: ' and the',
                              style: TextStyle(
                                fontSize: 15.sp,
                                fontFamily: 'Bahnschrift',
                                color: AppColors.mediumGray,
                              ),
                            ),
                            TextSpan(
                              text: ' privacy of policy',
                              style: TextStyle(
                                fontSize: 15.sp,
                                fontFamily: 'Bahnschrift',
                                color: AppColors.mediumGolden1,
                              ),
                            ),
                          ],
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                child: Row(
                  children: [
                    BlocBuilder<CheckBoxCubit, CheckBoxState>(
                      builder: (context, state) {
                        return Checkbox(
                            activeColor: AppColors.gray,
                            value: BlocProvider.of<CheckBoxCubit>(context)
                                .isSecondChecked,
                            onChanged: (bool? value) {
                              BlocProvider.of<CheckBoxCubit>(context)
                                  .emitSecondChangeCheckBox(value);
                            });
                      },
                    ),
                    Expanded(
                      child: Text(
                        'Yes, send me deals, discounts and updates !',
                        style: TextStyle(
                          fontSize: 15.sp,
                          fontFamily: 'Bahnschrift',
                          color: AppColors.mediumGray,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
                child: BlocConsumer<RegisterCubit, RegisterState>(
                  listener: (context, state) {
                    state.whenOrNull(
                      success: (registerModel) {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => RegisterVerifiyScreen(),
                            ));
                        return showAlertDialog(
                            context, registerModel.toString());
                      },
                      error: (error) {
                        return showAlertDialog(
                            context, NetworkExceptions.getErrorMessage(error));
                      },
                    );
                  },
                  builder: (context, state) {
                    return state.maybeWhen(
                      orElse: () {
                        return GestureDetector(
                          onTap: () {
                            if (formKey.currentState!.validate()) {
                              var result =context
                                  .read<RegisterCubit>()
                                  .emitRegister(
                               password:  password.text,
                                lastName: last_name.text,
                                firstName:  first_name.text,
                                email:  email_adress.text,

                              );

                              return result;
                            } else {
                              print('null ');
                            }
                          },
                          child: Container(
                            width: double.infinity,
                            height: screenHeight / 15.h,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  AppColors.semiDarkGolden,
                                  AppColors.mediumGolden1,
                                  AppColors.mediumGolden2,
                                ],
                              ),
                              borderRadius: BorderRadius.circular(5.0.r),
                            ),
                            child: Center(
                              child: Text(
                                'Sign Up',
                                style: TextStyle(
                                  fontSize: 20.sp,
                                  color: AppColors.brown,
                                  fontFamily: 'Bahnschrift',
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                      idel: () {
                        return GestureDetector(
                          onTap: () {
                            if (formKey.currentState!.validate()) {
                              var result =
                              context
                                  .read<RegisterCubit>()
                                  .emitRegister(
                                password:  password.text,
                                lastName: last_name.text,
                                firstName:  first_name.text,
                                email:  email_adress.text,

                              );

                              return result;
                            } else {
                              print('null ');
                            }
                          },
                          child: Container(
                            width: double.infinity,
                            height: screenHeight / 15.h,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  AppColors.semiDarkGolden,
                                  AppColors.mediumGolden1,
                                  AppColors.mediumGolden2,
                                ],
                              ),
                              borderRadius: BorderRadius.circular(5.0.r),
                            ),
                            child: Center(
                              child: Text(
                                'Sign Up',
                                style: TextStyle(
                                  fontSize: 20.sp,
                                  color: AppColors.brown,
                                  fontFamily: 'Bahnschrift',
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                      loading: () {
                        return const CircularProgressIndicator();
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      );
  }

  showAlertDialog(BuildContext context, message) {
    AlertDialog alert = AlertDialog(
      content: text(
        textData: message,
      ),
    );
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
