import 'package:flutter/material.dart';
import 'chat.dart';

const String khaledImagePath = 'assets/images/20191101_224125.jpg';

class khaledpage extends StatelessWidget {
  const khaledpage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            width: 350,
            height: 900,
            padding: EdgeInsets.all(1.0),
            child: Column(
              children: [

                // Profile image
                CircleAvatar(
                  radius: 65,
                  backgroundImage: AssetImage(khaledImagePath), // Replace with actual image
                ),

                // Job Success Badge
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.blue[50],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      '90% Job Success',
                      style: TextStyle(color: Colors.blue, fontSize: 12),
                    ),
                  ),
                ),

                // Name and Rating
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Column(
                    children: [
                      Text(
                        'khaled aly',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text('Professional Cleaner', style: TextStyle(color: Colors.grey, fontSize: 14)),
                      SizedBox(height: 4),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.star, color: Colors.amber, size: 16),
                          SizedBox(width: 4),
                          Text('4.6 (2345 Reviews)', style: TextStyle(color: Colors.grey, fontSize: 14)),
                        ],
                      ),
                    ],
                  ),
                ),

                // Pricing
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          Text('Hourly', style: TextStyle(color: Colors.grey, fontSize: 14)),
                          Text('\$43.0', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                        ],
                      ),
                      Column(
                        children: [
                          Text('Monthly', style: TextStyle(color: Colors.grey, fontSize: 14)),
                          Text('\$430.0', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                        ],
                      ),
                    ],
                  ),
                ),

                // Service List
                Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('My Service List', style: TextStyle(fontWeight: FontWeight.bold)),
                      SizedBox(height: 8),
                      Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: [
                          ServiceCard(serviceName: 'Bedroom Cleaning'),
                          ServiceCard(serviceName: 'Bathroom Cleaning'),
                          ServiceCard(serviceName: 'Coffee, Tea Renewal'),
                          ServiceCard(serviceName: 'Trash Cleaning'),
                        ],
                      ),
                    ],
                  ),
                ),

                // Bio
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Bio', style: TextStyle(fontWeight: FontWeight.bold)),
                      SizedBox(height: 8),
                      Text(
                        'Hey! I’m Guy, a professional cleaner with 5+ years of experience. I am passionate about providing top-quality cleaning services to keep your space clean and fresh.',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ),

                // Message button
                SizedBox(height: 120),
                FloatingActionButton(
                  onPressed: () {Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ChatScreen()),
                  );},
                  backgroundColor: Colors.orange,
                  child: Icon(Icons.chat_bubble_outline, color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  AppBar appBar() {
    return AppBar(
      title: Text(
          'Crafty',
          style: TextStyle(color: Colors.orange,
          fontSize:30,
          fontWeight: FontWeight.bold),
    )
      ,backgroundColor: Colors.white,
      centerTitle: true,
    );
  }
}

class ServiceCard extends StatelessWidget {
  final String serviceName;

  const ServiceCard({Key? key, required this.serviceName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        serviceName,
        style: TextStyle(color: Colors.black87),
      ),
    );
  }
}
