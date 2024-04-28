
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../feature/owner/entity/my_subscription_entity.dart';
import '../manager/my_subscription_cubit.dart';

class MySubscriptionScreen extends StatefulWidget {
  @override
  State<MySubscriptionScreen> createState() => _MySubscriptionScreenState();
}

class _MySubscriptionScreenState extends State<MySubscriptionScreen> {
  @override
  void initState() {
    context.read<MySubscriptionCubit>().emitPostMySubscription();
    // TODO: implement initState
    super.initState();
  } @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Subscription',
          style: TextStyle(
            color: Colors.amberAccent[700],
            fontFamily: 'Bahnschrift',
            fontSize: 20.0,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {Navigator.pop(context);},
          icon: Icon(
            Icons.chevron_left,
            color: Colors.amberAccent[700],
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      infoCard('Start Date', Colors.greenAccent),
                      infoCard('End Date', Colors.redAccent),
                      infoCard('Value', Colors.blueAccent),
                    ],
                  ),
                ),
                Expanded(
                  child: buildSubscriptionTable(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget infoCard(String title, Color color) {
    return Container(
      height: 60.0,
      width: 120.0,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Center(
        child: Text(
          title,
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Bahnschrift',
            fontSize: 16.0,
          ),
        ),
      ),
    );
  }

  Widget buildSubscriptionTable() {
    return BlocConsumer<MySubscriptionCubit, MySubscriptionState>(
      listener: (context, state) => state.whenOrNull(
        error: (exception) {},
        // Fluttertoast.showToast(
        //   msg: NetworkExceptions.getErrorMessage(exception),
        //   toastLength: Toast.LENGTH_SHORT,
       // ),
      ),
      builder: (context, state) {
        return state.when(
          loading: () => const CupertinoActivityIndicator(),
          success: (mySubscriptionsEntity) {
            return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return ColumnTableItem(index: index, mysubscriptionEntity: mySubscriptionsEntity);
              },
              itemCount: mySubscriptionsEntity.subscriptions.length,
            );
          },
          error: (networkExceptions) => const SizedBox.shrink(),
        );
      },
    );
  }

  Widget ColumnTableItem({required int index, required MySubscriptionEntity mysubscriptionEntity}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Card(
        elevation: 4.0,
        color: Colors.grey[100],
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              subscriptionText(mysubscriptionEntity.subscriptions[index].startDate),
              subscriptionText(mysubscriptionEntity.subscriptions[index].endDate),
              subscriptionText(mysubscriptionEntity.subscriptions[index].value.toString()),
            ],
          ),
        ),
      ),
    );
  }

  Widget subscriptionText(String data) {
    return Text(
      data,
      style: TextStyle(
        color: Colors.deepPurple,
        fontFamily: 'Bahnschrift',
        fontSize: 16.0,
      ),
    );
  }
}