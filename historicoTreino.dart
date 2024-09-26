import 'package:flutter/material.dart';

class Historico extends StatelessWidget {
  final List<Map<String, String>> treinos = [
    {"nome": "Treino 1", "duracao": "01:34", "data": "Segunda, 23/09"},
    {"nome": "Treino 2", "duracao": "01:45", "data": "Segunda, 24/09"},
    {"nome": "Treino 3", "duracao": "01:20", "data": "Segunda, 24/09"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Histórico',
          style: TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: treinos.map((treino) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: GestureDetector(
                onTap: () {
                  _showBottomSheet(context, treino["nome"]!);
                },
                child: Center(
                child: Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Color(0xFF6F95FF),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        treino["nome"]!,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'Tempo de duração: ${treino["duracao"]}',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        treino["data"]!,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }

  void _showBottomSheet(BuildContext context, String nomeTreino) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  nomeTreino,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 16),
              _buildExerciseSection("Exercício 1"),
              _buildExerciseSection("Exercício 2"),
              _buildExerciseSection("Exercício 3"),
            ],
          ),
        );
      },
    );
  }

  Widget _buildExerciseSection(String exerciseName) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          exerciseName,
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 8),
        _buildSeriesRow(1, 25, 15, true),
        _buildSeriesRow(2, 25, 15, false),
        _buildSeriesRow(3, 25, 15, true),
        Divider(height: 24, thickness: 2, color: Color(0xFF413B6B)),
      ],
    );
  }

  Widget _buildSeriesRow(int serie, int kg, int reps, bool completed) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("Série $serie"),
          Text("$kg Kg"),
          Text("$reps Rep"),
          Icon(
            completed ? Icons.check_box : Icons.cancel,
            color: completed ? Colors.green : Colors.red,
          ),
        ],
      ),
    );
  }
}
