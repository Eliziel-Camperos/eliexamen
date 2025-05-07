import 'package:flutter/material.dart';

class ReorderableListPage extends StatefulWidget {
  const ReorderableListPage({super.key});

  @override
  State<ReorderableListPage> createState() => _ReorderableListPageState();
}

class _ReorderableListPageState extends State<ReorderableListPage> {
  final List<String> _items = [
    'Flutter Development',
    'UI/UX Design',
    'Backend Integration',
    'State Management',
    'API Consumption',
    'Testing',
    'Deployment'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reorderable List'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: _addNewItem,
            tooltip: 'Add new item',
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: ReorderableListView.builder(
          itemCount: _items.length,
          itemBuilder: (context, index) {
            return _buildListCard(index, _items[index]);
          },
          onReorder: _handleReorder,
          proxyDecorator: (child, index, animation) {
            return Material(
              elevation: 6,
              color: Theme.of(context).cardTheme.color,
              borderRadius: BorderRadius.circular(12),
              child: child,
            );
          },
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addNewItem,
        child: const Icon(Icons.add),
        tooltip: 'Add new item',
      ),
    );
  }

  Widget _buildListCard(int index, String item) {
    return Card(
      key: ValueKey(item),
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        leading: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: Colors.primaries[index % Colors.primaries.length]
                .withOpacity(0.2),
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Text(
              '${index + 1}',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.primaries[index % Colors.primaries.length],
              ),
            ),
          ),
        ),
        title: Text(
          item,
          style: const TextStyle(fontWeight: FontWeight.w500),
        ),
        subtitle: Text('Priority: ${index + 1}'),
        trailing: ReorderableDragStartListener(
          index: index,
          child: const Icon(Icons.drag_handle, color: Colors.grey),
        ),
        onTap: () => _showEditDialog(index),
      ),
    );
  }

  void _handleReorder(int oldIndex, int newIndex) {
    setState(() {
      if (oldIndex < newIndex) newIndex--;
      final item = _items.removeAt(oldIndex);
      _items.insert(newIndex, item);
    });

    // Show a snackbar feedback
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content:
            Text('Moved "${_items[newIndex]}" to position ${newIndex + 1}'),
        duration: const Duration(seconds: 1),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }

  void _addNewItem() {
    final textController = TextEditingController();
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Add New Item'),
        content: TextField(
          controller: textController,
          decoration: const InputDecoration(
            labelText: 'Item name',
            border: OutlineInputBorder(),
          ),
          autofocus: true,
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              if (textController.text.isNotEmpty) {
                setState(() => _items.add(textController.text));
                Navigator.pop(context);
              }
            },
            child: const Text('Add'),
          ),
        ],
      ),
    );
  }

  void _showEditDialog(int index) {
    final textController = TextEditingController(text: _items[index]);
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Edit Item'),
        content: TextField(
          controller: textController,
          decoration: const InputDecoration(
            labelText: 'Item name',
            border: OutlineInputBorder(),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () {
              setState(() => _items.removeAt(index));
              Navigator.pop(context);
            },
            tooltip: 'Delete item',
          ),
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() => _items[index] = textController.text);
              Navigator.pop(context);
            },
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }
}
