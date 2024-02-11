import 'package:flutter/material.dart';

class DefaultCard extends StatelessWidget {
  final String description;
  final String keyResults;
  final String habitsName;
  final String imagePath;

  DefaultCard({
    required this.description,
    required this.keyResults,
    required this.habitsName,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(habitsName),
        subtitle: Text(description),
        leading: Image.asset(imagePath),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailedPage(
                description: description,
                keyResults: keyResults,
                habitsName: habitsName,
                imagePath: imagePath,
              ),
            ),
          );
        },
      ),
    );
  }
}

class DetailedPage extends StatelessWidget {
  final String description;
  final String keyResults;
  final String habitsName;
  final String imagePath;

  DetailedPage({
    required this.description,
    required this.keyResults,
    required this.habitsName,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detailed Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Habit Name: $habitsName'),
            Text('Description: $description'),
            Text('Key Results: $keyResults'),
            Image.asset(imagePath), // Displaying the same image
          ],
        ),
      ),
    );
  }
}
