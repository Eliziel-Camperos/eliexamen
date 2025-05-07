import 'package:flutter/material.dart';

class ColumnAlignmentPage extends StatelessWidget {
  const ColumnAlignmentPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Column Alignment'),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: Column(
        mainAxisAlignment:
            MainAxisAlignment.spaceAround, // Espaciado más equilibrado
        crossAxisAlignment:
            CrossAxisAlignment.center, // Centramos los elementos
        children: [
          Container(
            color: Colors.red,
            height: 70,
            child: const Center(
              child: Text('Red',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold)),
            ),
          ),
          Container(
            color: Colors.green,
            height: 50,
            child: const Center(
              child: Text('Green',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold)),
            ),
          ),
          Container(
            color: Colors.blue,
            height: 30,
            child: const Center(
              child: Text('Blue',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold)),
            ),
          ),
        ],
      ),
    );
  }
}
