import 'package:flutter/material.dart';

class VieCampusScreen extends StatelessWidget {
  final List<Map<String, String>> vieCampus = [
    {
      'title': 'Vie associative',
      'details':
      'L’UTS regroupe plusieurs associations telles que l’ANEB (Association Nationale des Étudiants Burkinabè), les clubs scientifiques, les clubs d’anglais et les groupes religieux. Ces associations animent la vie estudiantine sur le campus.',
      'image': 'assets/images/associations_uts.jpg',
    },
    {
      'title': 'Santé',
      'details':
      'Le centre de santé de l’UTS, situé sur le campus, offre des consultations de base, des soins infirmiers et des orientations vers des services spécialisés si nécessaire.',
      'image': 'assets/images/centre_santé_uts.jpg',
    },
    {
      'title': 'Sport',
      'details':
      'Le campus dispose d’un terrain de football, de basketball. Des compétitions interuniversitaires y sont régulièrement organisées.',
      'image': 'assets/images/terrain_sport_uts.jpg',
    },
    {
      'title': 'Financement et bourses',
      'details':
      'Le CENOU et le ministère en charge de l’enseignement supérieur attribuent chaque année des bourses et aides sociales selon des critères académiques et sociaux.',
      'image': 'assets/images/bourses_uts.jpg',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Vie de campus"),
        backgroundColor: Color(0xFF2E7D32), // Vert UTS
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(16),
        itemCount: vieCampus.length,
        itemBuilder: (context, index) {
          final item = vieCampus[index];
          return Card(
            elevation: 5,
            margin: EdgeInsets.symmetric(vertical: 10),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: Column(
              children: [
                if (item['image'] != null)
                  ClipRRect(
                    borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
                    child: Image.asset(item['image']!, fit: BoxFit.cover),
                  ),
                ListTile(
                  title: Text(
                    item['title']!,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  subtitle: Padding(
                    padding: const EdgeInsets.only(top: 6.0),
                    child: Text(item['details']!),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
