import 'package:flutter/material.dart';
import 'pages/column_alignment_page.dart';
import 'pages/tab_bar_page.dart';
import 'pages/fitted_box_page.dart';
import 'pages/dropdown_popup_page.dart';
import 'pages/reorderable_list_page.dart';
import 'pages/null_aware_operators_page.dart';
import 'pages/cascade_operator_page.dart';
import 'pages/fractionally_sized_box_page.dart';
import 'pages/constrained_box_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const List<({String title, Widget page, IconData icon, Color color})>
      _pageItems = [
    (
      title: 'Column Alignment',
      page: ColumnAlignmentPage(),
      icon: Icons.align_vertical_center,
      color: Colors.blue
    ),
    (
      title: 'TabBar Implementation',
      page: TabBarPage(),
      icon: Icons.tab,
      color: Colors.green
    ),
    (
      title: 'FittedBox Usage',
      page: FittedBoxPage(),
      icon: Icons.fit_screen,
      color: Colors.orange
    ),
    (
      title: 'DropDown & Popup',
      page: DropdownPopupPage(),
      icon: Icons.arrow_drop_down_circle,
      color: Colors.purple
    ),
    (
      title: 'ReorderableListView',
      page: ReorderableListPage(),
      icon: Icons.swap_vert,
      color: Colors.red
    ),
    (
      title: 'Null Aware Operators',
      page: NullAwareOperatorsPage(),
      icon: Icons.question_mark,
      color: Colors.teal
    ),
    (
      title: 'Cascade Operator',
      page: CascadeOperatorPage(),
      icon: Icons.casino,
      color: Colors.indigo
    ),
    (
      title: 'Fractionally SizedBox',
      page: FractionallySizedBoxPage(),
      icon: Icons.aspect_ratio,
      color: Colors.amber
    ),
    (
      title: 'Constrained Box',
      page: ConstrainedBoxPage(),
      icon: Icons.square_foot,
      color: Colors.cyan
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Eliziel 1159'),
        centerTitle: true,
        elevation: 4,
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.deepPurple.shade50,
              Colors.deepPurple.shade100,
            ],
          ),
        ),
        child: LayoutBuilder(
          builder: (context, constraints) {
            final isWide = constraints.maxWidth > 600;
            return isWide
                ? GridView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: _pageItems.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 12,
                      crossAxisSpacing: 12,
                      childAspectRatio: 3,
                    ),
                    itemBuilder: (context, index) {
                      final item = _pageItems[index];
                      return _CustomListCard(
                        title: item.title,
                        page: item.page,
                        icon: item.icon,
                        color: item.color,
                      );
                    },
                  )
                : ListView.separated(
                    padding: const EdgeInsets.all(16),
                    itemCount: _pageItems.length,
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 12),
                    itemBuilder: (context, index) {
                      final item = _pageItems[index];
                      return _CustomListCard(
                        title: item.title,
                        page: item.page,
                        icon: item.icon,
                        color: item.color,
                      );
                    },
                  );
          },
        ),
      ),
    );
  }
}

class _CustomListCard extends StatelessWidget {
  final String title;
  final Widget page;
  final IconData icon;
  final Color color;

  const _CustomListCard({
    required this.title,
    required this.page,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () {
          Navigator.push(
            context,
            PageRouteBuilder(
              pageBuilder: (_, __, ___) => page,
              transitionsBuilder: (_, animation, __, child) {
                return FadeTransition(opacity: animation, child: child);
              },
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Semantics(
                label: '$title icon',
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: color.withOpacity(0.2),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(icon, color: color),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const Icon(Icons.chevron_right, color: Colors.grey),
            ],
          ),
        ),
      ),
    );
  }
}
