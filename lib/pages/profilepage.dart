// profilepage.dart
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Simulating user information and transaction history
    String userName = "Anup Tarone";
    int userAge = 21;
    List<TransactionHistory> transactions = [
      TransactionHistory("Watch", 199, DateTime.now(), PaymentMethod.Cash),
      TransactionHistory("Sunglass", 199, DateTime.now(), PaymentMethod.Card),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 5,
                offset: Offset(0, 3),
              ),
            ],
          ),
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Profile Information",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                "Name: $userName",
                style: TextStyle(fontSize: 18),
              ),
              Text(
                "Age: $userAge",
                style: TextStyle(fontSize: 18),
              ),
              SizedBox(height: 20),
              Text(
                "Transaction History",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Expanded(
                child: ListView.builder(
                  itemCount: transactions.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(
                        transactions[index].productName,
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Amount: \$${transactions[index].amount.toStringAsFixed(2)}",
                            style: TextStyle(fontSize: 16),
                          ),
                          Text(
                            "Date: ${transactions[index].date.toLocal().toString()}",
                            style: TextStyle(fontSize: 16),
                          ),
                          Text(
                            "Paid by: ${transactions[index].paymentMethod.toString().split('.').last}",
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Add these classes at the bottom or in separate files
class TransactionHistory {
  final String productName;
  final double amount;
  final DateTime date;
  final PaymentMethod paymentMethod;

  TransactionHistory(this.productName, this.amount, this.date, this.paymentMethod);
}

enum PaymentMethod {
  Cash,
  Card,
}
