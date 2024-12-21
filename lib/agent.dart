import 'package:flutter/material.dart';
import 'create.dart'; // Import the Create page
import 'main.dart';

class AgentPage extends StatefulWidget {
  @override
  _AgentPageState createState() => _AgentPageState();
}

class _AgentPageState extends State<AgentPage> {
  int _selectedIndex = 1; // Default to Agent tab

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
        // Navigate to Create Page (CreateNewPage)
        Navigator.push(context, MaterialPageRoute(builder: (context) => CreateNewPage())); // Corrected reference
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Icon(Icons.person, size: 28),
            SizedBox(width: 10),
            Text('Agent Dashboard'),
          ],
        ),
        backgroundColor: Colors.blue,
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {
              // Handle notifications
            },
          ),
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {
              // Handle settings
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Welcome message with larger text and bold font
            Text(
              'Welcome, Agent!',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            SizedBox(height: 16),
            // Description of the agent's tasks
            Text(
              'Here’s an overview of your tasks and activities:',
              style: TextStyle(fontSize: 16, color: Colors.grey[600]),
            ),
            SizedBox(height: 24),
            // Banner card
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
                        'Stay updated and manage your tasks efficiently to provide the best service.',
                        style: TextStyle(fontSize: 18, color: Colors.blue[800]),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),

            // Task Cards Section
            Expanded(
              child: ListView(
                children: [
                  TaskCard(
                    title: 'New Assignments',
                    description: 'You have 3 new assignments pending.',
                    icon: Icons.assignment,
                    color: Colors.orange,
                  ),
                  TaskCard(
                    title: 'Messages',
                    description: 'Check messages from clients.',
                    icon: Icons.message,
                    color: Colors.green,
                  ),
                  TaskCard(
                    title: 'Performance',
                    description: 'Your performance score is 85%.',
                    icon: Icons.bar_chart,
                    color: Colors.blue,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
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

class TaskCard extends StatelessWidget {
  final String title;
  final String description;
  final IconData icon;
  final Color color;

  TaskCard({
    required this.title,
    required this.description,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 4,
      margin: EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: color,
          child: Icon(icon, color: Colors.white),
        ),
        title: Text(
          title,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(description),
        trailing: Icon(Icons.arrow_forward_ios, size: 16),
        onTap: () {
          // Handle task tap
        },
      ),
    );
  }
}
