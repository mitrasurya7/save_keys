import 'package:flutter/material.dart';
import '../models/keynotes_model.dart';
import '../repositories/keynotes_repository.dart';

class HomeScreen extends StatelessWidget {
  final KeynotesRepository repository = KeynotesRepository();

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SQFLite Example'),
      ),
      body: FutureBuilder<List<KeynotesModel>>(
        future: repository.getKeynotess(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('No Data Found'));
          } else {
            final keynotes = snapshot.data!;
            return ListView.builder(
              itemCount: keynotes.length,
              itemBuilder: (context, index) {
                final keynote = keynotes[index];
                return ListTile(
                  title: Text(keynote.account),
                  subtitle: Text('Value: ${keynote.password}'),
                );
              },
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await repository.insertKeynotes(
            KeynotesModel(account: 'test', password: 'test', createdAt: 'test'),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
