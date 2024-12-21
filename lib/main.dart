import 'package:flutter/material.dart';
import 'agent.dart'; // Import agent page
import 'create.dart'; // Import the CreateNewPage

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Creator Page',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: CreatorPage(),
    );
  }
}

class CreatorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Row(
          children: [
            IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {
                // Add menu functionality
              },
            ),
            SizedBox(width: 10),
            Text('Creator Dashboard'),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              // Add login functionality
            },
            child: Text('Login', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Welcome message with a larger font size
            Text(
              'Welcome to the Creator Page!',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.blue),
            ),
            SizedBox(height: 10),
            // Brief description
            Text(
              'This is the home section for creators. Explore, create, and connect with agents.',
              style: TextStyle(fontSize: 16, color: Colors.grey[700]),
            ),
            SizedBox(height: 30),
            // A banner or card with some relevant info
            Card(
              elevation: 5,
              color: Colors.blue[50],
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Icon(Icons.star, color: Colors.blue, size: 30),
                    SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        'Create amazing content and get discovered by agents. Start now!',
                        style: TextStyle(fontSize: 18, color: Colors.blue[800]),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            // Quick actions section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    // Add action to create new project or content
                  },
                  icon: Icon(Icons.create),
                  label: Text('Create New'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    textStyle: TextStyle(fontSize: 16),
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    // Add action to view created content or projects
                  },
                  icon: Icon(Icons.visibility),
                  label: Text('View My Content'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    textStyle: TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
            SizedBox(height: 30),
            // List of content or categories (e.g., featured projects, trending)
            Text(
              'Featured Categories',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.blue[800]),
            ),
            SizedBox(height: 10),
            // Example list of categories or content
            Container(
              height: 120,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _buildCategoryCard('Photography', Icons.camera),
                  _buildCategoryCard('Music', Icons.music_note),
                  _buildCategoryCard('Design', Icons.brush),
                  _buildCategoryCard('Coding', Icons.code),
                ],
              ),
            ),
            SizedBox(height: 20),
            // Other content or information about the platform
            Text(
              'How it works',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.blue[800]),
            ),
            SizedBox(height: 10),
            Text(
              '1. Create new content.',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              '2. Get discovered by agents.',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              '3. Start your creative journey!',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Agent'),
          BottomNavigationBarItem(icon: Icon(Icons.create), label: 'Create'),
        ],
        onTap: (index) {
          switch (index) {
            case 0:
              // Home tapped
              break;
            case 1:
              // Navigate to Agent Page
              Navigator.push(context, MaterialPageRoute(builder: (context) => AgentPage()));
              break;
            case 2:
              // Navigate to Create Page (CreateNewPage)
              Navigator.push(context, MaterialPageRoute(builder: (context) => CreateNewPage()));
              break;
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add create functionality
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.blue,
      ),
    );
  }

  // Helper function to build category cards
  Widget _buildCategoryCard(String title, IconData icon) {
    return Card(
      elevation: 5,
      margin: EdgeInsets.symmetric(horizontal: 8),
      child: Container(
        width: 120,
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40, color: Colors.blue),
            SizedBox(height: 10),
            Text(title, textAlign: TextAlign.center, style: TextStyle(fontSize: 16, color: Colors.blue)),
          ],
        ),
      ),
    );
  }
}
