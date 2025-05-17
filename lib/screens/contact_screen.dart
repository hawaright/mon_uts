import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactScreen extends StatelessWidget {
  final Color redColor = Color(0xFFD32F2F);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contact"),
        backgroundColor: redColor,
      ),
      body: ListView(
        children: [
          ContactTile(
            icon: Icons.location_on,
            iconColor: redColor,
            title: "Adresse",
            subtitle: "Université Thomas SANKARA, Ouagadougou, Burkina Faso",
            onTap: () async {
              const url = 'https://www.google.com/maps?q=Université+Thomas+Sankara+Ouagadougou';
              if (await canLaunch(url)) {
                await launch(url);
              }
            },
          ),
          ContactTile(
            icon: Icons.phone,
            iconColor: redColor,
            title: "Téléphone",
            subtitle: "+226 70444294",
            onTap: () async {
              const tel = 'tel:+22670444294';
              if (await canLaunch(tel)) {
                await launch(tel);
              }
            },
          ),
          ContactTile(
            icon: Icons.email,
            iconColor: redColor,
            title: "Email",
            subtitle: "contact@uts.bf",
            onTap: () async {
              final mail = Uri(
                scheme: 'mailto',
                path: 'contact@uts.bf',
              );
              if (await canLaunch(mail.toString())) {
                await launch(mail.toString());
              }
            },
          ),
          ContactTile(
            icon: Icons.public,
            iconColor: redColor,
            title: "Site web",
            subtitle: "https://www.uts.bf",
            onTap: () async {
              const url = 'https://uts.bf';
              if (await canLaunch(url)) {
                await launch(url);
              }
            },
          ),
          ContactTile(
            icon: Icons.access_time,
            iconColor: redColor,
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
      trailing: onTap != null ? Icon(Icons.open_in_new, size: 18, color: Colors.grey) : null,
    );
  }
}
