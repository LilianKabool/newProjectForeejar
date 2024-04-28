import 'package:bloc/bloc.dart';
import 'package:untitled/feature/owner/entity/my_products_entity.dart';
import 'package:untitled/presentaion/auth/manager/check_box/check_box_cubit.dart';

import 'package:untitled/presentaion/auth/manager/drop_down_button/drop_down_button_cubit.dart';

import 'package:untitled/presentaion/auth/manager/forget_password/forget_password_cubit.dart';
import 'package:untitled/presentaion/auth/manager/login/auth_log_in_cubit.dart';
import 'package:untitled/presentaion/auth/manager/register/register_cubit.dart';
import 'package:untitled/presentaion/auth/manager/resend_otp/resend_otp_cubit.dart';
import 'package:untitled/presentaion/auth/manager/reset_password/reset_password_cubit.dart';
import 'package:untitled/presentaion/auth/manager/verify_code/verifiy_code_cubit.dart';
import 'package:untitled/presentaion/auth/manager/visibality_password/visibility_password_cubit.dart';
import 'package:untitled/presentaion/owner/manager/active_subscription_cubit.dart';
import 'package:untitled/presentaion/owner/manager/add_photo_to_product_cubit.dart';
import 'package:untitled/presentaion/owner/manager/edit_info_for_product/change_info_cubit.dart';
import 'package:untitled/presentaion/owner/manager/get_category_attributes_cubit.dart';
import 'package:untitled/presentaion/owner/manager/my_products_cubit.dart';
import 'package:untitled/presentaion/owner/manager/my_subscription_cubit.dart';
import 'package:untitled/presentaion/owner/manager/processing_orders_cubit.dart';
import 'package:untitled/presentaion/owner/manager/set_card_info_cubit.dart';
import 'package:untitled/presentaion/owner/manager/subscripe_cubit.dart';
import 'package:untitled/presentaion/owner/manager/subscription_cubit.dart';
import 'package:untitled/presentaion/owner/manager/update_product_cubit.dart';
import 'package:untitled/presentaion/owner/screens/details_screen.dart';
import 'package:untitled/presentaion/owner/screens/update_product.dart';
import 'package:untitled/presentaion/owner/widgets/profile_widget.dart';
import 'package:untitled/presentaion/user/manager/get_profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:untitled/presentaion/auth/manager/login/auth_log_in_cubit.dart';
import 'injection_container.dart';
import 'observer.dart';

void main() async {
  Bloc.observer = AppBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    BaseMyProductEntity baseMyProductEntity ;

    return ScreenUtilInit(
      designSize: Size(360, 590),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => getItMhamad<UserLogInCubit>(),
          ),
          BlocProvider(
            create: (context) => getItMhamad<VisibilityPasswordCubit>(),
          ),
          BlocProvider(
            create: (context) => getItMhamad<SubscriptionCubit>(),
          ),
          BlocProvider(
            create: (context) => getItMhamad<MySubscriptionCubit>(),
          ),
          BlocProvider(
            create: (context) => getItMhamad<MyProductsCubit>(),
          ),
          BlocProvider(
            create: (context) => getItMhamad<ProcessingOrdersCubit>(),
          ),
          BlocProvider(
            create: (context) => getItMhamad<VerifiyCodeCubit>(),
          ),
          BlocProvider(
            create: (context) => getItMhamad<ForgetPasswordCubit>(),
          ),
          BlocProvider(
            create: (context) => getItMhamad<ResendOtpCubit>(),
          ),
          BlocProvider(
            create: (context) => getItMhamad<ResetPasswordCubit>(),
          ),
          BlocProvider(
            create: (context) => getItMhamad<CheckBoxCubit>(),
          ),
          BlocProvider(
            create: (context) => getItMhamad<DropDownButtonCubit>(),
          ),
          BlocProvider(
            create: (context) => getItMhamad<RegisterCubit>(),
          ),
          BlocProvider(
            create: (context) => getItMhamad<SubscripeCubit>(),
          ),
          BlocProvider(
            create: (context) => getItMhamad<ActiveSubscriptionCubit>(),
          ),
          BlocProvider(
            create: (context) => getItMhamad<SetCardInfoCubit>(),
          ),
          BlocProvider(
            create: (context) => getItMhamad<AddPhotoToProductCubit>(),
          ),
          BlocProvider(
            create: (context) => getItMhamad<GetCategoryAttributesCubit>(),
          ),
          BlocProvider(
            create: (context) => getItMhamad<UpdateProductCubit>(),
          ),
          BlocProvider(
            create: (context) => getItMhamad<ChangeInfoCubit>(),
          ),
          BlocProvider(create: (context) => getItMhamad<GetProfileCubit>(),),
        ],
        child: MaterialApp(
          home: OwnerProfileScreen(),
        ),
      ),
    );
  }
}
