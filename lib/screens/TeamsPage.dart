import 'package:flutter/material.dart';

class TeamPage extends StatefulWidget {
  @override
  _TeamPageState createState() => _TeamPageState();
}

class _TeamPageState extends State<TeamPage> {
  final List<String> teamRoles = [
    'Board of Festival Organizers',
    'Overall coordinators',
    'Operations head',
    'Finance',
    'Events and Managements',
    'Sponsorship and Marketing',
    'Public Relations',
    'Technical',
    'Filming',
    'Hospitality and Travels',
    'Media and Publicity',
    'Social Media',
    'Creatives',
    'Web Development',
    'App Development',
    'Branding and Logistics',
  ];

  // Hardcoded JSON-like structure for department heads
  final Map<String, List<Map<String, String>>> teamHeads = {
  'Board of Festival Organizers': [
  {
  'name': 'Aditya Arya',
  'role': 'Cultural Secretary',
  'imageUrl':
  'https://firebasestorage.googleapis.com/v0/b/first-e6681.appspot.com/o/Effervescence%20clubs%2FBOFO%2FIMG_8267%5B1%5D.jpg?alt=media&token=ac595759-b8bf-4749-afcb-756ecf85baf3'
  },
  {'name': 'Manoj Pallaki',
  'role': 'General Secretary',
  'imageUrl': 'https://firebasestorage.googleapis.com/v0/b/first-e6681.appspot.com/o/Effervescence%20clubs%2FBOFO%2FWhatsApp%20Image%202024-10-23%20at%2000.04.19_f9090f4a.jpg?alt=media&token=65854b2d-3291-49cc-84e4-bca74228422a'
  },
  {
  'name': 'Om Khangat',
  'role': 'President',
  'imageUrl': 'https://firebasestorage.googleapis.com/v0/b/first-e6681.appspot.com/o/Effervescence%20clubs%2FBOFO%2Fom%20kahngat.png?alt=media&token=f78cca60-5673-45dc-8e6f-4a0c98391d58'},
  ],
  'Operations head': [
  {
  'name': 'Abhimanyu Choudhary',
  'role': 'Head, Operations Head',
  'imageUrl':
  'https://firebasestorage.googleapis.com/v0/b/first-e6681.appspot.com/o/team%2FOperations%20Head%2FAbhimanyu%20Chaudhary%2F419025796_1423823798246150_2772186203953349587_n.jpg?alt=media&token=c7eb34c0-4380-49a7-9eaa-4fbf9ec43b6a'
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
  'https://firebasestorage.googleapis.com/v0/b/first-e6681.appspot.com/o/Effervescence%20clubs%2FBranding%20and%20Logistics%2FRudresh.jpg?alt=media&token=ba92e601-5a2e-45a3-8a75-a23832e9b313'
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
  'https://firebasestorage.googleapis.com/v0/b/first-e6681.appspot.com/o/Effervescence%20clubs%2FCreatives%2FWhatsApp%20Image%202024-08-30%20at%2021.28.49_a068404e%20-%20Shashank%20Arora.jpg?alt=media&token=fbf0b2d5-9f9c-451f-bfbf-637bb4f57f64'
  },
  ],
  'Events and Managements': [
  {
  'name': 'Manas Gupta',
  'role': 'Head, Events',
  'imageUrl':
  'https://firebasestorage.googleapis.com/v0/b/first-e6681.appspot.com/o/Effervescence%20clubs%2FEvents%20and%20Managements%2FIMG_2061%20-%20MANAS%20GUPTA%20(1).jpeg?alt=media&token=cf2294fc-0fce-4459-b7bf-b25428d6050e'
  },
  {
  'name': 'Aryan Shah',
  'role': 'Head, Events',
  'imageUrl':
  'https://firebasestorage.googleapis.com/v0/b/first-e6681.appspot.com/o/Effervescence%20clubs%2FEvents%20and%20Managements%2FDE50223D-02FE-4FF5-ADBC-B24930A420C4%20-%20Aryan%20Shah%20(2).jpeg?alt=media&token=b734826b-71ec-40c7-946e-bbe1c682e43d'
  },
  {
  'name': 'Ravindra Chaudhary',
  'role': 'Head, Events',
  'imageUrl':
  'https://firebasestorage.googleapis.com/v0/b/first-e6681.appspot.com/o/Effervescence%20clubs%2FEvents%20and%20Managements%2FScreenshot%202024-10-22%20at%2011.53.17%E2%80%AFPM.png?alt=media&token=5256f2b2-fb72-4457-8008-9fb8783c0c9b'
  },
  ],
    'Overall coordinators': [
      {
      'name': 'Ansh Gadwal',
      'role': 'Overall Coordinator',
      'imageUrl': 'https://firebasestorage.googleapis.com/v0/b/first-e6681.appspot.com/o/team%2FOverall%20coordinators%2FAnsh%20Gadwal%2Fansh%20gadwal.png?alt=media&token=05f77d2b-6099-4dca-ba34-ea83b2de268c',
      },
      {
        'name': 'Ayush Saxena',
        'role': 'Overall Coordinator',
        'imageUrl': 'https://firebasestorage.googleapis.com/v0/b/first-e6681.appspot.com/o/team%2FOverall%20coordinators%2FAyush%20Saxena%2FIMG_20240823_182438%20-%20Ayush%20Saxena.jpg?alt=media&token=fb8cca71-08c6-4130-8c28-f1be268e2d83',
      },

    ],
  'Filming': [
  {
  'name': 'Ashutosh',
  'role': 'Head, Filming',
  'imageUrl':
  'https://firebasestorage.googleapis.com/v0/b/first-e6681.appspot.com/o/Effervescence%20clubs%2FFilming%2F20230428_154532%20-%20Ashutosh%20(1).jpg?alt=media&token=766917cb-8c0c-4a81-9e3c-d945fbb35cb3'
  },
  {
  'name': 'Harsh Shah',
  'role': 'Head, Filming',
  'imageUrl':
  'https://firebasestorage.googleapis.com/v0/b/first-e6681.appspot.com/o/Effervescence%20clubs%2FFilming%2FIMG_20240828_161848%20-%20HARSH%20KAMLESHKUMAR%20SHAH%20(1).jpg?alt=media&token=9b4ed20e-e7a7-4ef7-8e9b-4ce9e6376768'
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
  'https://firebasestorage.googleapis.com/v0/b/first-e6681.appspot.com/o/Effervescence%20clubs%2FFilming%2FROHIT%20G.png?alt=media&token=5a75e46c-6ab4-4477-9140-012c588675c9'
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
  'https://firebasestorage.googleapis.com/v0/b/first-e6681.appspot.com/o/Effervescence%20clubs%2FSponsorship%20and%20marketing%2FIMG_9476%20-%20Shreeta%20Mishra.jpeg?alt=media&token=7f8d2b02-c06e-4e76-8359-2c9803850bcb'
  },
  {
  'name': 'Sagnik Mandal',
  'role': 'Head, Sponsorship',
  'imageUrl':
  'https://firebasestorage.googleapis.com/v0/b/first-e6681.appspot.com/o/Effervescence%20clubs%2FSponsorship%20and%20marketing%2FSagnik_Mandal%20-%20Hrishika%20Singh.png?alt=media&token=e5959d84-9566-4ba1-94a5-bc7f134aa2b1'
  },
  {
  'name': 'Parimal Amrutkar',
  'role': 'Head, Sponsorship',
  'imageUrl':
  'https://firebasestorage.googleapis.com/v0/b/first-e6681.appspot.com/o/Effervescence%20clubs%2FSponsorship%20and%20marketing%2FSAVE_20231011_231141%20-%20PARIMAL%20SHASHIKANT%20AMRUTKAR.jpg?alt=media&token=2b4cc02c-294b-4a28-a2a3-e76556ebb85e'
  },
  {
  'name': 'Aakif Nehal',
  'role': 'Head, Sponsorship',
  'imageUrl':
  'https://firebasestorage.googleapis.com/v0/b/first-e6681.appspot.com/o/Effervescence%20clubs%2FSponsorship%20and%20marketing%2FScreenshot%202024-10-23%20at%2012.10.30%E2%80%AFAM.png?alt=media&token=6f1e38c7-48a3-47f6-9747-9cd2ed899aaa'
  },
  ],
  'Finance': [
  {
  'name': 'Chirag Paliwal',
  'role': 'Head, Finance',
  'imageUrl': 'https://firebasestorage.googleapis.com/v0/b/first-e6681.appspot.com/o/Effervescence%20clubs%2FFinance%2Fchairag%20paliWAL.png?alt=media&token=346fef6c-4199-4dc2-bfbb-eaf45e5e42cf'
  },
  ],
  'Hospitality and Travels': [
  {
  'name': 'Nikunj Agrawal',
  'role': 'Head, Hospitality',
  'imageUrl': 'https://firebasestorage.googleapis.com/v0/b/first-e6681.appspot.com/o/Effervescence%20clubs%2FHospitality%20And%20Travels%2FHeads%2FNikunj%20Agarwal%2FIMG-20240518-WA0065%20-%20Nikunj%20Agarwal.jpg?alt=media&token=092d27dd-d597-4328-84d4-1f3e5e9e3b19'
  },
  {
  'name': 'Hrishika Singh',
  'role': 'Head, Travels',
  'imageUrl': 'https://firebasestorage.googleapis.com/v0/b/first-e6681.appspot.com/o/Effervescence%20clubs%2FHospitality%20And%20Travels%2FHeads%2FHrishika%20Singh%2FHrishika_Singh%20-%20Hrishika%20Singh.jpg?alt=media&token=697be1f5-29d4-414d-a758-16d58a988a7e'
  },
  {
  'name': 'Mohit Bajaj',
  'role': 'Head, Travels',
  'imageUrl': 'https://firebasestorage.googleapis.com/v0/b/first-e6681.appspot.com/o/Effervescence%20clubs%2FHospitality%20And%20Travels%2FHeads%2FMohit%20Bajaj%2F20230822_230529%20-%20Mohit%20Bajaj.jpg?alt=media&token=90a82ea3-1d72-4505-9249-e9b03503a7c9'
  },
  {
  'name': 'Khushi Mehta',
  'role': 'Head, Travels',
  'imageUrl': 'https://firebasestorage.googleapis.com/v0/b/first-e6681.appspot.com/o/Effervescence%20clubs%2FHospitality%20And%20Travels%2FHeads%2FKhushi%20Mehta%2FIMG_6592%20-%20Khushi%20Mehta.jpeg?alt=media&token=9f85c609-2f08-488f-8fed-511dee284209'
  },
  ],
  'Public Relations': [
  {
  'name': 'Tanay Falor',
  'role': 'Head, Public Relations',
  'imageUrl': 'https://firebasestorage.googleapis.com/v0/b/first-e6681.appspot.com/o/Effervescence%20clubs%2FPublic%20Relation%2FHeads%2FTanay%20Falor%2FIMG_20230929_153445%20-%20Tanay%20(1)%20(1).jpg?alt=media&token=7be69860-1c5f-4a1b-a36d-e987451da6eb'
  },
  {
  'name': 'Ksshittij Karthik',
  'role': 'Head, Public Relations',
  'imageUrl': 'https://firebasestorage.googleapis.com/v0/b/first-e6681.appspot.com/o/Effervescence%20clubs%2FPublic%20Relation%2FHeads%2FKsshittij%20Karthik%2FIMG_9475%20-%20kshitij%20karthik%20E%20(1)%20(1).jpg?alt=media&token=4c6df4fd-825a-4df9-8946-d2d5fb71b8bc'
  },
  {
  'name': 'Prakhar Shukla',
  'role': 'Head, Public Relations',
  'imageUrl': 'https://firebasestorage.googleapis.com/v0/b/first-e6681.appspot.com/o/Effervescence%20clubs%2FPublic%20Relation%2FHeads%2FPrakhar%20Shukla%2FScreenshot%202024-10-22%20at%2011.54.36%E2%80%AFPM%20(1).png?alt=media&token=d2490cb3-6004-4f04-927f-2765bc6132db'
  },
  {
  'name': 'Devya Gupta',
  'role': 'Head, Public Relations',
  'imageUrl': 'https://firebasestorage.googleapis.com/v0/b/first-e6681.appspot.com/o/Effervescence%20clubs%2FPublic%20Relation%2FHeads%2FDevya%20Gupta%2F20240119_211603%20-%20DEVYA%20GUPTA-min.jpg?alt=media&token=2d27cc49-7caf-4b44-bc8a-6c532b42778e'
  },
  ],
  'Social Media': [
  {
  'name': 'Rishika Aggarwal',
  'role': 'Head, Social Media',
  'imageUrl': 'https://firebasestorage.googleapis.com/v0/b/first-e6681.appspot.com/o/Effervescence%20clubs%2FSocial%20Media%2FHeads%2FRishika%20Agarwal%2FRISHIKA%20AGARWAL.png?alt=media&token=b1a307c2-792a-4a8b-894a-6e5eb2f6f0b1'
  },
  ],
  'Media and Publicity': [
  {
  'name': 'Harsh Singh',
  'role': 'Head, Media',
  'imageUrl': 'https://firebasestorage.googleapis.com/v0/b/first-e6681.appspot.com/o/Effervescence%20clubs%2FMedia%20and%20Publicity%2FScreenshot%202024-10-22%20at%2011.50.05%E2%80%AFPM.png?alt=media&token=90db7438-835c-4ee3-8f45-8b6cb3bdd11d'
  },
  {
  'name': 'Ria Chugh',
  'role': 'Head, Media',
  'imageUrl': 'https://firebasestorage.googleapis.com/v0/b/first-e6681.appspot.com/o/Effervescence%20clubs%2FMedia%20and%20Publicity%2Fria%20-%20RIA%20CHUGH-1.jpg?alt=media&token=9319ba96-979f-404e-9848-ec85559fe135'
  },
  {
  'name': 'Nilesh Chaubey',
  'role': 'Head, Media',
  'imageUrl': 'https://firebasestorage.googleapis.com/v0/b/first-e6681.appspot.com/o/Effervescence%20clubs%2FMedia%20and%20Publicity%2FNILESH.png?alt=media&token=d48b5c0c-6a24-4b6f-801d-0860674cfaaa'
  },
  {
  'name': 'Dimple Bhondekar',
  'role': 'Head, Social Media',
  'imageUrl': 'https://firebasestorage.googleapis.com/v0/b/first-e6681.appspot.com/o/Effervescence%20clubs%2FMedia%20and%20Publicity%2F53650968675_7b67d41c53_o%20-%20DIMPLE%20BHONDEKAR-1.jpg?alt=media&token=4fbbb6a6-a177-4bfa-b2a9-12b1e91de23b'
  },
  ],
  'Technical': [
  {
  'name': 'Parth Dhokane',
  'role': 'Head, Technical',
  'imageUrl': 'https://firebasestorage.googleapis.com/v0/b/first-e6681.appspot.com/o/Effervescence%20clubs%2FTechnical%2FHeads%2FParth%20Dhokane%2Feffe_photo%20-%20Parth%20Dhokane.jpeg?alt=media&token=efbcb546-1a22-49df-9e78-7ac379df84e2'
  },
  {
  'name': 'Abhishek Kumar',
  'role': 'Head, Technical',
  'imageUrl': 'https://firebasestorage.googleapis.com/v0/b/first-e6681.appspot.com/o/Effervescence%20clubs%2FTechnical%2FHeads%2FAbhishek%20Kumar%2FAbhishek%20-%20ABHISHEK%20KUMAR.jpg?alt=media&token=89dc79a7-0419-482f-a362-763dcbb1adf0'
  },
  {
  'name': 'Srijan Jain',
  'role': 'Head, Technical',
  'imageUrl': 'https://firebasestorage.googleapis.com/v0/b/first-e6681.appspot.com/o/Effervescence%20clubs%2FTechnical%2FHeads%2FSrijan%20Jain%2FIMG-20240419-WA0000%20-%20srijan%20jain.jpg?alt=media&token=6ed12127-f918-464f-972d-0b6fdbdadaa0'
  },
  {
  'name': 'Vasu Singla',
  'role': 'Head, Technical',
  'imageUrl': 'https://firebasestorage.googleapis.com/v0/b/first-e6681.appspot.com/o/Effervescence%20clubs%2FTechnical%2FHeads%2FVasu%20Singla%2FScreenshot%202024-10-23%20at%2012.08.15%E2%80%AFAM.png?alt=media&token=ed8b02ee-a9aa-4c34-9cac-1d41761cef67'
  },
  {
  'name': 'Nandini Gupta',
  'role': 'Head, Technical',
  'imageUrl': 'https://firebasestorage.googleapis.com/v0/b/first-e6681.appspot.com/o/Effervescence%20clubs%2FTechnical%2FHeads%2FNandini%20Gupta%2FNANDINI%20GUPTA.png?alt=media&token=d6372763-d0f5-4199-85dd-890283ded6f7'
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
          child: SingleChildScrollView(
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
                borderRadius: BorderRadius.circular(15.0), // Adds rounded corners
              ),
              child: Material(
                color: Colors.transparent, // Ensures ripple effect appears over background
                child: InkWell(
                  borderRadius: BorderRadius.circular(15.0), // Ripple matches the rounded corners
                  onTap: () => _showTeamDetails(teamRoles[index]),
                  splashColor: Colors.white54, // Color of the ripple effect
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      title: Text(
                        teamRoles[index],
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white70,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }


// @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     backgroundColor: Colors.black,
  //     appBar: AppBar(
  //       leading: IconButton(
  //           onPressed: () {
  //             Navigator.pop(context);
  //           },
  //           icon: Icon(
  //             Icons.arrow_back,
  //             color: Colors.white70,
  //           )),
  //       backgroundColor: Color(0xFF3B150E),
  //       title: Text(
  //         'Core Team',
  //         style: TextStyle(color: Colors.white70),
  //       ),
  //     ),
  //     body: Container(
  //       decoration: const BoxDecoration(
  //         gradient: LinearGradient(
  //           begin: Alignment.topCenter,
  //           end: Alignment.bottomCenter,
  //           colors: [
  //             Color(0xFF3B150E), // Light red at the top
  //             Color(0xFF1A0C08), // Black at the bottom
  //           ],
  //         ),
  //       ),
  //       child: ListView.builder(
  //         itemCount: teamRoles.length,
  //         itemBuilder: (BuildContext context, int index) {
  //           return Container(
  //             margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
  //             decoration: BoxDecoration(
  //               border: Border.all(
  //                 color: Colors.white70, // Border color
  //                 width: 2.0, // Border width
  //               ),
  //               borderRadius: BorderRadius.circular(
  //                   15.0), // Optional: adds rounded corners
  //             ),
  //             child: ListTile(
  //               title: Text(
  //                 teamRoles[index],
  //                 style: TextStyle(
  //                   fontSize: 16,
  //                   fontWeight: FontWeight.bold,
  //                   color: Colors.white70,
  //                 ),
  //               ),
  //               onTap: () => _showTeamDetails(teamRoles[index]),
  //             ),
  //           );
  //         },
  //       ),
  //     ),
  //   );
  // }
}
