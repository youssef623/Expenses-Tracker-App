import 'package:expenses_tracker/models/expense.dart';
import 'package:expenses_tracker/widgets/expenses_list/expense_item.dart';
import 'package:flutter/material.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({
    super.key,
    required this.expensesList,
    required this.deleteExpense,
  });
  final List<Expense> expensesList;
  final void Function(Expense expense) deleteExpense;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expensesList.length,
      itemBuilder: (ctx, index) => Dismissible(
        background: Container(
          color: Theme.of(context).colorScheme.error.withOpacity(0.8),
          margin: const EdgeInsets.symmetric(horizontal: 16),
        ),
        key: ValueKey(expensesList[index]),
        onDismissed: (direction){
          deleteExpense(expensesList[index]);
        },
        child: ExpenseItem(
          item: expensesList[index],
        ),
      ),
    );
  }
}
