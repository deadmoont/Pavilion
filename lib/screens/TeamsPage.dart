import 'package:flutter/material.dart';

class TeamPage extends StatefulWidget {
  @override
  _TeamPageState createState() => _TeamPageState();
}

class _TeamPageState extends State<TeamPage> {
  final List<String> teamRoles = [
    'App Development',
    'Board of Festival Organizers',
    'Branding and Logistics',
    'Creatives',
    'Events and Managements',
    'Media & Publicity',
    'Finance',
    'Public Relations',
    'Filming',
    'Hospitality And Travels',
    'Operations head',
    'Overall coordinators',
    'SPONSORSHIP & MARKETING',
    'Social Media',
    'Technical',
    'Web Development',
  ];

  // Hardcoded JSON-like structure for department heads
  final Map<String, List<Map<String, String>>> teamHeads = {
    'App Development': [
      {'name': 'Gaurav Chhetri', 'role': 'Head, App Development', 'imageUrl': 'https://firebasestorage.googleapis.com/v0/b/first-e6681.appspot.com/o/team%2FAppDev%2FHeads%2FGaurav%20Chhetri%2FWhatsApp%20Image%202024-08-30%20at%208.56.33%20PM%20-%20GAURAV%20CHHETRI.jpeg?alt=media&token=6382555b-2620-484a-9dfc-1066baa076de'},
      {'name': 'Ishant Kumawat', 'role': 'Head, App Development', 'imageUrl': 'https://firebasestorage.googleapis.com/v0/b/first-e6681.appspot.com/o/team%2FAppDev%2FHeads%2FIshant%20kumawat%2FWhatsApp%20Image%202023-09-21%20at%2014.47.04%20-%20Ishant%20kumawat.jpg?alt=media&token=f3fd883e-242e-43f9-8482-e3bec2d666df'},
      {'name': 'Lavish Meena', 'role': 'Head, App Development', 'imageUrl': 'https://firebasestorage.googleapis.com/v0/b/first-e6681.appspot.com/o/team%2FAppDev%2FHeads%2FLavish%20Meena%2Flavishmeena%20-%20Lavish%20Meena.jpg?alt=media&token=a5d92422-737c-405c-9aba-d9b173b5d964'},
    ],
    'Board of Festival Organizers': [
      {'name': 'Aditya Arya', 'role': 'Head, Organizers', 'imageUrl': 'https://firebasestorage.googleapis.com/v0/b/first-e6681.appspot.com/o/team%2FBoard%20of%20Festival%20Organizers%2FAditya%20Arya%2FAdityaArya%20-%20ADITYA%20KUMAR%20ARYA.png?alt=media&token=9bca7006-b184-49d6-aa49-be0fea3c4057'},
      {'name': 'Manoj Pallaki', 'role': 'Head, Organizers', 'imageUrl': ''}, // Add image URL if available
      {'name': 'Om Khangat', 'role': 'Head, Organizers', 'imageUrl': ''}, // Add image URL if available
      {'name': 'Ansh Gadwal', 'role': 'Head, Organizers', 'imageUrl': ''}, // Add image URL if available
    ],
    'Branding and Logistics': [
      {'name': 'Abhishek Kumar', 'role': 'Head, Branding', 'imageUrl': 'https://firebasestorage.googleapis.com/v0/b/first-e6681.appspot.com/o/Effervescence%20clubs%2FBranding%20and%20Logistics%2FAbhishek%20-%20ABHISHEK%20KUMAR-1.jpg?alt=media&token=6a9ca681-bdc6-48a2-ba60-e06737ac84c4'},
      {'name': 'Rudresh Dabre', 'role': 'Head, Branding', 'imageUrl': 'https://firebasestorage.googleapis.com/v0/b/first-e6681.appspot.com/o/Effervescence%20clubs%2FBranding%20and%20Logistics%2F20240405_194458%20-%20RUDRESH%20MOHAN%20DABRE-1.jpg?alt=media&token=bb1e79f8-6dc6-4051-bda6-bd1db7abf8f6'},
      {'name': 'Ravi Prakash', 'role': 'Head, Branding', 'imageUrl': 'https://firebasestorage.googleapis.com/v0/b/first-e6681.appspot.com/o/Effervescence%20clubs%2FBranding%20and%20Logistics%2Fphoto%20-%20RAVI%20PRAKASH-2.jpg?alt=media&token=b95994aa-4628-418c-98a2-52191f78bd9a'},
    ],
    'Creatives': [
      {'name': 'Rishika Gupta', 'role': 'Head, Creatives', 'imageUrl': 'https://firebasestorage.googleapis.com/v0/b/first-e6681.appspot.com/o/Effervescence%20clubs%2FCreatives%2FIMG_20231116_124048%20-%20Rishika%20Gupta.jpg?alt=media&token=dc343819-8bbe-4a61-a6c9-7b52c3f5a042'},
      {'name': 'Vedant Jadhav', 'role': 'Head, Creatives', 'imageUrl': 'https://firebasestorage.googleapis.com/v0/b/first-e6681.appspot.com/o/Effervescence%20clubs%2FCreatives%2Fimage%20-%20Vedant%20Jadhav-1.jpg?alt=media&token=2eb32ec7-d241-44c1-a7ae-59725a44c994'},
      {'name': 'Shashank Arora', 'role': 'Head, Creatives', 'imageUrl': 'https://firebasestorage.googleapis.com/v0/b/first-e6681.appspot.com/o/Effervescence%20clubs%2FCreatives%2F1725047197541%20-%20Shruti%20Agrawal.jpg?alt=media&token=06d9c603-ba77-49b2-b8bc-f8be3b27a92e'}, // Placeholder image, please update if needed
    ],
    'Events and Managements': [
      {'name': 'Manas Gupta', 'role': 'Head, Events', 'imageUrl': 'https://firebasestorage.googleapis.com/v0/b/first-e6681.appspot.com/o/Effervescence%20clubs%2FEvents%20and%20Managements%2FIMG_2061%20-%20MANAS%20GUPTA.jpeg?alt=media&token=9c35e178-3d65-4958-8638-667bdf555749'},
      {'name': 'Aryan Shah', 'role': 'Head, Events', 'imageUrl': 'https://firebasestorage.googleapis.com/v0/b/first-e6681.appspot.com/o/Effervescence%20clubs%2FEvents%20and%20Managements%2FDE50223D-02FE-4FF5-ADBC-B24930A420C4%20-%20Aryan%20Shah.jpeg?alt=media&token=9e7e17a6-4c6e-44f2-8c08-b036a68ed856'},
      {'name': 'Ravindra Chaudhary', 'role': 'Head, Events', 'imageUrl': 'https://firebasestorage.googleapis.com/v0/b/first-e6681.appspot.com/o/Effervescence%20clubs%2FEvents%20and%20Managements%2FIMG_2061%20-%20MANAS%20GUPTA.jpeg?alt=media&token=9c35e178-3d65-4958-8638-667bdf555749'}, // Placeholder image, please update if needed
    ],
  };

  void _showTeamDetails(String role) {
    List<Map<String, String>> heads = teamHeads[role] ?? [];

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
              // Display the heads of the department
              ...heads.map((head) {
                return _buildTeamMember(
                  name: head['name']!,
                  role: head['role']!,
                  imageUrl: head['imageUrl']!, // Pass imageUrl here
                );
              }).toList(),
            ],
          ),
        );
      },
    );
  }


  Widget _buildTeamMember({required String name, required String role, required String imageUrl}) {
    return Card(
      color: Colors.blueGrey[800],
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: Padding(
        padding: EdgeInsets.all(12.0),
        child: Row(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(imageUrl), // Use imageUrl here
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
        title: Text(
          'Core Team',
          style: TextStyle(color: Colors.white70),
        ),
      ),
      body: ListView.builder(
        itemCount: teamRoles.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
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
