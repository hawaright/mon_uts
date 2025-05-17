import 'package:flutter/material.dart';
import '../models/formation_model.dart';
import 'formation_detail_screen.dart';

class FormationsScreen extends StatefulWidget {
  @override
  _FormationsScreenState createState() => _FormationsScreenState();
}

class _FormationsScreenState extends State<FormationsScreen> {
  final List<Formation> _allFormations = [
    Formation(
      title: 'UFR de Sciences Économiques et de Gestion (SEG)',
      description: 'Formations en sciences économiques et en gestion.',
      diplomas: '''
Licence en Sciences Économiques :
• Macroéconomie et Gestion du Développement (MGD)
• Économie Agricole et Sécurité Alimentaire (EASA)
• Économie de l'Environnement et du Développement Durable (EED)

Master :
• Économie Appliquée
• Économie Agricole
• Macro-économie Appliquée et Finances Internationales (MAFI)

DESS :
• Développement local et gestion des collectivités locales

Licence en Sciences de Gestion (LSG) :
• Économie et Gestion des Entreprises et des Organisations (EGEO)

DESS :
• Finance, Comptabilité, Contrôle
''',
      debouches: '''
• Économiste de développement
• Planificateur économique et social
• Gestionnaire de projets
• Cadre en finances internationales
• Administration publique et privée
• ONG, entreprises, cabinets d’étude
''',
      conditions: 'Voir la page dédiée aux conditions d’admission.',
    ),
    Formation(
      title: 'UFR de Sciences Juridiques et Politiques (SJP)',
      description: 'Formations en droit public et privé.',
      diplomas: '''
Licence :
• Droit privé et des affaires
• Droit public

Master :
• Droit Privé
• Droit Public
''',
      debouches: '''
• Métiers de la justice (avocat, magistrat…)
• Services juridiques
• Diplomatie
• Concours administratifs (Police, Gendarmerie)
• ONG et entreprises nationales/internationales
''',
      conditions: 'Voir la page dédiée aux conditions d’admission.',
    ),
    Formation(
      title: 'IFOAD (Institut de Formation Ouverte à Distance)',
      description: 'Formations à distance en gestion et commerce international.',
      diplomas: '''
Licence Professionnelle :
• Management des ONG et Associations (MOA)

Master Pro :
• Management des ONG et Associations (M1 & M2)
• Commerce International, Global Marketing et Internationalisation (MIBE)
''',
      debouches: '''
• Gestion des ONG
• Carrières internationales en commerce et marketing
• Consultant en développement
''',
      conditions: 'Voir la page dédiée aux conditions d’admission.',
    ),
    Formation(
      title: 'IUFIC (Institut Universitaire de Formation Initiale et Continue)',
      description: 'Formations continues et initiales dans plusieurs domaines.',
      diplomas: '''
Licence :
• Sciences de Gestion
• Sciences Politiques

Master :
• Management de Projets
• Santé Internationale
• Génie de l’Environnement
• Droit et Politiques de l’Environnement
• Protection et Droits de l’Enfant
• Politiques de Développement et Gestion des Industries Extractives
''',
      debouches: '''
• Carrières administratives
• Experts en environnement
• Gestion de projets et ONG
• Spécialistes en politiques publiques
''',
      conditions: 'Voir la page dédiée aux conditions d’admission.',
    ),
    Formation(
      title: 'UFR en Sciences et Techniques (ST)',
      description: 'Formation scientifique de haut niveau dans plusieurs disciplines fondamentales.',
      diplomas: '''
Licence en MPCI(Maths, Physique, Chimie, Informatique)
Licence en LIME-LISE (Ingénierie Statistique Économie et Ingénierie Mathématique Économie)
Master en Mathematiques
''',
      debouches: '''
• Enseignement supérieur
• Recherche scientifique
• Industrie
• Informatique, télécommunications
• Analyste statistique
• Chargé d’études économiques
• Modélisateur économique ou financier
• Consultant en data science ou big data
• Expert en évaluation de politiques publiques
• Actuaire junior
• Métiers de la banque, assurance, finance
• Poursuite d’études en master ou doctorat

''',
      conditions: 'Voir la page dédiée aux conditions d’admission.',
    ),
  ];

  List<Formation> _filteredFormations = [];

  @override
  void initState() {
    super.initState();
    _filteredFormations = _allFormations;
  }

  void _filterFormations(String query) {
    setState(() {
      _filteredFormations = _allFormations.where((formation) {
        final titleLower = formation.title.toLowerCase();
        final descriptionLower = formation.description.toLowerCase();
        final searchLower = query.toLowerCase();
        return titleLower.contains(searchLower) || descriptionLower.contains(searchLower);
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Formations à l’UTS'),
        backgroundColor: Colors.red[800],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                labelText: 'Rechercher une formation...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              ),
              onChanged: _filterFormations,
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(16),
              itemCount: _filteredFormations.length,
              itemBuilder: (context, index) {
                final formation = _filteredFormations[index];
                return Card(
                  elevation: 5,
                  margin: EdgeInsets.symmetric(vertical: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: ListTile(
                    title: Text(formation.title),
                    subtitle: Text(formation.description),
                    trailing: Icon(Icons.arrow_forward_ios),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => FormationDetailScreen(formation: formation),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
