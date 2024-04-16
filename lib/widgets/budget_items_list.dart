import 'package:flutter/material.dart';

import '../models/BudgetItem.dart';
import 'BudgetListItem.dart';

class BudgetItemsList extends StatelessWidget {
  final List<BudgetItem> budgetitems;
  BudgetItemsList({super.key, required this.budgetitems});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: budgetitems.length,
        itemBuilder: (context, index) => BudgetListItem(
          budgetItem: budgetitems[index],
        ),
      ),
    );
  }
}
