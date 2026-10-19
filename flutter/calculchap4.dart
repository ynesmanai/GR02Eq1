
import 'package:flutter/material.dart';

void main() {
  runApp(const CalculatriceApp());
}

class CalculatriceApp extends StatelessWidget {
  const CalculatriceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculatrice simple',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
        ),
      ),
      home: const CalculatricePage(),
    );
  }
}

class CalculatricePage extends StatefulWidget {
  const CalculatricePage({super.key});

  @override
  State<CalculatricePage> createState() => _CalculatricePageState();
}

class _CalculatricePageState extends State<CalculatricePage> {
  final TextEditingController _nombre1Controller =
      TextEditingController();

  final TextEditingController _nombre2Controller =
      TextEditingController();

  String _resultat = '';
  String _erreur = '';

  void _calculer(String operation) {
    final String texte1 = _nombre1Controller.text.trim();
    final String texte2 = _nombre2Controller.text.trim();

    final double? nombre1 =
        double.tryParse(texte1.replaceAll(',', '.'));
    final double? nombre2 =
        double.tryParse(texte2.replaceAll(',', '.'));

    setState(() {
      _erreur = '';
      _resultat = '';

      if (nombre1 == null || nombre2 == null) {
        _erreur = 'Veuillez saisir deux nombres valides.';
        return;
      }

      double resultat;

      switch (operation) {
        case '+':
          resultat = nombre1 + nombre2;
          break;

        case '-':
          resultat = nombre1 - nombre2;
          break;

        case '×':
          resultat = nombre1 * nombre2;
          break;

        case '÷':
          if (nombre2 == 0) {
            _erreur = 'La division par zéro est impossible.';
            return;
          }
          resultat = nombre1 / nombre2;
          break;

        default:
          _erreur = 'Opération inconnue.';
          return;
      }

      _resultat = resultat.toString();
    });
  }

  void _reset() {
    setState(() {
      _nombre1Controller.clear();
      _nombre2Controller.clear();
      _resultat = '';
      _erreur = '';
    });
  }

  @override
  void dispose() {
    _nombre1Controller.dispose();
    _nombre2Controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculatrice simple'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                controller: _nombre1Controller,
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true,
                  signed: true,
                ),
                decoration: const InputDecoration(
                  labelText: 'Nombre 1',
                  border: UnderlineInputBorder(),
                ),
              ),
              const SizedBox(height: 12),

              TextField(
                controller: _nombre2Controller,
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true,
                  signed: true,
                ),
                decoration: const InputDecoration(
                  labelText: 'Nombre 2',
                  border: UnderlineInputBorder(),
                ),
              ),
              const SizedBox(height: 25),

              Wrap(
                alignment: WrapAlignment.center,
                spacing: 10,
                runSpacing: 10,
                children: [
                  _boutonOperation('+'),
                  _boutonOperation('-'),
                  _boutonOperation('×'),
                  _boutonOperation('÷'),
                ],
              ),

              const SizedBox(height: 20),

              if (_resultat.isNotEmpty)
                Text(
                  'Résultat : $_resultat',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),

              if (_erreur.isNotEmpty)
                Text(
                  _erreur,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.red,
                    fontSize: 16,
                  ),
                ),

              const SizedBox(height: 25),

              Center(
                child: ElevatedButton(
                  onPressed: _reset,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 30,
                      vertical: 12,
                    ),
                  ),
                  child: const Text('Reset'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _boutonOperation(String operation) {
    return ElevatedButton(
      onPressed: () => _calculer(operation),
      child: Text(
        operation,
        style: const TextStyle(fontSize: 20),
      ),
    );
  }
}
