import 'package:flutter/material.dart';

class UserProductScreen extends StatelessWidget {
  const UserProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Add your Products here.")),
      body: const Center(
        child: Text('The new products screen'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.grey[600],
        elevation: 0,
        child: const Icon(Icons.add),
      ),
    );
  }
}
