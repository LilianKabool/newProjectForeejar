
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/presentaion/auth/screens/register_verifiy_screen.dart';

import '../../../core/constant/colors.dart';import '../../../network_exceptions.dart';
import '../../../components.dart';
import '../manager/resend_otp/resend_otp_cubit.dart';
import '../manager/resend_otp/resend_otp_state.dart';
import 'login_screen.dart';


class ResendOtpScreen extends StatelessWidget {
  var formKey = GlobalKey<FormState>();
  var emailForResendOtp = TextEditingController();

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
              'resend otp',
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
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => LoginScreen()));
            },
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
        body: Padding(
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
                'First, Enter Your Email Address ',
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
                controller: emailForResendOtp,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  isDense: true,
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: AppColors.mediumGolden1,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(4.0),
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: AppColors.mediumGolden1,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(4.0),
                    ),
                  ),
                  labelText: 'Email Address ',
                  labelStyle: TextStyle(
                    color: AppColors.mediumGray,
                    fontSize: 14.0,
                    fontFamily: 'Bahnschrift',
                  ),
                  hintText: 'enter eamil ',
                  hintStyle: TextStyle(
                    color: AppColors.gray,
                    fontSize: 13.0,
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
              SizedBox(
                height: screenHeight / 10,
              ),
              BlocConsumer<ResendOtpCubit, ResendOtpState>(
                  listener: (context, state) {
                    state.whenOrNull(
                      success: (result) {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => RegisterVerifiyScreen(),

                            ));
                        return showAlertDialog(context, result.toString());
                      },
                      error: (error) {
                        return showAlertDialog(
                            context, NetworkExceptions.getErrorMessage(error));
                      },
                    );
                  }, builder: (context, state) {
                return state.maybeWhen(
                  orElse: () {
                    return GestureDetector(
                      onTap: () {
                        if (formKey.currentState!.validate()) {
                          var result =
                          context.read<ResendOtpCubit>().emitResendOtp(email:emailForResendOtp.text);

                          return result;
                        }
                        return null;
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
                            'Next',
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
                  idel: () {
                    return GestureDetector(
                      onTap: () {
                        if (formKey.currentState!.validate()) {
                          var result =
                          context.read<ResendOtpCubit>().emitResendOtp(email:emailForResendOtp.text);

                          return result;
                        }
                        return null;
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
                            'Next',
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
                );
              })
            ],
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
