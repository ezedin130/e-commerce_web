import 'package:e_commerce_mobile/pages/home/section/utils/reusable_card.dart';
import 'package:flutter/material.dart';

class DashboardSection extends StatelessWidget {
  const DashboardSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: DashboardCard(
                title: 'Total Orders',
                value: '13,647',
                percentage: 2.3,
                isIncrease: true,
                icon: Icons.lock,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: DashboardCard(
                title: 'Total Revenue made',
                value: '9,526',
                percentage: 8.1,
                isIncrease: true,
                icon: Icons.person_add,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: DashboardCard(
                title: 'Total Products',
                value: '13,647',
                percentage: 2.3,
                isIncrease: false,
                icon: Icons.local_offer,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: DashboardCard(
                title: 'Stock Alert',
                value: '13,647',
                percentage: 2.3,
                isIncrease: false,
                icon: Icons.lock,
              ),
            ),
          ],
        ),
        const SizedBox(height: 10.0,),
        ReusableCard(
          title: "Recent Orders",
          onViewAll: () {
          },
          columnSpacing: 180,
          columns: const [
            DataColumn(label: Text("Order ID")),
            DataColumn(label: Text("Customer")),
            DataColumn(label: Text("Status")),
            DataColumn(label: Text("Amount")),
            DataColumn(label: Text("Time")),
          ],
          rows: [
            buildOrderRow(
              "ORD-1247",
              "Sarah Johnson",
              "Completed",
              Colors.green,
              "\$124.50",
              "2 hours ago",
            ),
            buildOrderRow(
              "ORD-1246",
              "Michael Chen",
              "Pending",
              Colors.orange,
              "\$89.99",
              "4 hours ago",
            ),
            buildOrderRow(
              "ORD-1245",
              "Emily Rodriguez",
              "Completed",
              Colors.green,
              "\$215.00",
              "5 hours ago",
            ),
            buildOrderRow(
              "ORD-1244",
              "James Wilson",
              "Pending",
              Colors.orange,
              "\$67.25",
              "6 hours ago",
            ),
            buildOrderRow(
              "ORD-1243",
              "Lisa Anderson",
              "Canceled",
              Colors.red,
              "\$156.80",
              "8 hours ago",
            ),
            buildOrderRow(
              "ORD-1242",
              "David Martinez",
              "Completed",
              Colors.green,
              "\$342.00",
              "1 day ago",
            ),
          ],
        ),
        const SizedBox(height: 20),
        ReusableCard(
          title: "Products Overview",
          onViewAll: () {

          },
          columnSpacing: 250,
          columns: const [
            DataColumn(label: Text("Product Name")),
            DataColumn(label: Text("Sales")),
            DataColumn(label: Text("Revenue")),
          ],
          rows: [
            buildGenericRow(
              ["Wireless Headphones", "145", "\$4,350"],
            ),
            buildGenericRow(
              ["Smart Watch", "98", "\$3,920"],
            ),
            buildGenericRow(
              ["Laptop Stand", "87", "\$2,610"],
            ),
            buildGenericRow(
              ["Bluetooth Speaker", "76", "\$2,280"],
            ),
            buildGenericRow(
              ["Webcam HD", "64", "\$1,920"],
            ),

          ],
        ),
      ],
    );
  }

  DataRow buildRow(
    String orderId,
    String customer,
    String status,
    Color statusColor,
    String amount,
    String time,
  ) {
    return DataRow(
      cells: [
        DataCell(Text(orderId)),
        DataCell(Text(customer)),
        DataCell(
          Chip(
            labelPadding: const EdgeInsets.symmetric(horizontal: 8),
            backgroundColor: statusColor.withOpacity(0.15),
            side: BorderSide.none,
            label: Text(
              status,
              style: TextStyle(color: statusColor, fontWeight: FontWeight.w600),
            ),
          ),
        ),
        DataCell(Text(amount)),
        DataCell(Text(time)),
      ],
    );
  }
}

class DashboardCard extends StatelessWidget {
  final String title;
  final String value;
  final double percentage;
  final bool isIncrease;
  final IconData icon;

  const DashboardCard({
    Key? key,
    required this.title,
    required this.value,
    required this.percentage,
    required this.isIncrease,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 10,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(icon, size: 24, color: Colors.blue),
              Text(
                value,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(height: 8),
          Text(title, style: TextStyle(color: Colors.grey[600])),
          SizedBox(height: 8),
          Row(
            children: [
              Icon(
                isIncrease ? Icons.arrow_upward : Icons.arrow_downward,
                size: 16,
                color: isIncrease ? Colors.green : Colors.red,
              ),
              SizedBox(width: 4),
              Text(
                '${percentage.toStringAsFixed(1)}% Last Week',
                style: TextStyle(
                  color: isIncrease ? Colors.green : Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
DataRow buildOrderRow(
    String orderId,
    String customer,
    String status,
    Color statusColor,
    String amount,
    String time,
    ) {
  return DataRow(
    cells: [
      DataCell(Text(orderId)),
      DataCell(Text(customer)),
      DataCell(
        Chip(
          labelPadding: const EdgeInsets.symmetric(horizontal: 8),
          backgroundColor: statusColor.withOpacity(0.15),
          side: BorderSide.none,
          label: Text(
            status,
            style: TextStyle(color: statusColor, fontWeight: FontWeight.w600),
          ),
        ),
      ),
      DataCell(Text(amount)),
      DataCell(Text(time)),
    ],
  );
}

DataRow buildGenericRow(List<String> cellData) {
  return DataRow(
    cells: cellData
        .map(
          (data) => DataCell(Text(data)),
    )
        .toList(),
  );
}
