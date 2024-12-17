import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:itracelink/core/models/user.dart';
import 'package:itracelink/core/providers/auth_provider.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final user = context.watch<AuthProvider>().currentUser;
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              context.read<AuthProvider>().signOut();
              Navigator.of(context).pushReplacementNamed('/');
            },
          ),
        ],
      ),
      body: _buildDashboardContent(user),
    );
  }

  Widget _buildDashboardContent(User? user) {
    if (user == null) return const SizedBox();

    switch (user.role) {
      case UserRole.farmer:
        return const FarmerDashboard();
      case UserRole.aggregator:
        return const AggregatorDashboard();
      case UserRole.processor:
        return const ProcessorDashboard();
      case UserRole.institutionalBuyer:
        return const InstitutionalBuyerDashboard();
      case UserRole.consumer:
        return const ConsumerDashboard();
      case UserRole.admin:
        return const AdminDashboard();
    }
  }
}

class FarmerDashboard extends StatelessWidget {
  const FarmerDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Farmer Dashboard'));
  }
}

class AggregatorDashboard extends StatelessWidget {
  const AggregatorDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Aggregator Dashboard'));
  }
}

class ProcessorDashboard extends StatelessWidget {
  const ProcessorDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Processor Dashboard'));
  }
}

class InstitutionalBuyerDashboard extends StatelessWidget {
  const InstitutionalBuyerDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Institutional Buyer Dashboard'));
  }
}

class ConsumerDashboard extends StatelessWidget {
  const ConsumerDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Consumer Dashboard'));
  }
}

class AdminDashboard extends StatelessWidget {
  const AdminDashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Admin Dashboard'));
  }
}