import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:stratagile_todo_test/core/extensions/theme_extension.dart';

class TodoOverviewCard extends StatelessWidget {
  const TodoOverviewCard({
    super.key,
    required this.pendingCount,
    required this.completedCount,
  });

  final int pendingCount, completedCount;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: context.colorScheme.surfaceContainer,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Todo Overview", style: context.typography.title),
              Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: context.colorScheme.primaryContainer,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  DateFormat("dd-MM-yyyy").format(DateTime.now()),
                  style: context.typography.body.copyWith(
                    color: context.colorScheme.onPrimaryContainer,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: context.colorScheme.primaryContainer,
                  ),
                  child: Column(
                    children: [
                      Text("$pendingCount", style: context.typography.headline),
                      Text("Pending", style: context.typography.body),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: context.colorScheme.primaryContainer,
                  ),
                  child: Column(
                    children: [
                      Text(
                        "$completedCount",
                        style: context.typography.headline,
                      ),
                      Text("Completed", style: context.typography.body),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
