import 'package:flutter/material.dart';
import 'agent.dart';

class CreateNewPage extends StatefulWidget {
  @override
  _CreateNewPageState createState() => _CreateNewPageState();
}

class _CreateNewPageState extends State<CreateNewPage> {
  int _selectedIndex = 2; // Set the default to 'Create' page.

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
      case 0:
        Navigator.popUntil(context, (route) => route.isFirst);
        break;
      case 1:
        Navigator.push(context, MaterialPageRoute(builder: (context) => AgentPage()));
        break;
      case 2:
        // Already on Create page, so no action needed
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Row(
          children: [
            Icon(Icons.create, size: 28),
            SizedBox(width: 10),
            Text('Create Page'),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              // Add settings functionality here
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Create Something New!',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.blue),
            ),
            SizedBox(height: 16),
            Text(
              'Start your creative journey by filling in the details below. Your creation will be visible to agents!',
              style: TextStyle(fontSize: 18, color: Colors.grey[700]),
            ),
            SizedBox(height: 24),

            // Banner Card with visual appeal
            Card(
              elevation: 5,
              color: Colors.blue[50],
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Icon(Icons.lightbulb, color: Colors.blue, size: 30),
                    SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        'Your content can be the next big thing! Fill in the form below to get started.',
                        style: TextStyle(fontSize: 18, color: Colors.blue[800]),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),

            // Form Fields (Title and Description)
            TextField(
              decoration: InputDecoration(
                labelText: 'Title',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.title),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                labelText: 'Description',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.description),
              ),
              maxLines: 3,
            ),
            SizedBox(height: 24),

            // Centered Submit Button
            Center(
              child: ElevatedButton.icon(
                onPressed: () {
                  // Add create functionality
                },
                icon: Icon(Icons.check),
                label: Text('Submit'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue, // Corrected property
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  textStyle: TextStyle(fontSize: 18),
                ),
              ),
            ),
            SizedBox(height: 40),

            // Additional Information Section
            Text(
              'Why Create?',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.blue[800]),
            ),
            SizedBox(height: 10),
            Text(
              '1. Reach out to agents who are looking for creators like you.',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              '2. Get discovered and start your creative journey.',
              style: TextStyle(fontSize: 18),
            ),
            Text(
              '3. Showcase your work to a broader audience.',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex, // Set the active tab based on index
        onTap: _onItemTapped,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Agent',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.create),
            label: 'Create',
          ),
        ],
      ),
    );
  }
}
