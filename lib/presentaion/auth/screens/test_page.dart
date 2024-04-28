
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../owner/manager/processing_orders_cubit.dart';

class TestPage extends StatefulWidget {
  const TestPage({super.key});

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              // context.read<SubscriptionCubit>().emitGetSubscription(getSubscriptionParams: GetSubscriptionParams(categoryId: 1));
                            context.read<ProcessingOrdersCubit>().emitGetProcessingOrders();

            },
            child: Text("test")),
      ),
    );
  }
}
