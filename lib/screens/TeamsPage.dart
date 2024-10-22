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
    'Media and Publicity',
    'Finance',
    'Public Relations',
    'Filming',
    'Hospitality and Travels',
    'Operations head',
    'Overall coordinators',
    'Sponsorship and Marketing',
    'Social Media',
    'Technical',
    'Web Development',
  ];

  // Hardcoded JSON-like structure for department heads
  final Map<String, List<Map<String, String>>> teamHeads = {
    'Board of Festival Organizers': [
      {
        'name': 'Aditya Arya',
        'role': 'Cultural Secretary',
        'imageUrl':
            'https://firebasestorage.googleapis.com/v0/b/first-e6681.appspot.com/o/team%2FBoard%20of%20Festival%20Organizers%2FAditya%20Arya%2FAdityaArya%20-%20ADITYA%20KUMAR%20ARYA.png?alt=media&token=9bca7006-b184-49d6-aa49-be0fea3c4057'
      },
      {'name': 'Manoj Pallaki', 'role': 'General Secretary', 'imageUrl': ''},
      {'name': 'Om Khangat', 'role': 'President', 'imageUrl': ''},
    ],
    'Operations head': [
      {
        'name': 'Abhimanyu Choudhary',
        'role': 'Head, Operations Head',
        'imageUrl':
            'https://firebasestorage.googleapis.com/v0/b/first-e6681.appspot.com/o/team%2FBoard%20of%20Festival%20Organizers%2FAditya%20Arya%2FAdityaArya%20-%20ADITYA%20KUMAR%20ARYA.png?alt=media&token=9bca7006-b184-49d6-aa49-be0fea3c4057'
      },
    ],
    'App Development': [
      {
        'name': 'Gaurav Chhetri',
        'role': 'Head, App Development',
        'imageUrl':
            'https://firebasestorage.googleapis.com/v0/b/first-e6681.appspot.com/o/team%2FAppDev%2FHeads%2FGaurav%20Chhetri%2FWhatsApp%20Image%202024-08-30%20at%208.56.33%20PM%20-%20GAURAV%20CHHETRI.jpeg?alt=media&token=6382555b-2620-484a-9dfc-1066baa076de'
      },
      {
        'name': 'Ishant Kumawat',
        'role': 'Head, App Development',
        'imageUrl':
            'https://firebasestorage.googleapis.com/v0/b/first-e6681.appspot.com/o/team%2FAppDev%2FHeads%2FIshant%20kumawat%2FWhatsApp%20Image%202023-09-21%20at%2014.47.04%20-%20Ishant%20kumawat.jpg?alt=media&token=f3fd883e-242e-43f9-8482-e3bec2d666df'
      },
      {
        'name': 'Lavish Meena',
        'role': 'Head, App Development',
        'imageUrl':
            'https://firebasestorage.googleapis.com/v0/b/first-e6681.appspot.com/o/team%2FAppDev%2FHeads%2FLavish%20Meena%2Flavishmeena%20-%20Lavish%20Meena.jpg?alt=media&token=a5d92422-737c-405c-9aba-d9b173b5d964'
      },
    ],
    'Branding and Logistics': [
      {
        'name': 'Abhishek Kumar',
        'role': 'Head, Branding',
        'imageUrl':
            'https://firebasestorage.googleapis.com/v0/b/first-e6681.appspot.com/o/Effervescence%20clubs%2FBranding%20and%20Logistics%2FAbhishek%20-%20ABHISHEK%20KUMAR-1.jpg?alt=media&token=6a9ca681-bdc6-48a2-ba60-e06737ac84c4'
      },
      {
        'name': 'Rudresh Dabre',
        'role': 'Head, Branding',
        'imageUrl':
            'https://firebasestorage.googleapis.com/v0/b/first-e6681.appspot.com/o/Effervescence%20clubs%2FBranding%20and%20Logistics%2F20240405_194458%20-%20RUDRESH%20MOHAN%20DABRE-1.jpg?alt=media&token=bb1e79f8-6dc6-4051-bda6-bd1db7abf8f6'
      },
      {
        'name': 'Ravi Prakash',
        'role': 'Head, Branding',
        'imageUrl':
            'https://firebasestorage.googleapis.com/v0/b/first-e6681.appspot.com/o/Effervescence%20clubs%2FBranding%20and%20Logistics%2Fphoto%20-%20RAVI%20PRAKASH-2.jpg?alt=media&token=b95994aa-4628-418c-98a2-52191f78bd9a'
      },
    ],
    'Creatives': [
      {
        'name': 'Rishika Gupta',
        'role': 'Head, Creatives',
        'imageUrl':
            'https://firebasestorage.googleapis.com/v0/b/first-e6681.appspot.com/o/Effervescence%20clubs%2FCreatives%2FIMG_20231116_124048%20-%20Rishika%20Gupta.jpg?alt=media&token=dc343819-8bbe-4a61-a6c9-7b52c3f5a042'
      },
      {
        'name': 'Vedant Jadhav',
        'role': 'Head, Creatives',
        'imageUrl':
            'https://firebasestorage.googleapis.com/v0/b/first-e6681.appspot.com/o/Effervescence%20clubs%2FCreatives%2Fimage%20-%20Vedant%20Jadhav-1.jpg?alt=media&token=2eb32ec7-d241-44c1-a7ae-59725a44c994'
      },
      {
        'name': 'Shashank Arora',
        'role': 'Head, Creatives',
        'imageUrl':
            'https://firebasestorage.googleapis.com/v0/b/first-e6681.appspot.com/o/Effervescence%20clubs%2FCreatives%2F1725047197541%20-%20Shruti%20Agrawal.jpg?alt=media&token=06d9c603-ba77-49b2-b8bc-f8be3b27a92e'
      },
    ],
    'Events and Managements': [
      {
        'name': 'Manas Gupta',
        'role': 'Head, Events',
        'imageUrl':
            'https://firebasestorage.googleapis.com/v0/b/first-e6681.appspot.com/o/Effervescence%20clubs%2FEvents%20and%20Managements%2FIMG_2061%20-%20MANAS%20GUPTA.jpeg?alt=media&token=9c35e178-3d65-4958-8638-667bdf555749'
      },
      {
        'name': 'Aryan Shah',
        'role': 'Head, Events',
        'imageUrl':
            'https://firebasestorage.googleapis.com/v0/b/first-e6681.appspot.com/o/Effervescence%20clubs%2FEvents%20and%20Managements%2FDE50223D-02FE-4FF5-ADBC-B24930A420C4%20-%20Aryan%20Shah.jpeg?alt=media&token=9e7e17a6-4c6e-44f2-8c08-b036a68ed856'
      },
      {
        'name': 'Ravindra Chaudhary',
        'role': 'Head, Events',
        'imageUrl':
            'https://firebasestorage.googleapis.com/v0/b/first-e6681.appspot.com/o/Effervescence%20clubs%2FEvents%20and%20Managements%2FIMG_2061%20-%20MANAS%20GUPTA.jpeg?alt=media&token=9c35e178-3d65-4958-8638-667bdf555749'
      },
    ],
    'Filming': [
      {
        'name': 'Ashutosh',
        'role': 'Head, Filming',
        'imageUrl':
            'https://firebasestorage.googleapis.com/v0/b/first-e6681.appspot.com/o/Effervescence%20clubs%2FFilming%2F20230428_154532%20-%20Ashutosh.jpg?alt=media&token=7a115294-f32e-4456-8dbf-253428562e47'
      },
      {
        'name': 'Harsh Shah',
        'role': 'Head, Filming',
        'imageUrl':
            'https://firebasestorage.googleapis.com/v0/b/first-e6681.appspot.com/o/Effervescence%20clubs%2FFilming%2FIMG_20240828_161848%20-%20HARSH%20KAMLESHKUMAR%20SHAH.jpg?alt=media&token=0758d795-b6a9-4633-95a2-bb89f6683ccf'
      },
      {
        'name': 'Siddharth Thota',
        'role': 'Head, Filming',
        'imageUrl':
            'https://firebasestorage.googleapis.com/v0/b/first-e6681.appspot.com/o/Effervescence%20clubs%2FFilming%2FIMG_4464%20-%20siddhartha%20thota.jpeg?alt=media&token=a4ea7194-3c7c-46a2-974a-b4ca250e12a1'
      },
      {
        'name': 'Rohith G',
        'role': 'Head, Filming',
        'imageUrl':
            'https://firebasestorage.googleapis.com/v0/b/first-e6681.appspot.com/o/Effervescence%20clubs%2FFilming%2FIMG_20240828_161848%20-%20HARSH%20KAMLESHKUMAR%20SHAH.jpg?alt=media&token=0758d795-b6a9-4633-95a2-bb89f6683ccf'
      },
    ],
    'Web Development': [
      {
        'name': 'Devam Desai',
        'role': 'Head, Web Development',
        'imageUrl':
            'https://firebasestorage.googleapis.com/v0/b/first-e6681.appspot.com/o/team%2FWebDev%2FHeads%2FDevam%20Desai%2F53524634234_9e48570ac6_o%20-%20DEVAM%20DESAI.jpeg?alt=media&token=3b967b31-eac2-487d-a3cf-43ee13ddcc3f'
      },
      {
        'name': 'Om Buddhadev',
        'role': 'Head, Web Development',
        'imageUrl':
            'https://firebasestorage.googleapis.com/v0/b/first-e6681.appspot.com/o/team%2FWebDev%2FHeads%2FOm%20Buddhadev%2FWhatsApp%20Image%202024-08-29%20at%2015.52.20%20-%20Om%20Buddhadev.jpeg?alt=media&token=933d0a1d-eade-4daa-a5b6-bb17d6f42f94'
      },
      {
        'name': 'Pranav Bansal',
        'role': 'Head, Web Development',
        'imageUrl':
            'https://firebasestorage.googleapis.com/v0/b/first-e6681.appspot.com/o/team%2FWebDev%2FHeads%2FPranav%20Bansal%2FIMG_20240830_210405%20-%20PRANAV%20BANSAL.jpg?alt=media&token=2b568942-2f10-468b-acab-b7e3bca756f'
      },
    ],
    'Sponsorship and Marketing': [
      {
        'name': 'Shreeta Mishra',
        'role': 'Head, Sponsorship',
        'imageUrl':
            'https://firebasestorage.googleapis.com/v0/b/first-e6681.appspot.com/o/team%2FSponsorship%20and%20marketing%2FIMG_9476%20-%20Shreeta%20Mishra.jpeg?alt=media&token=7f8d2b02-c06e-4e76-8359-2c9803850bcb'
      },
      {
        'name': 'Sagnik Mandal',
        'role': 'Head, Sponsorship',
        'imageUrl':
            'https://firebasestorage.googleapis.com/v0/b/first-e6681.appspot.com/o/team%2FSponsorship%20and%20marketing%2FSagnik_Mandal%20-%20Hrishika%20Singh.png?alt=media&token=e5959d84-9566-4ba1-94a5-bc7f134aa2b1'
      },
      {
        'name': 'Parimal Amrutkar',
        'role': 'Head, Sponsorship',
        'imageUrl':
            'https://firebasestorage.googleapis.com/v0/b/first-e6681.appspot.com/o/team%2FSponsorship%20and%20marketing%2FSAVE_20231011_231141%20-%20PARIMAL%20SHASHIKANT%20AMRUTKAR.jpg?alt=media&token=2b4cc02c-294b-4a28-a2a3-e76556ebb85e'
      },
      {
        'name': 'Aakif Nehal',
        'role': 'Head, Sponsorship',
        'imageUrl':
            'https://firebasestorage.googleapis.com/v0/b/first-e6681.appspot.com/o/team%2FSponsorship%20and%20marketing%2FIMG_9476%20-%20Shreeta%20Mishra.jpeg?alt=media&token=7f8d2b02-c06e-4e76-8359-2c9803850bcb'
      },
    ],
    // 'Media and Publicity': [
    //   {
    //     'name': 'Harsh Singh',
    //     'role': 'Head, Media and Publicity',
    //     'imageUrl': ''
    //   },
    //   {
    //     'name': 'Ria Chugh',
    //     'role': 'Head, Media and Publicity',
    //     'imageUrl': 'https://firebasestorage.googleapis.com/v0/b/first-e6681.appspot.com/o/team%2FMedia%20and%20Publicity%2Fria%20-%20RIA%20CHUGH-1.jpg?alt=media&token=9319ba96-979f-404e-9848-ec85559fe135'
    //   },
    //   {
    //     'name': 'Dimple Bhondekar',
    //     'role': 'Head, Media and Publicity',
    //     'imageUrl': 'https://firebasestorage.googleapis.com/v0/b/first-e6681.appspot.com/o/team%2FMedia%20and%20Publicity%2F53650968675_7b67d41c53_o%20-%20DIMPLE%20BHONDEKAR-1.jpg?alt=media&token=4fbbb6a6-a177-4bfa-b2a9-12b1e91de23b'
    //   },
    //   {
    //     'name': 'Nilesh Chaubey',
    //     'role': 'Head, Media and Publicity',
    //     'imageUrl': 'https://firebasestorage.googleapis.com/v0/b/first-e6681.appspot.com/o/team%2FMedia%20and%20Publicity%2F53650968675_7b67d41c53_o%20-%20DIMPLE%20BHONDEKAR-1.jpg?alt=media&token=4fbbb6a6-a177-4bfa-b2a9-12b1e91de23b'
    //   },
    // ],
    'Finance': [
      {
        'name': 'Chirag Paliwal',
        'role': 'Head, Finance',
        'imageUrl': 'https://example.com/path_to_ananya_image.jpg'
      },
    ],
    'Hospitality and Travels': [
      {
        'name': 'Nikunj Agrawal',
        'role': 'Head, Hospitality',
        'imageUrl': 'https://example.com/path_to_neha_image.jpg'
      },
      {
        'name': 'Hrishika Singh',
        'role': 'Head, Travels',
        'imageUrl': 'https://example.com/path_to_kunal_image.jpg'
      },
      {
        'name': 'Mohit Bajaj',
        'role': 'Head, Travels',
        'imageUrl': 'https://example.com/path_to_kunal_image.jpg'
      },
      {
        'name': 'Khushi Mehta',
        'role': 'Head, Travels',
        'imageUrl': 'https://example.com/path_to_kunal_image.jpg'
      },
    ],
    'Public Relations': [
      {
        'name': 'Tanay Falor',
        'role': 'Head, Public Relations',
        'imageUrl': 'https://example.com/path_to_priya_image.jpg'
      },
      {
        'name': 'Ksshittij Karthik',
        'role': 'Head, Public Relations',
        'imageUrl': 'https://example.com/path_to_priya_image.jpg'
      },
      {
        'name': 'Prakhar Shukla',
        'role': 'Head, Public Relations',
        'imageUrl': 'https://example.com/path_to_priya_image.jpg'
      },
      {
        'name': 'Devya Gupta',
        'role': 'Head, Public Relations',
        'imageUrl': 'https://example.com/path_to_priya_image.jpg'
      },
    ],
    'Social Media': [
      {
        'name': 'Harsh Singh',
        'role': 'Head, Social Media',
        'imageUrl': 'https://example.com/path_to_sakshi_image.jpg'
      },
      {
        'name': 'Ria Chugh',
        'role': 'Head, Social Media',
        'imageUrl': 'https://example.com/path_to_vikram_image.jpg'
      },
      {
        'name': 'Nilesh Chaubey',
        'role': 'Head, Social Media',
        'imageUrl': 'https://example.com/path_to_vikram_image.jpg'
      },
      {
        'name': 'Dimple Bhondekar',
        'role': 'Head, Social Media',
        'imageUrl': 'https://example.com/path_to_vikram_image.jpg'
      },
    ],
    'Technical': [
      {
        'name': 'Parth Dhokane',
        'role': 'Head, Technical',
        'imageUrl': 'https://example.com/path_to_rohan_image.jpg'
      },
      {
        'name': 'Abhishek Kumar',
        'role': 'Head, Technical',
        'imageUrl': 'https://example.com/path_to_sanya_image.jpg'
      },
      {
        'name': 'Srijan Jain',
        'role': 'Head, Technical',
        'imageUrl': 'https://example.com/path_to_sanya_image.jpg'
      },
      {
        'name': 'Vasu Singla',
        'role': 'Head, Technical',
        'imageUrl': 'https://example.com/path_to_sanya_image.jpg'
      },
      {
        'name': 'Nandini Gupta',
        'role': 'Head, Technical',
        'imageUrl': 'https://example.com/path_to_sanya_image.jpg'
      },
    ],
  };

  // // Hardcoded JSON-like structure for department heads
  // final Map<String, List<Map<String, String>>> teamHeads = {
  //   'App Development': [
  //     {'name': 'Gaurav Chhetri', 'role': 'Head, App Development', 'imageUrl': 'https://firebasestorage.googleapis.com/v0/b/first-e6681.appspot.com/o/team%2FAppDev%2FHeads%2FGaurav%20Chhetri%2FWhatsApp%20Image%202024-08-30%20at%208.56.33%20PM%20-%20GAURAV%20CHHETRI.jpeg?alt=media&token=6382555b-2620-484a-9dfc-1066baa076de'},
  //     {'name': 'Ishant Kumawat', 'role': 'Head, App Development', 'imageUrl': 'https://firebasestorage.googleapis.com/v0/b/first-e6681.appspot.com/o/team%2FAppDev%2FHeads%2FIshant%20kumawat%2FWhatsApp%20Image%202023-09-21%20at%2014.47.04%20-%20Ishant%20kumawat.jpg?alt=media&token=f3fd883e-242e-43f9-8482-e3bec2d666df'},
  //     {'name': 'Lavish Meena', 'role': 'Head, App Development', 'imageUrl': 'https://firebasestorage.googleapis.com/v0/b/first-e6681.appspot.com/o/team%2FAppDev%2FHeads%2FLavish%20Meena%2Flavishmeena%20-%20Lavish%20Meena.jpg?alt=media&token=a5d92422-737c-405c-9aba-d9b173b5d964'},
  //   ],
  //   'Board of Festival Organizers': [
  //     {'name': 'Aditya Arya', 'role': 'Head, Organizers', 'imageUrl': 'https://firebasestorage.googleapis.com/v0/b/first-e6681.appspot.com/o/team%2FBoard%20of%20Festival%20Organizers%2FAditya%20Arya%2FAdityaArya%20-%20ADITYA%20KUMAR%20ARYA.png?alt=media&token=9bca7006-b184-49d6-aa49-be0fea3c4057'},
  //     {'name': 'Manoj Pallaki', 'role': 'Head, Organizers', 'imageUrl': ''}, // Add image URL if available
  //     {'name': 'Om Khangat', 'role': 'Head, Organizers', 'imageUrl': ''}, // Add image URL if available
  //     {'name': 'Ansh Gadwal', 'role': 'Head, Organizers', 'imageUrl': ''}, // Add image URL if available
  //   ],
  //   'Branding and Logistics': [
  //     {'name': 'Abhishek Kumar', 'role': 'Head, Branding', 'imageUrl': 'https://firebasestorage.googleapis.com/v0/b/first-e6681.appspot.com/o/Effervescence%20clubs%2FBranding%20and%20Logistics%2FAbhishek%20-%20ABHISHEK%20KUMAR-1.jpg?alt=media&token=6a9ca681-bdc6-48a2-ba60-e06737ac84c4'},
  //     {'name': 'Rudresh Dabre', 'role': 'Head, Branding', 'imageUrl': 'https://firebasestorage.googleapis.com/v0/b/first-e6681.appspot.com/o/Effervescence%20clubs%2FBranding%20and%20Logistics%2F20240405_194458%20-%20RUDRESH%20MOHAN%20DABRE-1.jpg?alt=media&token=bb1e79f8-6dc6-4051-bda6-bd1db7abf8f6'},
  //     {'name': 'Ravi Prakash', 'role': 'Head, Branding', 'imageUrl': 'https://firebasestorage.googleapis.com/v0/b/first-e6681.appspot.com/o/Effervescence%20clubs%2FBranding%20and%20Logistics%2Fphoto%20-%20RAVI%20PRAKASH-2.jpg?alt=media&token=b95994aa-4628-418c-98a2-52191f78bd9a'},
  //   ],
  //   'Creatives': [
  //     {'name': 'Rishika Gupta', 'role': 'Head, Creatives', 'imageUrl': 'https://firebasestorage.googleapis.com/v0/b/first-e6681.appspot.com/o/Effervescence%20clubs%2FCreatives%2FIMG_20231116_124048%20-%20Rishika%20Gupta.jpg?alt=media&token=dc343819-8bbe-4a61-a6c9-7b52c3f5a042'},
  //     {'name': 'Vedant Jadhav', 'role': 'Head, Creatives', 'imageUrl': 'https://firebasestorage.googleapis.com/v0/b/first-e6681.appspot.com/o/Effervescence%20clubs%2FCreatives%2Fimage%20-%20Vedant%20Jadhav-1.jpg?alt=media&token=2eb32ec7-d241-44c1-a7ae-59725a44c994'},
  //     {'name': 'Shashank Arora', 'role': 'Head, Creatives', 'imageUrl': 'https://firebasestorage.googleapis.com/v0/b/first-e6681.appspot.com/o/Effervescence%20clubs%2FCreatives%2F1725047197541%20-%20Shruti%20Agrawal.jpg?alt=media&token=06d9c603-ba77-49b2-b8bc-f8be3b27a92e'}, // Placeholder image, please update if needed
  //   ],
  //   'Events and Managements': [
  //     {'name': 'Manas Gupta', 'role': 'Head, Events', 'imageUrl': 'https://firebasestorage.googleapis.com/v0/b/first-e6681.appspot.com/o/Effervescence%20clubs%2FEvents%20and%20Managements%2FIMG_2061%20-%20MANAS%20GUPTA.jpeg?alt=media&token=9c35e178-3d65-4958-8638-667bdf555749'},
  //     {'name': 'Aryan Shah', 'role': 'Head, Events', 'imageUrl': 'https://firebasestorage.googleapis.com/v0/b/first-e6681.appspot.com/o/Effervescence%20clubs%2FEvents%20and%20Managements%2FDE50223D-02FE-4FF5-ADBC-B24930A420C4%20-%20Aryan%20Shah.jpeg?alt=media&token=9e7e17a6-4c6e-44f2-8c08-b036a68ed856'},
  //     {'name': 'Ravindra Chaudhary', 'role': 'Head, Events', 'imageUrl': 'https://firebasestorage.googleapis.com/v0/b/first-e6681.appspot.com/o/Effervescence%20clubs%2FEvents%20and%20Managements%2FIMG_2061%20-%20MANAS%20GUPTA.jpeg?alt=media&token=9c35e178-3d65-4958-8638-667bdf555749'}, // Placeholder image, please update if needed
  //   ],
  // };

  void _showTeamDetails(String role) {
    List<Map<String, String>> heads = teamHeads[role] ?? [];

    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        // Get the screen size to make the UI responsive
        final screenSize = MediaQuery.of(context).size;

        return Container(
          decoration: BoxDecoration(
            color: Color(0xff121212),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0),
            ),
          ),
          padding: EdgeInsets.all(12.0),
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
                  imageUrl: head['imageUrl']!,
                );
              }).toList(),
            ],
          ),
        );
      },
    );
  }

  Widget _buildTeamMember({
    required String name,
    required String role,
    required String imageUrl,
  }) {
    return Card(
      color: const Color(0xff151515),
      margin: const EdgeInsets.symmetric(vertical: 4.0),
      child: GestureDetector(
        onTap: () {
          _showFullScreenImage(context, imageUrl);
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              // Profile image with error handling and border
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                      color: Colors.purpleAccent,
                      width: 2.0), // Neon purple border
                ),
                child: CircleAvatar(
                  radius: 25.0,
                  backgroundColor: Colors
                      .purpleAccent, // Neon purple background for error case
                  backgroundImage: NetworkImage(imageUrl),
                  onBackgroundImageError: (_, __) {
                    // Error handling: Show icon when image loading fails
                  },
                  child: imageUrl.isEmpty
                      ? const Icon(Icons.person,
                          size: 30.0,
                          color: Colors.black) // Black icon on error
                      : null,
                ),
              ),
              const SizedBox(width: 8),
              // Name and role column
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
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
              ),
            ],
          ),
        ),
      ),
    );
  }

// Function to show full-screen image
  void _showFullScreenImage(BuildContext context, String imageUrl) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          insetPadding: const EdgeInsets.all(10),
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).pop(); // Close the full-screen image on tap
            },
            child: Container(
              color: Colors.black,
              child: InteractiveViewer(
                child: Center(
                  child: ClipOval(
                    child: Image.network(
                      imageUrl,
                      fit: BoxFit
                          .cover, // Ensures the image fills the circular frame
                      width:
                          300, // Set the desired width for the circular image
                      height:
                          300, // Set the desired height for the circular image
                      errorBuilder: (context, error, stackTrace) {
                        return const Icon(Icons.error,
                            color: Colors.red, size: 50);
                      },
                    ),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white70,
            )),
        backgroundColor: Color(0xFF3B150E),
        title: Text(
          'Core Team',
          style: TextStyle(color: Colors.white70),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF3B150E), // Light red at the top
              Color(0xFF1A0C08), // Black at the bottom
            ],
          ),
        ),
        child: ListView.builder(
          itemCount: teamRoles.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.white70, // Border color
                  width: 2.0, // Border width
                ),
                borderRadius: BorderRadius.circular(
                    15.0), // Optional: adds rounded corners
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
      ),
    );
  }
}
