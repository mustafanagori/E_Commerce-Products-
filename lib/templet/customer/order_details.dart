import 'package:flutter/material.dart';

import 'order.dart';
import 'order_schedule.dart';

class OrderDetails extends StatelessWidget {
  const OrderDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const TabBar(
            dividerColor: Colors.black,
            labelColor: Colors.white,
            indicatorColor: Colors.grey,
            tabs: [
              Tab(
                child: Text(
                  "Order",
                  style: TextStyle(fontSize: 16),
                ),
              ),
              Tab(
                child: Text("Schedule", style: TextStyle(fontSize: 16)),
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            Order(),
            OrderSchedule(),
          ],
        ),
      ),
    );
  }
}
