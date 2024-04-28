import 'package:cached_network_image/cached_network_image.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/constant/colors.dart';
import '../../../feature/owner/entity/my_products_entity.dart';
import '../../../feature/user/entity/profile_entity.dart';
import '../../../network_exceptions.dart';
import '../../user/manager/get_profile_cubit.dart';
import '../manager/my_products_cubit.dart';
import '../screens/company_subscription_screen.dart';
import '../screens/details_screen.dart';
import '../screens/my_subscription_screen.dart';

class OwnerProfileScreen extends StatefulWidget {
  @override
  State<OwnerProfileScreen> createState() => _OwnerProfileScreenState();
}

class _OwnerProfileScreenState extends State<OwnerProfileScreen> {
  @override
  void initState() {
    context.read<MyProductsCubit>().emitGetMyProduct();
    context.read<GetProfileCubit>().emitgetProfile();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Profile',
          style: TextStyle(
            color: AppColors.semiDarkGolden,
            fontFamily: 'Bahnschrift',
            fontSize: 20.sp,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.chevron_left,
            color: AppColors.semiDarkGolden,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: BlocConsumer<GetProfileCubit, GetProfileState>(
            listener: (context, state) => state.whenOrNull(
                  error: (error) {},
                  //   Fluttertoast.showToast(
                  //       msg: NetworkExceptions.getErrorMessage(error),
                  //       toastLength: Toast.LENGTH_SHORT),
                ),
            builder: (context, state) {
              return state.when(
                error: (networkExceptions) => const SizedBox.shrink(),
                loading: () =>
                    const Center(child: CupertinoActivityIndicator()),
                success: (baseProfileEntity) {
                  return _buildProfileData(baseProfileEntity);
                },
              );
            }),
      ),
    );
  }

  SingleChildScrollView _buildProfileData(BaseProfileEntity baseProfileEntity) {
    return SingleChildScrollView(
      child: Column(
        children: [
          spaceItem(),
          profileAvatar(baseProfileEntity),
          spaceItem(),
          profileName(baseProfileEntity),
          spaceItem(),
          contactInfoRow(baseProfileEntity),
          spaceItem(),
          personalInfoRow(baseProfileEntity),
          spaceItem(),
          editProfileButton(baseProfileEntity),
          spaceItem(),
          subscriptionOptions(),
          spaceItem(),
          GestureDetector(
            onTap: () {},
            child: Container(
              height: 30.h,
              width: 150,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    AppColors.mediumGolden1,
                    AppColors.mediumGolden2,
                    AppColors.mediumGolden1,
                  ],
                ),
                borderRadius: BorderRadius.circular(5.0),
              ),
              child: Center(
                child: Text(
                  'Add Post',
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: AppColors.pureWhite,
                    fontFamily: 'Bahnschrift',
                  ),
                ),
              ),
            ),
          ),
          SpaceItem(),
          postsHeader(baseProfileEntity),
          buildPostsList(),
        ],
      ),
    );
  }

  Widget postItem(BaseMyProductEntity baseMyProductEntity, int index) {
    return Column(
      children: [
        SizedBox(
          height: 50,
          width: 50,
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (_) => ProductDetailsScreen(
                            product:
                                baseMyProductEntity.products[index].productData,
                          )));
            },
            child: ClipRRect(
                borderRadius: BorderRadius.circular(20.r),
                child: baseMyProductEntity.products.isNotEmpty &&
                        baseMyProductEntity
                            .products[index].productData.photos.isNotEmpty
                    ? SizedBox(
                        height: 30.h,
                        width: 30,
                        child: CachedNetworkImage(
                          imageUrl: baseMyProductEntity
                              .products[index].productData.attributes[0].icon,
                          fit: BoxFit.cover,
                          placeholder: (context, url) =>
                              const Center(child: CupertinoActivityIndicator()),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error),
                        ),
                      )
                    : CupertinoActivityIndicator()

                ///todo:make this tomorrow
                ),
          ),
        ),
        SizedBox(height: 10.h),
        Text(
          baseMyProductEntity.products[index].productData.name,
          style: TextStyle(
            color: AppColors.mediumGolden1,
            fontFamily: 'bahnschrift',
            fontSize: 16.sp,
          ),
        ),
      ],
    );
  }

  Widget spaceItem() => SizedBox(height: 20);

  Widget profileAvatar(BaseProfileEntity baseProfileEntity) {
    return Stack(
      alignment: AlignmentDirectional.bottomEnd,
      children: [
        CircleAvatar(
          backgroundColor: AppColors.mediumGolden1,
          radius: 52,
          child: CircleAvatar(
            radius: 50,
          ),
        ),
      ],
    );
  }

  Widget profileName(BaseProfileEntity baseProfileEntity) {
    return Text(
      '${baseProfileEntity.profile.firstName} ${baseProfileEntity.profile.lastName}',
      style: TextStyle(
          color: AppColors.semiBlack, fontFamily: 'bahnschrift', fontSize: 18),
    );
  }

  Widget contactInfoRow(BaseProfileEntity baseProfileEntity) {
    return Row(
      children: [
        contactInfoItem(Icons.phone_outlined, baseProfileEntity.profile.phone),
        contactInfoItem(Icons.home_outlined, baseProfileEntity.profile.address,
            isEnd: true),
      ],
    );
  }

  Widget personalInfoRow(BaseProfileEntity baseProfileEntity) {
    return Row(
      children: [
        contactInfoItem(Icons.person, baseProfileEntity.profile.gender),
        contactInfoItem(Icons.cake_outlined, baseProfileEntity.profile.birthday,
            isEnd: true),
      ],
    );
  }

  Widget contactInfoItem(IconData icon, String text, {bool isEnd = false}) {
    return Expanded(
      child: Row(
        mainAxisAlignment:
            isEnd ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          Icon(icon, color: AppColors.mediumGolden1),
          SizedBox(width: 8),
          Text(text,
              style: TextStyle(
                  color: AppColors.pureBlack,
                  fontFamily: 'bahnschrift',
                  fontSize: 16)),
        ],
      ),
    );
  }

  Widget editProfileButton(BaseProfileEntity baseProfileEntity) {
    return ElevatedButton(
      onPressed: () {
        // Navigator.push(
        //     context,
        //     MaterialPageRoute(
        //         builder: (_) => BlocProvider(
        //               create: (context) => getItMhamad<EditControllerCubit>(),
        //               child: EditProfileScreen(
        //                   baseProfileEntity: baseProfileEntity),
        //             )));
      },
      child: Text('Edit Information',
          style: TextStyle(
              color: AppColors.semiDarkGolden,
              fontFamily: 'bahnschrift',
              fontSize: 16)),
    );
  }

  Widget subscriptionOptions() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          subscriptionOption('My Subscription', () {
            Navigator.push(context,
                MaterialPageRoute(builder: (_) => MySubscriptionScreen()));
          }),
          subscriptionOption('Material Subscription', () {}),
        ],
      ),
    );
  }

  Widget subscriptionOption(String title, Function() onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 140,
        height: 40,
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            AppColors.mediumGolden1,
            AppColors.mediumGolden2,
            AppColors.mediumGolden1
          ]),
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: Center(
            child: Text(title,
                style: TextStyle(
                    fontSize: 13,
                    color: AppColors.pureWhite,
                    fontFamily: 'Bahnschrift'))),
      ),
    );
  }

  Widget postsHeader(BaseProfileEntity baseProfileEntity) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '${baseProfileEntity.profile.firstName + " " + baseProfileEntity.profile.lastName} Posts',
            style: TextStyle(
              color: AppColors.semiBlack,
              fontFamily: 'bahnschrift',
              fontSize: 16.sp,
            ),
          ),
          TextButton(
            onPressed: () {
              // Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //         builder: (_) => MyProductShowingAllScreen()));
            },
            child: Text(
              'Show All',
              style: TextStyle(
                color: AppColors.gray,
                fontFamily: 'bahnschrift',
                fontSize: 14.sp,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildPostsList() {
    return SizedBox(
      height: 220.h,
      child: BlocConsumer<MyProductsCubit, MyProductsState>(
        listener: (context, state) {
          state.whenOrNull(
            error: (error) {},

            //       Fluttertoast.showToast(
            //       msg: NetworkExceptions.getErrorMessage(error),
            //       toastLength: Toast.LENGTH_SHORT),
          );
        },
        builder: (context, state) {
          return state.when(
            loading: () => const Center(child: CupertinoActivityIndicator()),
            success: (baseMyProductEntity) => ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) =>
                  postItem(baseMyProductEntity, index),
              separatorBuilder: (_, __) => SizedBox(width: 20.w),
              itemCount: baseMyProductEntity.products.length,
            ),
            error: (NetworkExceptions networkExceptions) => const SizedBox(),
          );
        },
      ),
    );
  }
}
