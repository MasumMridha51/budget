import 'package:flutter/material.dart';

class BudgetItem extends StatelessWidget {
  final String name;
  final double amount;
  const BudgetItem({super.key, required this.name, required this.amount});

  double calculateTotalAmount(List<BudgetItem> budgetItems) {
    double totalAmount = 0.0;
    for (var item in budgetItems) {
      totalAmount += item.amount;
    }
    return totalAmount;
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
