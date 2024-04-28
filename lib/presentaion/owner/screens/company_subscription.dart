
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/constant/colors.dart';
import '../widgets/divider_item.dart';
import '../widgets/space_item.dart';


class CompanySubscription extends StatefulWidget{
  @override
  State<CompanySubscription> createState() => _CompanySubscriptionState();
}

class _CompanySubscriptionState extends State<CompanySubscription> {

  bool _isChecked = false;
  String month_subscrip = '1 Month';
  String subscrip_cost = '300\$';

  Widget SubScripChoiceItem(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(
          '${month_subscrip}',
          style: TextStyle(
            color: AppColors.semiBlack,
            fontFamily: 'bahnschrift',
            fontSize: 16.sp,
          ),
        ),
        Container(
          height: 30.h,
          width: 100.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.r),
            border: Border.all(
              color: AppColors.mediumGolden1,
            ),
          ),
          child: Center(
            child: Text(
              '${subscrip_cost}',
              style: TextStyle(
                color: AppColors.semiBlack,
                fontFamily: 'bahnschrift',
                //fontSize: 16.sp,
              ),
            ),
          ),
        ),
        Checkbox(
            activeColor: AppColors.mediumGolden1,
            value: _isChecked,
            onChanged: (bool? value) {
              setState(() {
                _isChecked = value!;
              });
            }),
      ],
    );
  }

  Widget buildSubscriptionList(){
    return ListView.separated(
      itemBuilder: (context, index) {
        return SubScripChoiceItem();
      },
      separatorBuilder: (context, index) => SpaceItem(),
      itemCount: 5,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Company Subscription',
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
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1.0),
          child: DividerItem(),
        ),
      ),
      body: Column(
        children: [
          SpaceItem(),
          Text(
            'Please Select One',
            style: TextStyle(
              color: AppColors.pureBlack,
              fontFamily: 'bahnschrift',
              fontSize: 17.sp,
            ),
          ),
          SpaceItem(),
          Expanded(
            child: buildSubscriptionList(),
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
              height: 40.h,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    AppColors.mediumGolden1,
                    AppColors.mediumGolden2,
                    AppColors.mediumGolden1,
                  ],
                ),
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(37.r),
                  topLeft: Radius.circular(37.r),
                ),
              ),
              child: Center(
                child: Text(
                  'Done',
                  style: TextStyle(
                    fontSize: 17.sp,
                    color: AppColors.pureWhite,
                    fontFamily: 'Bahnschrift',
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}