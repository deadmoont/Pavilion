import 'package:flutter/material.dart';

class SponsorPage extends StatefulWidget {
  @override
  _SponsorPageState createState() => _SponsorPageState();
}

class _SponsorPageState extends State<SponsorPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        leading: IconButton(onPressed: (){Navigator.pop(context);}, icon: Icon(Icons.arrow_back , color: Colors.white,)),
        title: Text(
          'Sponsors',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xFF121212),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            SponsorCard(
              name: 'Company A',
              description: 'Leading industry in tech solutions.',
              logoUrl:
                  'https://tse2.mm.bing.net/th?id=OIP.6VHUPJ1Pqa37XcPSmuloPwHaDt&pid=Api&P=0&h=180',
            ),
            SponsorCard(
              name: 'Company B',
              description: 'Innovative products for everyday life.',
              logoUrl:
                  'https://tse2.mm.bing.net/th?id=OIP.6VHUPJ1Pqa37XcPSmuloPwHaDt&pid=Api&P=0&h=180',
            ),
            SponsorCard(
              name: 'Company C',
              description: 'Your trusted partner in growth.',
              logoUrl:
                  'https://tse2.mm.bing.net/th?id=OIP.6VHUPJ1Pqa37XcPSmuloPwHaDt&pid=Api&P=0&h=180',
            ),
          ],
        ),
      ),
    );
  }
}

class SponsorCard extends StatelessWidget {
  final String name;
  final String description;
  final String logoUrl;

  const SponsorCard({
    required this.name,
    required this.description,
    required this.logoUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Image.network(
              logoUrl,
              width: 50,
              height: 50,
            ),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    description,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
