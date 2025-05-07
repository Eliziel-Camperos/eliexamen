import 'package:flutter/material.dart';

class NullAwareOperatorsPage extends StatelessWidget {
  const NullAwareOperatorsPage({super.key});

  @override
  Widget build(BuildContext context) {
    String? nullableString;
    List<int>? nullableList;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Null Aware Operators'),
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
        elevation: 4,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildInfoCard(
              icon: Icons.text_fields,
              title: 'String length',
              value: nullableString?.length?.toString() ?? 'null',
            ),
            const SizedBox(height: 12),
            _buildInfoCard(
              icon: Icons.list,
              title: 'First item in list',
              value: nullableList?.isNotEmpty == true
                  ? nullableList![0].toString()
                  : 'null',
            ),
            const SizedBox(height: 24),
            const Text(
              'Code examples:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const SelectableText(
              'var length = nullableString?.length ?? 0;',
              style: TextStyle(fontFamily: 'monospace', fontSize: 16),
            ),
            const SelectableText(
              'var firstItem = nullableList?[0];',
              style: TextStyle(fontFamily: 'monospace', fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoCard({
    required IconData icon,
    required String title,
    required String value,
  }) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: Colors.deepPurple.withOpacity(0.1),
              child: Icon(icon, color: Colors.deepPurple),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    value,
                    style: TextStyle(
                      fontSize: 14,
                      color: value == 'null' ? Colors.red : Colors.black87,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
