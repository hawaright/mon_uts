import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

import 'formations_screen.dart';
import 'conditions_acces_screen.dart';
import 'presentation_screen.dart';
import 'vie_campus_screen.dart';
import 'theme_provider.dart';
import 'contact_screen.dart';


class HomeScreen extends StatelessWidget {
  final Color greenColor = Color(0xFF2E7D32);
  final Color redColor = Color(0xFFD32F2F);
  final Color yellowColor = Color(0xFFFFC107);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            // En-tête avec logo et citation
            Container(
              color: Theme.of(context).cardColor,
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage('assets/images/logo_uts.png'),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: AnimatedTextKit(
                      animatedTexts: [
                        TyperAnimatedText(
                          '"Il faut oser inventer l’avenir" - Thomas Sankara',
                          textStyle: TextStyle(
                            fontSize: 16,
                            color: redColor,
                            fontWeight: FontWeight.bold,
                          ),
                          speed: Duration(milliseconds: 70),
                        ),
                      ],
                      totalRepeatCount: 1,
                      pause: Duration(milliseconds: 800),
                      displayFullTextOnTap: true,
                    ),
                  ),
                ],
              ),
            ),

            // Titre
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Université Thomas Sankara",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: greenColor,
                  ),
                ),
              ),
            ),

            // Zone principale
            Expanded(
              child: Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Theme.of(context).cardColor,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 10,
                      offset: Offset(0, -5),
                    )
                  ],
                ),
                child: Column(
                  children: [
                    _buildNavButton(
                      context,
                      icon: Icons.info_outline,
                      label: "Présentation",
                      color: greenColor,
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => PresentationScreen()),
                      ),
                    ),
                    _buildNavButton(
                      context,
                      icon: Icons.school_outlined,
                      label: "Formations",
                      color: redColor,
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => FormationsScreen()),
                      ),
                    ),
                    _buildNavButton(
                      context,
                      icon: Icons.check_circle_outline,
                      label: "Conditions d’accès",
                      color: yellowColor,
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => ConditionsAccesScreen()),
                      ),
                    ),
                    _buildNavButton(
                      context,
                      icon: Icons.people_outline,
                      label: "Vie de campus",
                      color: greenColor,
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => VieCampusScreen()),
                      ),
                    ),
                    _buildNavButton(
                      context,
                      icon: Icons.contact_mail_outlined,
                      label: "Contact",
                      color: redColor,
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => ContactScreen()),
                      ),
                    ),


                    SizedBox(height: 20),
                    Divider(color: Colors.grey[300], thickness: 1),
                    SizedBox(height: 10),

                    // Switch pour thème sombre
                    Consumer<ThemeProvider>(
                      builder: (context, themeProvider, _) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              themeProvider.isDarkMode ? Icons.nights_stay : Icons.wb_sunny,
                              color: themeProvider.isDarkMode ? Colors.amber : Colors.orange,
                            ),
                            SizedBox(width: 10),
                            Text(
                              "Mode sombre",
                              style: TextStyle(
                                fontSize: 16,
                                color: Theme.of(context).textTheme.bodyLarge?.color,
                              ),
                            ),
                            SizedBox(width: 10),
                            Switch(
                              value: themeProvider.isDarkMode,
                              onChanged: (value) {
                                themeProvider.toggleTheme(value);
                              },
                            ),
                          ],
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNavButton(BuildContext context,
      {required IconData icon,
        required String label,
        required Color color,
        required VoidCallback onTap}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Material(
        color: color.withOpacity(0.1),
        elevation: 2,
        borderRadius: BorderRadius.circular(12),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(12),
          splashColor: color.withOpacity(0.3),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 12),
            child: Row(
              children: [
                Icon(icon, color: color, size: 26),
                SizedBox(width: 12),
                Expanded(
                  child: Text(
                    label,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: Theme.of(context).textTheme.bodyLarge?.color,
                    ),
                  ),
                ),
                Icon(Icons.arrow_forward_ios,
                    size: 16, color: Theme.of(context).iconTheme.color),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
