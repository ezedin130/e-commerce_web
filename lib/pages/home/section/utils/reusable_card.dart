import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  final String title;
  final VoidCallback onViewAll;
  final double columnSpacing;
  final List<DataColumn> columns;
  final List<DataRow> rows;

  const ReusableCard({
    super.key,
    required this.title,
    required this.onViewAll,
    required this.columnSpacing,
    required this.columns,
    required this.rows,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextButton(
                  onPressed: onViewAll,
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.blue,
                  ),
                  child: const Row(
                    children: [
                      Text("View All"),
                      Icon(Icons.chevron_right),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            DataTable(
              horizontalMargin: 0,
              columnSpacing: columnSpacing,
              columns: columns,
              rows: rows,
            ),
          ],
        ),
      ),
    );
  }
}