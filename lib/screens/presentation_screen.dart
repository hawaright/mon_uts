import 'package:flutter/material.dart';

class PresentationScreen extends StatelessWidget {
  final List<String> galleryImages = List.generate(
    8,
        (index) => 'assets/images/img_${index + 1}.png',
  );

  @override
  Widget build(BuildContext context) {
    final textColor = Theme.of(context).textTheme.bodyLarge?.color;

    return Scaffold(
      appBar: AppBar(
        title: Text("Présentation de l’UTS"),
        backgroundColor: Color(0xFF2E7D32),
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          // Image de bannière
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              'assets/images/img_1.png',
              height: 180,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: 16),

          _buildSectionTitle(context, "🎓 Présentation générale"),
          _buildParagraph(
            "L’Université Ouaga II, créée le 12 décembre 2007, a été renommée Université Thomas SANKARA en 2020 en hommage à cet Héros National. L’UTS regroupe trois UFR : SEG, SJP, ST ; deux instituts : IUFIC, IFOAD ; une École doctorale et deux centres universitaires.",
            textColor,
          ),
          _buildParagraph(
            "Elle se distingue par la qualité de son enseignement, sa recherche appliquée et son engagement pour le développement du Burkina Faso.",
            textColor,
          ),

          _buildSectionTitle(context, "📊 Chiffres clés"),
          _buildInfoCard(context, Icons.school, "30 000 étudiants", "Année 2021-2022"),
          _buildInfoCard(context, Icons.person_outline, "169 enseignants-chercheurs", ""),
          _buildInfoCard(context, Icons.people_alt, "181 personnels administratifs", ""),

          _buildSectionTitle(context, "🌍 Vision et missions"),
          _buildParagraph(
            "L’UTS veut être un pôle d’excellence, formant des cadres intègres et compétents. Elle promeut la gouvernance, la résorption des retards académiques et l’assurance qualité.",
            textColor,
          ),

          _buildSectionTitle(context, "🏞️ Éco-campus moderne"),
          _buildParagraph(
            "Depuis 2020, l’UTS est installée dans un nouveau campus à l’est de Ouagadougou (Saaba et Loumbila), offrant un cadre propice à l’apprentissage et à la recherche.",
            textColor,
          ),

          _buildSectionTitle(context, "📸 Galerie UTS"),
          GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: galleryImages.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              childAspectRatio: 1.2,
            ),
            itemBuilder: (context, index) {
              return ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  galleryImages[index],
                  fit: BoxFit.cover,
                ),
              );
            },
          ),
          SizedBox(height: 24),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(BuildContext context, String title) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final titleColor = isDark ? Colors.white : Color(0xFF2E7D32); // Blanc en sombre, vert en clair

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: titleColor,
        ),
      ),
    );
  }

  Widget _buildParagraph(String text, Color? textColor) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10),
      child: Text(
        text,
        style: TextStyle(fontSize: 16, height: 1.5, color: textColor),
        textAlign: TextAlign.justify,
      ),
    );
  }

  Widget _buildInfoCard(BuildContext context, IconData icon, String title, String subtitle) {
    return Card(
      color: Theme.of(context).colorScheme.surface.withOpacity(0.1),
      margin: EdgeInsets.symmetric(vertical: 6),
      child: ListTile(
        leading: Icon(
          icon,
          color: Theme.of(context).brightness == Brightness.dark ? Colors.white : Color(0xFF2E7D32),
        ),
        title: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Theme.of(context).textTheme.bodyLarge?.color,
          ),
        ),
        subtitle: subtitle.isNotEmpty
            ? Text(
          subtitle,
          style: TextStyle(color: Theme.of(context).textTheme.bodyMedium?.color),
        )
            : null,
      ),
    );
  }
}
