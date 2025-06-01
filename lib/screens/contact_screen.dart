import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactScreen extends StatelessWidget {
  final Color greenColor = Color(0xFF2E5A09);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contact"),
        backgroundColor: Colors.green[600],
      ),
      body: ListView(
        children: [
          ContactTile(
            icon: Icons.location_on,
            iconColor: greenColor,
            title: "Adresse",
            subtitle: "Université Thomas SANKARA, Ouagadougou, Burkina Faso",
            onTap: () async {
              final Uri url = Uri.parse(
                  'https://www.google.com/maps?q=Université+Thomas+Sankara+Ouagadougou');
              if (await canLaunchUrl(url)) {
                await launchUrl(url);
              }
            },
          ),
          ContactTile(
            icon: Icons.phone,
            iconColor: greenColor,
            title: "Téléphone",
            subtitle: "+226 70444294",
            onTap: () async {
              final Uri tel = Uri(scheme: 'tel', path: '+22670444294');
              if (await canLaunchUrl(tel)) {
                await launchUrl(tel);
              }
            },
          ),
          ContactTile(
            icon: Icons.email,
            iconColor: greenColor,
            title: "Email",
            subtitle: "contact@uts.bf",
            onTap: () async {
              final Uri mail = Uri(
                scheme: 'mailto',
                path: 'contact@uts.bf',
              );
              if (await canLaunchUrl(mail)) {
                await launchUrl(mail);
              }
            },
          ),
          ContactTile(
            icon: Icons.public,
            iconColor: greenColor,
            title: "Site web",
            subtitle: "https://www.uts.bf",
            onTap: () async {
              final Uri url = Uri.parse('https://www.uts.bf');
              if (await canLaunchUrl(url)) {
                await launchUrl(url);
              }
            },
          ),
          ContactTile(
            icon: Icons.access_time,
            iconColor: greenColor,
            title: "Horaires d'ouverture",
            subtitle: "Lun-Ven : 08h - 17h",
          ),
        ],
      ),
    );
  }
}

class ContactTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final VoidCallback? onTap;
  final Color iconColor;

  const ContactTile({
    required this.icon,
    required this.title,
    required this.subtitle,
    this.onTap,
    this.iconColor = Colors.grey,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: iconColor),
      title: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text(subtitle),
      onTap: onTap,
      trailing:
      onTap != null ? Icon(Icons.open_in_new, size: 18, color: Colors.grey) : null,
    );
  }
}
