import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:crypto_tracker/core/router/app_routes.dart';

class PortfolioScreen extends StatelessWidget {
  const PortfolioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Portfolio'), // Should be localized
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Portfolio Screen (Placeholder)'),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Use go_router to navigate by name
                context.pushNamed(AppRoutes.marketName);
              },
              child: const Text('Go to Market Screen'),
            ),
          ],
        ),
      ),
    );
  }
}