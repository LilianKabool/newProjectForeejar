
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


import '../../../components.dart';
import '../../../core/constant/colors.dart';
import '../../../network_exceptions.dart';
import '../manager/login/auth_log_in_cubit.dart';
import '../manager/login/auth_log_in_state.dart';
import '../manager/visibality_password/visibility_password_cubit.dart';
import '../manager/visibality_password/visibility_password_state.dart';
import '../widgets/forget_password_text.dart';
import '../widgets/image_for_logo.dart';
import '../widgets/language_text.dart';
import '../widgets/register_text.dart';
import '../widgets/skip_login.dart';
import 'main_screen.dart';


class LoginScreen extends StatelessWidget {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  bool password = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              imageWidget(),
              text(
                textData: 'Mobility Redefined',
                color: AppColors.darkGray,
                fontSize: 22.sp,
              ),
              SizedBox(height: 10.h),
              text(
                textData: 'No Security Deposite',
                color: AppColors.semiBlack,
                fontSize: 18.sp,
              ),
              const SizedBox(
                height: 30.0,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  right: 20.0,
                  left: 20.0,
                ),
                child: TextFormField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "please enter your name ";
                    } else {
                      return null;
                    }
                  },
                  decoration: InputDecoration(
                    hintText: 'User Name',
                    hintStyle: TextStyle(
                      fontSize: 13.sp,
                      color: AppColors.mediumGray,
                      fontFamily: 'BAHNSCHRIF',
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                        4.0.r,
                      ),
                      borderSide: BorderSide(
                        width: 354.w,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4.0.r),
                      borderSide: BorderSide(
                        color: AppColors.mediumGolden1,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(4.0.r),
                      borderSide: BorderSide(
                        color: AppColors.mediumGolden1,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20.0.h,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  right: 20.0,
                  left: 20.0,
                ),
                child: BlocBuilder<VisibilityPasswordCubit , VisibilityPasswordState>(
                  builder: (context, state) {
                    return  TextFormField(
                      obscureText: password,
                      controller: passwordController,
                      keyboardType: TextInputType.visiblePassword,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "please enter your password ";
                        } else {
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                        hintText: 'Password',
                        hintStyle: TextStyle(
                          fontFamily: 'BAHNSCHRIF',
                          fontSize: 13.sp,
                          color: AppColors.mediumGray,
                        ),
                        suffixIcon: IconButton(
                          onPressed: () {
                            BlocProvider.of<VisibilityPasswordCubit>(context)
                                .emitChangeVisibilityPassword();
                            password = BlocProvider
                                .of<VisibilityPasswordCubit>(context)
                                .password;
                          },
                          icon: Icon(
                            password ? Icons.visibility : Icons.visibility_off,
                          ),

                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(
                            4.0,
                          ),
                          borderSide: BorderSide(
                            width: 354.w,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4.0.r),
                          borderSide: BorderSide(
                            color: AppColors.mediumGolden1,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4.0.r),
                          borderSide: BorderSide(
                            color: AppColors.mediumGolden1,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                height: 20.0.h,
              ),
              BlocConsumer<UserLogInCubit, UserLogInState>(
                listener: (context, state) {
                  state.whenOrNull(
                    success: (loginModel) {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MainScreen(),
                          ));
                      return showAlertDialog(
                          context, "Logged in successfully!");
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
                      return Padding(
                        padding: const EdgeInsets.only(
                          left: 20.0,
                          right: 20.0,
                        ),
                        child: Container(
                          width: 354.w,
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                AppColors.semiDarkGolden,
                                AppColors.mediumGolden1,
                                AppColors.mediumGolden2,
                              ],
                            ),
                          ),
                          child: TextButton(
                              child: Text(
                                "Login",
                                style: TextStyle(
                                  color: AppColors.brown,
                                  fontSize: 22.sp,
                                  fontFamily: 'BAHNSCHRIF',
                                ),
                              ),
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  var result =
                                  BlocProvider.of<UserLogInCubit>(context)
                                      .emitLogInUser(email:emailController.text,
                                      password:   passwordController.text);
                                  return result;
                                } else {
                                  print('null ');
                                }
                              }),
                        ),
                      );
                    },
                    initial: () {
                      return Padding(
                        padding: const EdgeInsets.only(
                          left: 20.0,
                          right: 20.0,
                        ),
                        child: Container(
                          width: 354.w,
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                AppColors.semiDarkGolden,
                                AppColors.mediumGolden1,
                                AppColors.mediumGolden2,
                              ],
                            ),
                          ),
                          child: TextButton(
                              child: Text(
                                "Login",
                                style: TextStyle(
                                  color: AppColors.brown,
                                  fontSize: 22.sp,
                                  fontFamily: 'BAHNSCHRIF',
                                ),
                              ),
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  var result =
                                  BlocProvider.of<UserLogInCubit>(context)
                                      .emitLogInUser(email:emailController.text,
                                      password:   passwordController.text);
                                  return result;
                                }
                                else {
                                  print('null ');
                                }
                              }),
                        ),
                      );
                    },
                    loading: () {
                      return const CircularProgressIndicator();
                    },
                  );
                },
              ),
              SizedBox(
                height: 10.0.h,
              ),
              forgetPasswordText(context),
              SizedBox(
                height: 21.0.h,
              ),
              registerText(context),
              SizedBox(
                height: 10.0.w,
              ),
              skipLogin(context),
              SizedBox(
                height: 40.h,
              ),
              languageText(),
            ],
          ),
        ),
      ),
    );
  }
  // void showToast(String message) {
  //   Fluttertoast.showToast(
  //     msg: message,
  //     toastLength: Toast.LENGTH_SHORT,
  //     gravity: ToastGravity.BOTTOM,
  //     timeInSecForIosWeb: 1,
  //     backgroundColor: Colors.red,
  //     textColor: Colors.white,
  //     fontSize: 16.0,
  //   );
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

