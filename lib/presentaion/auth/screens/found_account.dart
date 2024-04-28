
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/presentaion/auth/screens/reset_password.dart';

import '../../../components.dart';

import '../../../core/constant/colors.dart';
import '../../../network_exceptions.dart';
import '../manager/verify_code/verifiy_code_cubit.dart';

import '../manager/verify_code/verifiy_code_state.dart';

class AccountFoundScreen extends StatelessWidget {
  List resultControllers = [];
  List<TextEditingController> controllers =
      List.generate(6, (index) => TextEditingController());
  var CodeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Congratulation!',
              style: TextStyle(
                color: AppColors.mediumGolden1,
                fontFamily: 'bahnschrift',
                fontSize: 20,
                fontWeight: FontWeight.w100,
              ),
              textAlign: TextAlign.center,
            ),
            Text(
              'Your account has been found',
              style: TextStyle(
                color: AppColors.mediumGolden1,
                fontFamily: 'bahnschrift',
                fontSize: 18,
                fontWeight: FontWeight.w100,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: screenHeight / 10,
            ),
            Text(
              'Second, Enter the verification code',
              style: TextStyle(
                color: AppColors.pureBlack,
                fontFamily: 'bahnschrift',
                fontSize: 16,
                fontWeight: FontWeight.w100,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: screenHeight / 75,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(6, (index) {
                return Container(
                  width: 45,
                  height: 70,
                  margin: EdgeInsets.symmetric(horizontal: 5),
                  alignment: Alignment.center,
                  child: TextField(
                    controller: controllers[index],
                    textAlign: TextAlign.center,
                    maxLength: 1,
                    keyboardType: TextInputType.number,
                    cursorColor: AppColors.mediumGolden1,
                    decoration: InputDecoration(
                      isDense: true,
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: AppColors.mediumGolden1,
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.0),
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: AppColors.mediumGolden1,
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.0),
                        ),
                      ),
                    ),
                    onChanged: (value) {
                      if (value.isNotEmpty && index < 6) {
                        resultControllers.add(value);
                        FocusScope.of(context).nextFocus();
                      }
                    },
                  ),
                );
              }),
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
                          builder: (context) => ResetPasswordScreen(),
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
                        context.read<VerifiyCodeCubit>().emitVerifyCode(
                              otp: CodeController.text,
                            );
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
                  idel: () {
                    return GestureDetector(
                      onTap: () {
                        context.read<VerifiyCodeCubit>().emitVerifyCode(
                          otp: CodeController.text,
                        );
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
                );
              },
            ),
          ],
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
