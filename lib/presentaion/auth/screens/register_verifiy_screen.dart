
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/presentaion/auth/screens/sign_up_screen.dart';

import '../../../components.dart';

import '../../../core/constant/colors.dart';import '../../../network_exceptions.dart';
import '../manager/verify_code/verifiy_code_cubit.dart';

import '../manager/verify_code/verifiy_code_state.dart';
import 'found_account.dart';
import 'main_screen.dart';

class RegisterVerifiyScreen extends StatelessWidget {
  var formKey = GlobalKey<FormState>();
  var codeController = TextEditingController();

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
              'verify_account ',
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
                  MaterialPageRoute(builder: (context) => SignUpScreen()));
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
                'Second, Enter the verification code',
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
                controller: codeController,
                keyboardType: TextInputType.number,
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
                  labelText: 'code  ',
                  labelStyle: TextStyle(
                    color: AppColors.mediumGray,
                    fontSize: 14.0,
                    fontFamily: 'Bahnschrift',
                  ),
                  hintText: 'enter code ',
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
                  if (value.length < 6) {
                    return 'this code should be   6 number';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: screenHeight / 10,
              ),
              BlocConsumer<VerifiyCodeCubit, VerifiyCodeState>(
                  listener: (context, state) {
                state.whenOrNull(
                  success: (result) {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MainScreen(),
                        ));
                    return showAlertDialog(context, 'تم التحقق بنجاح');
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
                          var result = context
                              .read<VerifiyCodeCubit>()
                              .emitVerifyCode(otp: codeController.text);

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
                          var result = context
                              .read<VerifiyCodeCubit>()
                              .emitVerifyCode(otp: codeController.text);

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
