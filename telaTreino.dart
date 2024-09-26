import 'package:flutter/material.dart';

class TreinoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Edição de Treinos',
          style: TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            treinoButton(context, 'Treino 1'),
            SizedBox(height: 15),
            treinoButton(context, 'Treino 2'),
            SizedBox(height: 15),
            treinoButton(context, 'Treino 3'),
            SizedBox(height: 30),
            FloatingActionButton(
              onPressed: () {
                showTreinoBottomSheet(context, "Adicionar Novo Treino");
              },
              backgroundColor: Color(0xFF6f95ff),
              child: Icon(Icons.add, size: 40, color: Colors.white,),
            ),
          ],
        ),
      ),
    );
  }

  Widget treinoButton(BuildContext context, String label) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(0xFF6f95ff),
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      onPressed: () {
        showTreinoBottomSheet(context, label);
      },
      child: Text(
        label,
        style: TextStyle(
          color: Colors.white,
          fontSize: 18,
        ),
      ),
    );
  }

  void showTreinoBottomSheet(BuildContext context, String nomeTreino) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        List<Map<String, dynamic>> series = [
          {"serie": 1, "kg": 25, "rep": 15},
          {"serie": 2, "kg": 25, "rep": 15},
          {"serie": 3, "kg": 25, "rep": 15},
        ];

        // Nome do exercício a ser exibido abaixo das séries
        String nomeExercicio = "Exercício 1";

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
                      color: Color(0xFF413b6b),
                    ),
                  ),
                  // Nome do exercício adicionado abaixo das séries
                  SizedBox(height: 20),
                  Center(
                  child: Text(
                    "Exercício: $nomeExercicio",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF413b6b),
                    ),
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
                          ],
                        ),
                      );
                    }).toList(),
                  ),

                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text('Fechar'),
                      ),
                      SizedBox(width: 20), // Espaço entre os botões
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text('Salvar'),
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
