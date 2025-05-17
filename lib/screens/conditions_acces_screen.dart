import 'package:flutter/material.dart';

class ConditionsAccesScreen extends StatelessWidget {
  final List<Map<String, String>> conditions = [
    {
      'title': 'UFR Sciences Économiques et de Gestion (SEG)',
      'details': '''BAC Séries C et D toute mention ;
BAC Séries G2 mention AB au moins ou à défaut 13/20 en Mathématiques au baccalauréat.'''
    },
    {
      'title': 'UFR Sciences Juridiques et Politiques (SJP)',
      'details': '''BAC Séries A, G2 et D toute mention ;
BAC Séries G1 et C mention AB au moins ou à défaut 12/20 en Français au baccalauréat.'''
    },
    {
      'title': 'Institut de Formation Ouverte à Distance (IFOAD)',
      'details': '''Licence Pro MOA : Niveau BAC + 2 ou équivalent.

Master Pro (M1) MOA : BAC + 3 ou équivalent en sciences économiques ou de gestion.

Master Pro (M2) MOA : BAC + 3 ou équivalent en sciences économiques ou de gestion.

Master Pro Commerce International (MIBE) : Licence (BAC + 3) en sciences économiques et de gestion ou en droit.'''
    },
    {
      'title': 'Institut Universitaire de Formation Initiale et Continue (IUFIC)',
      'details': '''Master Management de Projets :
Diplôme de première année de Master ou équivalent dans la spécialité.

Master Génie de l’Environnement :
Diplôme de première année de Master ou équivalent dans la spécialité.

Master Droit et Politiques de l’Environnement :
Maîtrise ou Master en droit ou science politique reconnu (État, CAMES…).

Master Protection et Droits de l’Enfant :
Maîtrise en sciences sociales, économiques, juridiques, politiques ou humaines reconnue par le CAMES ;
ou doctorat en médecine, pharmacie ou odontostomatologie.

Master Politiques de Développement et Gestion des Industries Extractives :
Maîtrise ou Master 1 en sciences sociales, humaines ou exactes ;
ou licence + 5 ans d’expérience dans le domaine des industries extractives.'''
    },
    {
      'title': 'LIME-LISE (Ingénierie Statistique Économie et Ingénierie Mathématique Économie)',
      'details': '''Filiere à test '''


    },
    {
      'title': 'MPCI(Maths, Physique, Chimie, Informatique)',
    'details': '''BAC Séries C et D toute mention'''



    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Conditions d’accès"),
        backgroundColor: Colors.yellow,
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(16),
        itemCount: conditions.length,
        itemBuilder: (context, index) {
          final condition = conditions[index];
          return Card(
            elevation: 4,
            margin: EdgeInsets.symmetric(vertical: 8),
            child: ListTile(
              title: Text(condition['title']!),
              subtitle: Text(condition['details']!),
            ),
          );
        },
      ),
    );
  }
}
