import 'package:flutter/material.dart';

class TabBarPage extends StatelessWidget {
  const TabBarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('TabBar Example'),
          centerTitle: true,
          bottom: TabBar(
            indicator: UnderlineTabIndicator(
              borderSide: BorderSide(
                width: 3.0,
                color: Theme.of(context).colorScheme.secondary,
              ),
              insets: const EdgeInsets.symmetric(horizontal: 24.0),
            ),
            labelColor: Theme.of(context).colorScheme.secondary,
            unselectedLabelColor: Colors.grey,
            tabs: const [
              Tab(
                icon: Icon(Icons.home_filled),
                text: 'Home',
              ),
              Tab(
                icon: Icon(Icons.settings_applications),
                text: 'Settings',
              ),
              Tab(
                icon: Icon(Icons.account_circle_rounded),
                text: 'Profile',
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _buildTabContent(
              context,
              Icons.home_filled,
              'Home Content',
              Colors.blueAccent,
              'Welcome to your home screen!',
            ),
            _buildTabContent(
              context,
              Icons.settings_applications,
              'Settings',
              Colors.greenAccent,
              'Configure your app preferences here.',
            ),
            _buildTabContent(
              context,
              Icons.account_circle_rounded,
              'User Profile',
              Colors.purpleAccent,
              'Manage your account settings.',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTabContent(
    BuildContext context,
    IconData icon,
    String title,
    Color color,
    String description,
  ) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: color.withOpacity(0.2),
              shape: BoxShape.circle,
            ),
            child: Icon(
              icon,
              size: 48,
              color: color,
            ),
          ),
          const SizedBox(height: 24),
          Text(
            title,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: color,
                ),
          ),
          const SizedBox(height: 16),
          Text(
            description,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: Theme.of(context)
                      .textTheme
                      .bodyLarge
                      ?.color
                      ?.withOpacity(0.8),
                ),
          ),
          const SizedBox(height: 32),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: color,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: 24,
                vertical: 12,
              ),
            ),
            onPressed: () {},
            child: const Text('Explore Features'),
          ),
        ],
      ),
    );
  }
}
