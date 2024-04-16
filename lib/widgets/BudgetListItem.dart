import 'package:flutter/material.dart';
import 'package:my_budget_chart/models/BudgetItem.dart';

class BudgetListItem extends StatelessWidget {
  final BudgetItem budgetItem;
  const BudgetListItem({super.key, required this.budgetItem});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 16,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              budgetItem.name,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            Spacer(),
            Text(
              budgetItem.amount.toString(),
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ],
        ),
      ),
    );
  }
}
