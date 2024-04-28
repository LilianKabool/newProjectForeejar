
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/constant/colors.dart';
import '../widgets/divider_item.dart';
import '../widgets/space_item.dart';

class OwnerPostDetailsScreen extends StatefulWidget {
  @override
  State<OwnerPostDetailsScreen> createState() => _OwnerPostDetailsScreenState();
}

class _OwnerPostDetailsScreenState extends State<OwnerPostDetailsScreen> {
  String item_name = 'Acura 2018';
  String feature_name = 'Gasoline';
  String country = 'Syria';
  String city = 'Damascus';
  String region = 'Sahnaya';

  Widget AttributeItem() {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: AppColors.pureBlack,
          ),
          borderRadius: BorderRadius.circular(20.r),
          // color: AppColors.mediumGolden1,
        ),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(20.r),
                topLeft: Radius.circular(20.r),
              ),
              child: Image(
                image: AssetImage('assets/images/girl.png'),
              ),
            ),
            SizedBox(
              height: 5.h,
            ),
            Text(
              '${item_name}',
              style: TextStyle(
                fontFamily: 'bahnschrift',
                color: AppColors.pureBlack,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Post Details',
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
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.edit,
              color: AppColors.semiDarkGolden,
            ),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1.0),
          child: DividerItem(),
        ),
      ),
      body: ListView(
        children: [
          SpaceItem(),
          Image(
            image: AssetImage('assets/images/girl.png'),
            width: double.infinity,
            height: 200.h,
          ),
          SpaceItem(),
          Center(
            child: Text(
              '${item_name}',
              style: TextStyle(
                color: AppColors.mediumGolden1,
                fontFamily: 'bahnschrift',
                fontSize: 17.sp,
              ),
            ),
          ),
          SpaceItem(),
          DividerItem(),
          SpaceItem(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              children: [
                Icon(
                  Icons.location_on_outlined,
                  color: AppColors.mediumGolden1,
                ),
                SizedBox(
                  width: screenWidth / 20,
                ),
                Text(
                  '${country}, ',
                  style: TextStyle(
                    color: AppColors.mediumGray,
                    fontFamily: 'Bahnschrift',
                    fontSize: 16.sp,
                  ),
                ),
                Text(
                  '${city}, ',
                  style: TextStyle(
                    color: AppColors.mediumGray,
                    fontFamily: 'Bahnschrift',
                    fontSize: 16.sp,
                  ),
                ),
                Text(
                  '${region}',
                  style: TextStyle(
                    color: AppColors.mediumGray,
                    fontFamily: 'Bahnschrift',
                    fontSize: 16.sp,
                  ),
                ),
              ],
            ),
          ),
          SpaceItem(),
          DividerItem(),
          SpaceItem(),
          CarBrandModelViewWidget(),
          SpaceItem(),
          DividerItem(),
          SpaceItem(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              children: [
                AttributeItem(),
                SizedBox(
                  width: screenWidth/75,
                ),
                AttributeItem(),
              ],
            ),
          ),
          SpaceItem(),
        ],
      ),
    );
  }
}


class CarBrandModelViewWidget extends StatelessWidget{

  String Brand = 'gffvhn';
  String model = 'gffvhn';
  String year = '12-07-2017';

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                'Brand',
                style: TextStyle(
                  fontFamily: 'bahnschrift',
                  color: AppColors.pureBlack,
                  fontSize: 16.sp,
                ),
              ),
              SizedBox(
                width: screenWidth/8,
              ),
              Expanded(
                child: Container(
                  height: 35.h,
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
                      '${Brand}',
                      style: TextStyle(
                        fontFamily: 'bahnschrift',
                        color: AppColors.pureWhite,
                        fontSize: 16.sp,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SpaceItem(),
          Row(
            children: [
              Text(
                'Model',
                style: TextStyle(
                  fontFamily: 'bahnschrift',
                  color: AppColors.pureBlack,
                  fontSize: 16.sp,
                ),
              ),
              SizedBox(
                width: screenWidth/8,
              ),
              Expanded(
                child: Container(
                  height: 35.h,
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
                      '${model}',
                      style: TextStyle(
                        fontFamily: 'bahnschrift',
                        color: AppColors.pureWhite,
                        fontSize: 16.sp,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SpaceItem(),
          Row(
            children: [
              Text(
                'Year',
                style: TextStyle(
                  fontFamily: 'bahnschrift',
                  color: AppColors.pureBlack,
                  fontSize: 16.sp,
                ),
              ),
              SizedBox(
                width: screenWidth/6.3,
              ),
              Expanded(
                child: Container(
                  height: 35.h,
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
                      '${year}',
                      style: TextStyle(
                        fontFamily: 'bahnschrift',
                        color: AppColors.pureWhite,
                        fontSize: 16.sp,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

}