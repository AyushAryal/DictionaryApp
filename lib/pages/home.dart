import 'package:flutter/material.dart';
import 'package:dictionary/word_card.dart';
import 'package:dictionary/models.dart';
import 'package:dictionary/sample.dart';
import 'package:dictionary/pages/search.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sampleWord = Word.fromJson(sampleWords[0]);

    return Scaffold(
      appBar: AppBar(
          title: const Text(
            "Dictionary",
            style: TextStyle(fontSize: 30),
          ),
          actions: [
            // Navigate to the Search Screen
            IconButton(
                onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const SearchPage()),
                    ),
                icon: const Icon(Icons.search))
          ]),
      body: WordBox(word: sampleWord),
    );
  }
}
