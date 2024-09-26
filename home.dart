import 'package:flutter/material.dart';
import 'telaTreino.dart'; // Importa a tela de treino
import 'historicoTreino.dart'; // Importa a tela de histórico de treino
import 'Perfil.dart'; // Importa a tela de perfil

class TelaPrincipal extends StatefulWidget {
  @override
  _TelaPrincipalState createState() => _TelaPrincipalState();
}

class _TelaPrincipalState extends State<TelaPrincipal> {
  int _selectedIndex = 0;

  // Lista de telas que podem ser acessadas pelo BottomNavigationBar
  final List<Widget> _pages = [
    TelaPrincipalContent(), // Tela principal
    TreinoScreen(), // Tela de treino
    Historico(), // Tela de histórico de treino
    Perfil(), // Tela de perfil
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF301c41),
      ),
      body: _pages[_selectedIndex], // Exibe a tela correspondente
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Início',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.fitness_center),
            label: 'Treino',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.timer),
            label: 'Timer',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Perfil',
          ),
        ],
        onTap: (index) {
          setState(() {
            _selectedIndex = index; // Atualiza o índice
          });
        },
      ),
    );
  }
}

// Tela principal com o conteúdo atual
class TelaPrincipalContent extends StatelessWidget {
  final String user = "Usuário";
  final List<Map<String, String>> treinos = [
    {"nomeTreino": "Treino 1"},
    {"nomeTreino": "Treino 2"},
    {"nomeTreino": "Treino 3"},
  ];

  // Função que abre o BottomSheet
  void _openBottomSheet(BuildContext context, String nomeTreino) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        // Exemplo de séries de exercícios
        List<Map<String, dynamic>> series = [
          {"serie": 1, "kg": 25, "rep": 15, "done": false},
          {"serie": 2, "kg": 25, "rep": 15, "done": false},
          {"serie": 3, "kg": 25, "rep": 15, "done": false},
        ];

        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    nomeTreino,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20),
                  Column(
                    children: series.map((serie) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Série ${serie['serie']}'),
                            SizedBox(
                              width: 60,
                              child: TextField(
                                decoration: InputDecoration(
                                  labelText: 'Kg',
                                ),
                                keyboardType: TextInputType.number,
                                onChanged: (value) {
                                  setState(() {
                                    serie['kg'] = int.tryParse(value) ?? serie['kg'];
                                  });
                                },
                              ),
                            ),
                            SizedBox(
                              width: 60,
                              child: TextField(
                                decoration: InputDecoration(
                                  labelText: 'Rep',
                                ),
                                keyboardType: TextInputType.number,
                                onChanged: (value) {
                                  setState(() {
                                    serie['rep'] = int.tryParse(value) ?? serie['rep'];
                                  });
                                },
                              ),
                            ),
                            Checkbox(
                              value: serie['done'],
                              onChanged: (bool? value) {
                                setState(() {
                                  serie['done'] = value!;
                                });
                              },
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('Fechar'),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Olá $user',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          Text(
            'Treinos',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 20),
          Column(
            children: treinos.map((treino) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF413b6b),
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  onPressed: () {
                    _openBottomSheet(context, treino["nomeTreino"]!);
                  },
                  child: Text(
                        treino["nomeTreino"]!,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                  ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
