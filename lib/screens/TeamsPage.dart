import 'package:flutter/material.dart';

class TeamPage extends StatefulWidget {
  @override
  _TeamPageState createState() => _TeamPageState();
}

class _TeamPageState extends State<TeamPage> {
  final List<String> teamRoles = [
    'Events & Competitions',
    'Marketing',
    'Media & Publicity',
    'Show Management',
    'Finance',
    'Public Relations',
    'Security',
    'Design',
    'Web & App',
    'Festival Coordinator',
  ];

  void _showTeamDetails(String role) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.blueGrey[900],
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0),
            ),
          ),
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                role,
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16.0),
              _buildTeamMember(
                name: 'Yash Chauhan',
                role: 'Head, Web & App',
              ),
              _buildTeamMember(
                name: 'Satyam Kumar',
                role: 'Head, Web & App',
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildTeamMember({required String name, required String role}) {
    return Card(
      color: Colors.blueGrey[800],
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: Padding(
        padding: EdgeInsets.all(12.0),
        child: Row(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://tse3.mm.bing.net/th?id=OIP.y5eaUQRP8dcHIIJlwI9D9gAAAA&pid=Api&P=0&h=180'),
              radius: 25.0,
            ),
            SizedBox(width: 12.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  role,
                  style: TextStyle(
                    color: Colors.grey[300],
                    fontSize: 14.0,
                  ),
                ),
              ],
            ),
            Spacer(),
            Row(
              children: [
                IconButton(
                  icon: Icon(Icons.call, color: Colors.white),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(Icons.linked_camera, color: Colors.white),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(Icons.email, color: Colors.white),
                  onPressed: () {},
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Core Team' , style: TextStyle(color: Colors.white70),),
      ),
      body: ListView.builder(
        itemCount: teamRoles.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 20 , vertical: 10),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.white70, // Border color
                width: 2.0, // Border width
              ),
              borderRadius: BorderRadius.circular(15.0), // Optional: adds rounded corners
            ),
            child: ListTile(
              title: Text(
                teamRoles[index],
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white70,
                ),
              ),
              onTap: () => _showTeamDetails(teamRoles[index]),
            ),
          );
        },
      ),
    );
  }
}
