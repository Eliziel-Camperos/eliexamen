import 'package:flutter/material.dart';

class MaterialPage extends StatelessWidget {
  const MaterialPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Material Widget')),
      body: Center(
        child: Material(
          elevation: 8,
          borderRadius: BorderRadius.circular(16),
          color: Colors.blue,
          child: const Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              'Material Widget',
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
          ),
        ),
      ),
    );
  }
}
