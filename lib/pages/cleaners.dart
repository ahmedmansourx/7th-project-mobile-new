import 'package:flutter/material.dart';
import 'khaled.dart';
import 'profile.dart';

class CleanerHomePage extends StatelessWidget {
  const CleanerHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Cleaning',
          style: TextStyle(color: Colors.orange, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search, color: Colors.orange),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // "Send Quick SMS Near To You" section
              Text(
                'Quick chat cleaners Near You',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              SizedBox(height: 20),
              SizedBox(
                height: 115,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    final names = ['Eleanor Pena', 'Cody Fisher', 'Albert Flores', 'nadia lotfy'];
                    return UserProfileWidget(name: names[index]);
                  },
                  separatorBuilder: (context, index) => SizedBox(width: 24),
                ),
              ),
              SizedBox(height: 10),

              // "Best Cleaner in This Platform" section
              Text(
                'Best Cleaner in This Platform',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              SizedBox(height: 12),
              GridView.count(
                shrinkWrap: true,
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 0.7,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => khaledpage()),
                      );
                    },
                    child: CleanerCard(name: 'Khaled Aly', price: '\$44/Hr', rating: 4.6, imagePath: khaledImagePath,),
                  ),
                  CleanerCard(name: 'Guy Hawkins', price: '\$47/Hr', rating: 4.6,imagePath: 'assets/images/guy hawkins.jpg',),
                  CleanerCard(name: 'John Doe', price: '\$40/Hr', rating: 4.8),
                  CleanerCard(name: 'Jane Smith', price: '\$42/Hr', rating: 4.5),
                ],
              ),
            ],
          ),
        ),
      ),
      // Bottom navigation bar
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        shape: CircularNotchedRectangle(),
        notchMargin: 8.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: Icon(Icons.home, color: Colors.orange),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.chat_bubble_outline, color: Colors.grey),
              onPressed: () {},
            ),
            SizedBox(width: 48),
            IconButton(
              icon: Icon(Icons.bookmark_border, color: Colors.grey),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.person_outline, color: Colors.grey),
              onPressed: () {
                // Navigate to the ProfilePage
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfilePage()),
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.orange,
        child: Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterDocked,
    );
  }
}

class UserProfileWidget extends StatelessWidget {
  final String name;

  const UserProfileWidget({Key? key, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 40,
          backgroundColor: Colors.grey[300],
          child: Icon(Icons.person, color: Colors.white, size: 40),
        ),
        SizedBox(height: 8),
        Text(name, style: TextStyle(fontSize: 12)),
      ],
    );
  }
}

class CleanerCard extends StatelessWidget {
  final String name;
  final String price;
  final double rating;
  final String? imagePath; // Make imagePath optional to handle cases without an image

  const CleanerCard({
    Key? key,
    required this.name,
    required this.price,
    required this.rating,
    this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.orangeAccent.withOpacity(0.15),
            spreadRadius: 2,
            blurRadius: 8,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Cleaner image with optional imagePath
          Container(
            height: 145,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(12),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: imagePath != null
                  ? Image.asset(
                imagePath!,
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
              )
                  : Center(
                child: Icon(Icons.person, size: 40, color: Colors.white),
              ),
            ),
          ),
          SizedBox(height: 6),
          Text(name, style: TextStyle(fontWeight: FontWeight.bold)),
          SizedBox(height: 3),
          Text('Cleaner', style: TextStyle(color: Colors.grey, fontSize: 12)),
          SizedBox(height: 4),
          Row(
            children: [
              Icon(Icons.star, color: Colors.amber, size: 16),
              SizedBox(width: 4),
              Text('$rating', style: TextStyle(color: Colors.grey)),
            ],
          ),
          SizedBox(height: 4),
          Text(price, style: TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
