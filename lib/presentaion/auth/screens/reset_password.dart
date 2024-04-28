
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../components.dart';
import '../../../core/constant/colors.dart';import '../../../network_exceptions.dart';
import '../manager/reset_password/reset_password_cubit.dart';
import '../manager/reset_password/reset_password_state.dart';
import '../manager/visibality_password/visibility_password_cubit.dart';
import '../manager/visibality_password/visibility_password_state.dart';
import 'main_screen.dart';

class ResetPasswordScreen extends StatelessWidget {
  var formKey = GlobalKey<FormState>();
  var newPassword = TextEditingController();
  var confirm_password = TextEditingController();
  var otp = TextEditingController();
  bool passwordVisible = true;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Form(
      key: formKey,
      child: Scaffold(
        appBar: AppBar(
          title: Align(
            alignment: Alignment.centerRight,
            child: Text(
              'Reset Password',
              style: TextStyle(
                color: AppColors.semiDarkGolden,
                fontFamily: 'Bahnschrift',
                fontSize: 18,
                fontWeight: FontWeight.w100,
              ),
            ),
          ),
          //centerTitle: true,
          leading: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.chevron_left,
              color: AppColors.semiDarkGolden,
            ),
          ),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(1.0),
            child: Container(
              color: AppColors.gray,
              height: 2.0,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(
                  image: AssetImage("assets/images/logo2.jpg"),
                  width: screenWidth / 2,
                  height: screenHeight / 8,
                ),
                SizedBox(
                  height: screenHeight / 10,
                ),
                Text(
                  'Third, Please Reset Your Account Password',
                  style: TextStyle(
                    color: AppColors.mediumGolden1,
                    fontFamily: 'bahnschrift',
                    fontSize: 16,
                    fontWeight: FontWeight.w100,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: screenHeight / 75,
                ),
                TextFormField(
                  controller: otp,
                  decoration: InputDecoration(
                    isDense: true,
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 1.0,
                        color: AppColors.mediumGolden1,
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(4.0),
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 1.0,
                        color: AppColors.mediumGolden1,
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(4.0),
                      ),
                    ),
                    labelText: 'otp',
                    labelStyle: TextStyle(
                      color: AppColors.mediumGray,
                      fontSize: 14.0,
                      fontFamily: 'Bahnschrift',
                    ),
                    hintText: 'enter otp',
                    hintStyle: TextStyle(
                      color: AppColors.gray,
                      fontSize: 13.0,
                      fontFamily: 'Bahnschrift',
                    ),
                    suffixIcon: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.numbers,
                      ),
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
                    if (value.length < 6) {
                      return ' this is code should be 6 number';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: screenHeight / 30,
                ),
                BlocBuilder<VisibilityPasswordCubit, VisibilityPasswordState>(
                  builder: (context, state) {
                    return TextFormField(
                      controller: newPassword,
                      obscureText: passwordVisible,
                      decoration: InputDecoration(
                        isDense: true,
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 1.0,
                            color: AppColors.mediumGolden1,
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(4.0),
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            width: 1.0,
                            color: AppColors.mediumGolden1,
                          ),
                          borderRadius: BorderRadius.all(
                            Radius.circular(4.0),
                          ),
                        ),
                        labelText: 'New Password',
                        labelStyle: TextStyle(
                          color: AppColors.mediumGray,
                          fontSize: 14.0,
                          fontFamily: 'Bahnschrift',
                        ),
                        hintText: 'enter new password',
                        hintStyle: TextStyle(
                          color: AppColors.gray,
                          fontSize: 13.0,
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
                          ),
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
                    );
                  },
                ),
                SizedBox(
                  height: screenHeight / 30,
                ),
                TextFormField(
                  controller: confirm_password,
                  obscureText: passwordVisible,
                  decoration: InputDecoration(
                    isDense: true,
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 1.0,
                        color: AppColors.mediumGolden1,
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(4.0),
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 1.0,
                        color: AppColors.mediumGolden1,
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(4.0),
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
                      fontSize: 13.0,
                      fontFamily: 'Bahnschrift',
                    ),
                    suffixIcon: IconButton(
                      onPressed: () {
                        BlocProvider.of<VisibilityPasswordCubit>(context)
                            .emitChangeVisibilityPassword();
                        BlocProvider.of<VisibilityPasswordCubit>(context)
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
                    if (newPassword.text != confirm_password.text) {
                      return "doesn\'t match with your password";
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: screenHeight / 15,
                ),
                BlocConsumer<ResetPasswordCubit, ResetPasswordState>(
                  listener: (context, state) {
                    state.whenOrNull(
                      success: (result) {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MainScreen(),
                            ));
                        return showAlertDialog(context, result.toString());
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
                              var result = context
                                  .read<ResetPasswordCubit>()
                                  .emitResetOtp(
                                otp: otp.text,
                                    password:newPassword.text ,
                                    passwordConfirmation: confirm_password.text,

                                  );

                              return result;
                            } else {
                              print('null ');
                            }
                          },
                          child: Container(
                            width: double.infinity,
                            height: screenHeight / 15,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  AppColors.semiDarkGolden,
                                  AppColors.mediumGolden1,
                                  AppColors.mediumGolden2,
                                ],
                              ),
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            child: Center(
                              child: Text(
                                'Reset',
                                style: TextStyle(
                                  fontSize: 20,
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
                                  .read<ResetPasswordCubit>()
                                  .emitResetOtp(
                                otp: otp.text,
                                password:newPassword.text ,
                                passwordConfirmation: confirm_password.text,

                              );

                              return result;
                            } else {
                              print('null ');
                            }
                          },
                          child: Container(
                            width: double.infinity,
                            height: screenHeight / 15,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  AppColors.semiDarkGolden,
                                  AppColors.mediumGolden1,
                                  AppColors.mediumGolden2,
                                ],
                              ),
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            child: Center(
                              child: Text(
                                'Reset',
                                style: TextStyle(
                                  fontSize: 20,
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
              ],
            ),
          ),
        ),
      ),
    );
  }
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
