
import '../../../core/constant/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/params/get_subscription_params.dart';
import '../../../core/params/subscripe_params.dart';
import '../../../feature/owner/entity/subscriptions_entity.dart';
import '../manager/subscripe_cubit.dart';
import '../manager/subscription_cubit.dart';

class CompanySubscription extends StatefulWidget {
  final int categoryId;

  const CompanySubscription({super.key, required this.categoryId});

  @override
  State<CompanySubscription> createState() => _CompanySubscriptionState();
}

class _CompanySubscriptionState extends State<CompanySubscription> {
  @override
  void initState() {
    super.initState();
    context.read<SubscriptionCubit>().emitGetSubscription(
        getSubscriptionParams:
            GetSubscriptionParams(categoryId: widget.categoryId));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Company Subscription',
            style: TextStyle(
                color: AppColors.semiDarkGolden,
                fontFamily: 'Bahnschrift',
                fontSize: 20.sp)),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.chevron_left, color: AppColors.semiDarkGolden),
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
            child: BlocConsumer<SubscriptionCubit, SubscriptionState>(
              listener: (context, state) => state.whenOrNull(
                success: (subscriptions, selected) {
                  print("Successfully loaded with selections: $selected");
                },
              ),
              builder: (context, state) {
                return state.maybeWhen(
                  success: (subscriptions, selected) =>
                      buildSubscriptionList(subscriptions, selected),
                  loading: () => Center(child: CircularProgressIndicator()),
                  orElse: () => Center(child: Text("No data available")),
                );
              },
            ),
          ),
          BlocBuilder<SubscripeCubit, SubscripeState>(
            builder: (context, state) {
              return state.maybeWhen(
                initial: () {
                  return GestureDetector(
                    onTap: () {
                      final subscriptionCubit =
                          context.read<SubscriptionCubit>();
                      final currentState = subscriptionCubit.state;
                      if (currentState is SuccessSubscription) {
                        final selectedEntries = currentState
                            .selectedSubscriptions.entries
                            .where((entry) => entry.value);
                        if (selectedEntries.isNotEmpty) {
                          final subscriptionId = selectedEntries.first.key;
                          print(subscriptionId);
                          context.read<SubscripeCubit>().emitSubscripe(
                              subscripeParams: SubscripeParams(
                                  subscriptionId: subscriptionId));
                          // Fluttertoast.showToast(
                          //   msg: "Subscription processing",
                          //   toastLength: Toast.LENGTH_SHORT,
                          //   gravity: ToastGravity.BOTTOM,
                          //   timeInSecForIosWeb: 1,
                          //   backgroundColor: Colors.green,
                          //   textColor: Colors.white,
                          //   fontSize: 16.0.sp,
                          // );
                        } else {
                          // Fluttertoast.showToast(
                          //   msg: "You should select at least one subscription.",
                          //   toastLength: Toast.LENGTH_SHORT,
                          //   gravity: ToastGravity.BOTTOM,
                          //   timeInSecForIosWeb: 1,
                          //   backgroundColor: Colors.red,
                          //   textColor: Colors.white,
                          //   fontSize: 16.0.sp,
                          // );
                        }
                      }
                    },
                    child: Container(
                      height: 40.h,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            AppColors.mediumGolden1,
                            AppColors.mediumGolden2,
                            AppColors.mediumGolden1
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
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
                  );
                },
                orElse: () {
                  return GestureDetector(
                    onTap: () {
                      final subscriptionCubit =
                          context.read<SubscriptionCubit>();
                      final currentState = subscriptionCubit.state;
                      if (currentState is SuccessSubscription) {
                        final selectedEntries = currentState
                            .selectedSubscriptions.entries
                            .where((entry) => entry.value);
                        if (selectedEntries.isNotEmpty) {
                          final subscriptionId = selectedEntries.first
                              .key; // Get the first selected subscription's ID
                          context.read<SubscripeCubit>().emitSubscripe(
                              subscripeParams: SubscripeParams(
                                  subscriptionId: subscriptionId));
                          // Fluttertoast.showToast(
                          //   msg: "Subscription processing for ID: $subscriptionId",
                          //   toastLength: Toast.LENGTH_SHORT,
                          //   gravity: ToastGravity.BOTTOM,
                          //   timeInSecForIosWeb: 1,
                          //   backgroundColor: Colors.green,
                          //   textColor: Colors.white,
                          //   fontSize: 16.0.sp,
                          // );
                        } else {
                          // Fluttertoast.showToast(
                          //   msg: "You should select at least one subscription.",
                          //   toastLength: Toast.LENGTH_SHORT,
                          //   gravity: ToastGravity.BOTTOM,
                          //   timeInSecForIosWeb: 1,
                          //   backgroundColor: Colors.red,
                          //   textColor: Colors.white,
                          //   fontSize: 16.0.sp,
                          // );
                        }
                      }
                    },
                    child: Container(
                      height: 40.h,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            AppColors.mediumGolden1,
                            AppColors.mediumGolden2,
                            AppColors.mediumGolden1
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
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
                  );
                },
                loading: () => const CupertinoActivityIndicator(),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget buildSubscriptionList(
      BaseSubscriptionsEntity subscriptions, Map<int, bool> selected) {
    return ListView.separated(
      itemBuilder: (context, index) => SubScripChoiceItem(
          context, subscriptions.subscriptions[index], selected),
      separatorBuilder: (context, index) => SpaceItem(),
      itemCount: subscriptions.subscriptions.length,
    );
  }

  Widget SubScripChoiceItem(BuildContext context,
      SubscriptionEntity subscription, Map<int, bool> selected) {
    bool isChecked = selected[subscription.id] ?? false;

    return Row(
      key: ValueKey(isChecked), // Forces rebuild when isChecked changes
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(subscription.title,
            style: TextStyle(fontFamily: 'bahnschrift', fontSize: 16.sp)),
        Container(
          height: 30.h,
          width: 100.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.r),
            border: Border.all(color: AppColors.mediumGolden1),
          ),
          child: Center(
            child: Text(
              "${subscription.price} \$",
              style: TextStyle(
                color: AppColors.semiBlack,
                fontFamily: 'bahnschrift',
              ),
            ),
          ),
        ),
        Checkbox(
          activeColor: AppColors.mediumGolden1,
          value: isChecked,
          onChanged: (bool? value) {
            context
                .read<SubscriptionCubit>()
                .toggleSubscription(subscription.id);
          },
        ),
      ],
    );
  }
}

class SpaceItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return SizedBox(
      height: screenHeight / 50,
    );
  }
}

class DividerItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1.h,
      color: AppColors.gray,
    );
  }
}
