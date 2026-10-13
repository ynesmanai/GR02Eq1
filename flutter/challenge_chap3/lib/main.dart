import 'package:flutter/material.dart';

void main() {
  runApp(const CarteEtudiant());
}

class CarteEtudiant extends StatelessWidget {
  const CarteEtudiant({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'challenge_chap3',
      home: Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          title: const Text('Carte Étudiant'),
          backgroundColor: Colors.teal,
        ),
        body: Padding(
          padding: const EdgeInsets.all(12),
          child: SizedBox(
            width: double.infinity,
            height: double.infinity, // la carte descend jusqu'en bas
            child: Card(
              color: const Color(0xFFF3EDF7),
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Colonne gauche : photo
                    const CircleAvatar(
                      radius: 50,
                      backgroundImage: NetworkImage(
                        'https://picsum.photos/150',
                      ),
                    ),
                    const SizedBox(width: 20),

                    // Colonne droite : infos
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'ines salma kenza mariem',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Spécialité : E-Business',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.grey[700],
                            ),
                          ),
                          const SizedBox(height: 12),
                          const Text(
                            '🎯 Objectif :',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 4),
                          const Text(
                            'Motivée pour devenir développeuse mobile Flutter.',
                            style: TextStyle(fontSize: 16),
                          ),
                          const SizedBox(height: 12),
                          const Text(
                            '📧 Email : salmalabidi719@gmail.com',
                            style: TextStyle(fontSize: 16),
                          ),
                          const Text(
                            '📱 Téléphone : +216 58 149 518',
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}