import 'package:flutter/material.dart';
import 'location.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Profile', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage('assets/profile_picture.png'),
                  ),
                  SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Ahmed Mansour',
                        style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 4),

                      // Make Location Row Clickable
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => MapPage()),
                          );
                        },
                        child: Row(
                          children: [
                            Icon(Icons.location_on, color: Colors.orange, size: 18),
                            SizedBox(width: 4),
                            Text(
                              'New York, USA',
                              style: TextStyle(color: Colors.grey[600]),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 24),

              // Account Info Section
              Text(
                'Account Info',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 12),
              Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AccountInfoRow(icon: Icons.email, label: 'Email', value: 'john.doe@example.com'),
                    SizedBox(height: 10),
                    AccountInfoRow(icon: Icons.lock, label: 'Password', value: '********'),
                    SizedBox(height: 10),
                    AccountInfoRow(icon: Icons.cake, label: 'Age', value: '28'),
                  ],
                ),
              ),
              SizedBox(height: 24),

              // Past Orders Section
              Text(
                'Past Orders',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 12),
              ListView.separated(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: 3,
                separatorBuilder: (context, index) => Divider(color: Colors.grey),
                itemBuilder: (context, index) {
                  return OrderCard(
                    orderId: '12345${index + 1}',
                    date: '2023-10-1${index + 1}',
                    status: index == 0 ? 'Completed' : 'Pending',
                    amount: '\$50.${index + 99}',
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Define the LocationPage widget
class LocationPage extends StatelessWidget {
  const LocationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Location'),
      ),
      body: Center(
        child: Text(
          'Location details or map will go here.',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}

// Widget to display account info rows
class AccountInfoRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const AccountInfoRow({
    Key? key,
    required this.icon,
    required this.label,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: Colors.orange, size: 20),
        SizedBox(width: 8),
        Text(
          '$label:',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        SizedBox(width: 8),
        Text(value, style: TextStyle(color: Colors.grey[700])),
      ],
    );
  }
}

// Widget to display each past order card
class OrderCard extends StatelessWidget {
  final String orderId;
  final String date;
  final String status;
  final String amount;

  const OrderCard({
    Key? key,
    required this.orderId,
    required this.date,
    required this.status,
    required this.amount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Order ID: $orderId', style: TextStyle(fontWeight: FontWeight.bold)),
              Text(status, style: TextStyle(color: status == 'Completed' ? Colors.green : Colors.orange)),
            ],
          ),
          SizedBox(height: 6),
          Text('Date: $date', style: TextStyle(color: Colors.grey[700])),
          SizedBox(height: 6),
          Text('Amount: $amount', style: TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
