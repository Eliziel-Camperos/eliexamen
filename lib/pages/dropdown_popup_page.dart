import 'package:flutter/material.dart';

class DropdownPopupPage extends StatefulWidget {
  const DropdownPopupPage({super.key});

  @override
  State<DropdownPopupPage> createState() => _DropdownPopupPageState();
}

class _DropdownPopupPageState extends State<DropdownPopupPage> {
  String selectedOption = 'Option 1'; // Valor inicial

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dropdown & Popup'),
        backgroundColor: Colors.deepOrange,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DropdownButton<String>(
              value: selectedOption,
              items: const [
                DropdownMenuItem(value: 'Option 1', child: Text('Option 1')),
                DropdownMenuItem(value: 'Option 2', child: Text('Option 2')),
                DropdownMenuItem(value: 'Option 3', child: Text('Option 3')),
              ],
              onChanged: (value) {
                if (value != null) {
                  setState(() {
                    selectedOption = value;
                  });
                }
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text('Popup Example'),
                    content: Text('Selected option: $selectedOption'),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text('OK'),
                      ),
                    ],
                  ),
                );
              },
              child: const Text('Show Popup'),
            ),
          ],
        ),
      ),
    );
  }
}
