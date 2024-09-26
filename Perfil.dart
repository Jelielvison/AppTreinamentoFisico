import 'package:flutter/material.dart';

class Perfil extends StatelessWidget {
  const Perfil({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          'Seu Perfil',
          style: TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            const Text(
              '{\$user}', // Substitua com o nome do usuário real
              style: TextStyle(fontSize: 30),
            ),
            const SizedBox(height: 40),
            ListTile(
              title: const Text('Conta'),
              onTap: () {
                // Ação para a opção "Conta"
              },
            ),
            ListTile(
              title: const Text('Notificações'),
              onTap: () {
                // Ação para a opção "Notificações"
              },
            ),
            ListTile(
              title: const Text('Configurações'),
              onTap: () {
                // Ação para a opção "Configurações"
              },
            ),
            const Spacer(),
            Align(
              alignment: Alignment.bottomRight,
              child: ElevatedButton(
                onPressed: () {
                  // Ação para "Sair"
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF413b6b), // Cor do botão "Sair"
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                ),
                child: const Text(
                    'Sair',
                    style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
