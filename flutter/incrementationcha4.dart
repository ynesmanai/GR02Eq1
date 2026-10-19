
import 'package:flutter/material.dart';

void main() {
  runApp(const MonApplication());
}

class MonApplication extends StatelessWidget {
  const MonApplication({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Mon Compteur',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
        ),
        useMaterial3: true,
      ),
      home: const CompteurPage(),
    );
  }
}

// Widget principal
class CompteurPage extends StatefulWidget {
  const CompteurPage({super.key});

  @override
  State<CompteurPage> createState() => _CompteurPageState();
}

// Classe qui gère l'état
class _CompteurPageState extends State<CompteurPage> {
  int _compteur = 0;

  void _incrementer() {
    setState(() {
      _compteur++;
    });
  }

  void _decrementer() {
    if (_compteur > 0) {
      setState(() {
        _compteur--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mon Compteur'),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Valeur actuelle : $_compteur',
              style: const TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Colors.red,
              ),
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: _decrementer,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.redAccent,
                    foregroundColor: Colors.white,
                  ),
                  child: const Text('Décrémenter'),
                ),
                const SizedBox(width: 15),
                ElevatedButton(
                  onPressed: _incrementer,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.white,
                  ),
                  child: const Text('Incrémenter'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
