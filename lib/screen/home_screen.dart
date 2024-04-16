import 'package:flutter/material.dart';
import 'package:my_budget_chart/screen/add_item_screen.dart';

import '../models/BudgetItem.dart';
import '../widgets/budget_items_list.dart';
import '../widgets/pie_chart.dart';

class HomeScreen extends StatefulWidget {
  void calculateTotalAmount;
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Dam Data
  final List<BudgetItem> _registereditems = [
    BudgetItem(name: 'Food', amount: 50),
    BudgetItem(name: 'Dress', amount: 20),
    BudgetItem(name: 'Education', amount: 30),
  ];

  // Get List <BudgetItem> Function.
  List<BudgetItem> getBudgetItemList() {
    return _registereditems;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.end,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          MyPieChart(myBudgetItems: _registereditems),
          BudgetItemsList(
            budgetitems: _registereditems,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FloatingActionButton(
                onPressed: () {
                  const AddItem();
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.0),
                ),
                splashColor: Colors.white,
                autofocus: true,
                child: const Icon(Icons.add),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
