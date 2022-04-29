import 'package:flutter/material.dart';
import 'sample.dart';
import 'models.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final sampleWord = Word.fromJson(sampleWords[0]);
    return MaterialApp(
      theme: ThemeData.dark(),
      darkTheme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(
            title: const Text(
          "Dictionary",
          style: TextStyle(fontSize: 30),
        )),
        body: WordBox(word: sampleWord),
      ),
    );
  }
}

class WordBox extends StatelessWidget {
  final Word word;
  const WordBox({Key? key, required this.word}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: ListView(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                word.word,
                style: TextStyle(fontSize: 60, color: Colors.red.shade400),
              ),
              const SizedBox(width: 20),
              Text(word.phonetic),
            ],
          ),
          ...word.meanings
              .map((meaning) => MeaningView(meaning: meaning))
              .toList()
        ],
      ),
    );
  }
}

class MeaningView extends StatelessWidget {
  final Meaning meaning;
  const MeaningView({Key? key, required this.meaning}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var definitions = <Widget>[];

    for (var i = 0; i < meaning.definitions.length; i++) {
      final definition = meaning.definitions[i];
      definitions.add(Definitionview(definition: definition, index: i + 1));
      definitions.add(const SizedBox(height: 10));
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          meaning.partOfSpeech,
          style: const TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, color: Colors.grey),
        ),
        const SizedBox(height: 10),
        ...definitions
      ],
    );
  }
}

class Definitionview extends StatelessWidget {
  final Definition definition;
  final int index;

  const Definitionview(
      {Key? key, required this.definition, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final synonyms = <Widget>[];
    if (definition.synonyms.isNotEmpty) {
      synonyms.add(Container(
        padding: const EdgeInsets.all(2),
        decoration: BoxDecoration(
          color: Colors.blueGrey,
          borderRadius: BorderRadius.circular(5),
        ),
        child: const Text("Synonym"),
      ));
      synonyms.add(const SizedBox(width: 5));
      synonyms.add(Text(definition.synonyms.join(", ")));
    }

    final antonyms = <Widget>[];
    if (definition.antonyms.isNotEmpty) {
      antonyms.add(Container(
        padding: const EdgeInsets.all(2),
        decoration: BoxDecoration(
          color: Colors.blueGrey,
          borderRadius: BorderRadius.circular(5),
        ),
        child: const Text("Antonyms"),
      ));
      antonyms.add(const SizedBox(width: 5));
      antonyms.add(Text(definition.antonyms.join(", ")));
    }

    final example = <Widget>[];
    if (definition.example.isNotEmpty) {
      example.add(const SizedBox(height: 10));
      example.add(
        Text(
          "❝ ${definition.example}❞",
          style: const TextStyle(
            fontStyle: FontStyle.italic,
            color: Colors.grey,
          ),
        ),
      );
    }

    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        border: Border.all(),
        color: Colors.black38,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("$index. ${definition.definition}"),
          ...example,
          const SizedBox(height: 10),
          Row(children: synonyms),
          const SizedBox(height: 5),
          Row(children: antonyms),
        ],
      ),
    );
  }
}
