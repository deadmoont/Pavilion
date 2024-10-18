import 'package:flutter/material.dart';

import '../components/sponsor_card.dart';

class SponsorPage extends StatefulWidget {
  @override
  _SponsorPageState createState() => _SponsorPageState();
}

class _SponsorPageState extends State<SponsorPage> {
  Future<List<Map<String, String>>> fetchSponsors() async {
    // Simulate API call
    await Future.delayed(Duration(seconds: 2));
    // Return your API response here
    return [
      {
        'logo': 'https://cdn.pixabay.com/photo/2023/10/13/17/10/mushroom-8313142_1280.jpg',
        'name': 'Z Square Mall',
        'partner': 'Official Mall Partner',
      },
      {
        'logo': 'https://cdn.pixabay.com/photo/2023/10/13/17/10/mushroom-8313142_1280.jpg',
        'name': 'Z Square Mall',
        'partner': 'Official Mall Partner',
      },
      {
        'logo': 'https://cdn.pixabay.com/photo/2023/10/13/17/10/mushroom-8313142_1280.jpg',
        'name': 'Z Square Mall',
        'partner': 'Official Mall Partner',
      },
      {
        'logo': 'https://cdn.pixabay.com/photo/2023/10/13/17/10/mushroom-8313142_1280.jpg',
        'name': 'Z Square Mall',
        'partner': 'Official Mall Partner',
      },
      {
        'logo': 'https://cdn.pixabay.com/photo/2023/10/13/17/10/mushroom-8313142_1280.jpg',
        'name': 'Z Square Mall',
        'partner': 'Official Mall Partner',
      },
      {
        'logo': 'https://cdn.pixabay.com/photo/2023/10/13/17/10/mushroom-8313142_1280.jpg',
        'name': 'Z Square Mall',
        'partner': 'Official Mall Partner',
      },
      {
        'logo': 'https://cdn.pixabay.com/photo/2023/10/13/17/10/mushroom-8313142_1280.jpg',
        'name': 'Z Square Mall',
        'partner': 'Official Mall Partner',
      },
      {
        'logo': 'https://cdn.pixabay.com/photo/2023/10/13/17/10/mushroom-8313142_1280.jpg',
        'name': 'Z Square Mall',
        'partner': 'Official Mall Partner',
      },
      {
        'logo': 'https://cdn.pixabay.com/photo/2023/10/13/17/10/mushroom-8313142_1280.jpg',
        'name': 'Z Square Mall',
        'partner': 'Official Mall Partner',
      },
      {
        'logo': 'https://cdn.pixabay.com/photo/2023/10/13/17/10/mushroom-8313142_1280.jpg',
        'name': 'Z Square Mall',
        'partner': 'Official Mall Partner',
      },
      {
        'logo': 'https://cdn.pixabay.com/photo/2023/10/13/17/10/mushroom-8313142_1280.jpg',
        'name': 'Z Square Mall',
        'partner': 'Official Mall Partner',
      },
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('Sponsors', style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: FutureBuilder<List<Map<String, String>>>(
        future: fetchSponsors(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error fetching sponsors'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No sponsors available'));
          }

          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              return SponsorCard(
                logo: snapshot.data![index]['logo']!,
                name: snapshot.data![index]['name']!,
                partner: snapshot.data![index]['partner']!,
              );
            },
          );
        },
      ),
    );
  }
}

// class SponsorCard extends StatelessWidget {
//   final String logo;
//   final String name;
//   final String partner;
//
//   const SponsorCard({
//     required this.logo,
//     required this.name,
//     required this.partner,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
//       padding: EdgeInsets.all(16),
//       decoration: BoxDecoration(
//         color: Color(0xFF2C2F48),
//         borderRadius: BorderRadius.circular(10),
//         border: Border.all(
//           color: Colors.white.withOpacity(0.1), // Border similar to the image
//         ),
//       ),
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           // Logo
//           Container(
//             width: 90,
//             height: 90,
//             decoration: BoxDecoration(
//               image: DecorationImage(
//                 image: NetworkImage(logo), // Use NetworkImage for API data
//                 fit: BoxFit.contain,
//               ),
//             ),
//           ),
//           SizedBox(width: 20),
//           // Sponsor Info
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 name,
//                 style: TextStyle(
//                   fontSize: 18,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.white,
//                 ),
//               ),
//               SizedBox(height: 5),
//               Text(
//                 partner,
//                 style: TextStyle(
//                   fontSize: 14,
//                   color: Colors.white70,
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }

class SponsorCard extends StatelessWidget {
  final String logo;
  final String name;
  final String partner;

  const SponsorCard({
    required this.logo,
    required this.name,
    required this.partner,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Color(0xFF2C2F48), // Background color similar to the image
        borderRadius: BorderRadius.circular(10), // Rounded corners for the card
        border: Border.all(
          color: Colors.white.withOpacity(0.1), // Slightly transparent white border
          width: 1.5, // Thickness of the border
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Logo container with borderRadius
          Container(
            width: 130,
            height: 130,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20), // Border radius for the image itself
              image: DecorationImage(
                image: NetworkImage(logo), // NetworkImage or AssetImage for logos
                fit: BoxFit.cover, // Ensures the logo is well-contained
              ),
            ),
          ),
          SizedBox(width: 20), // Spacing between logo and text
          // Sponsor Info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 5), // Spacing between name and partner info
                Text(
                  partner,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white70,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}