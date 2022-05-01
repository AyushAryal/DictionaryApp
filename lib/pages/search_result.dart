import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:dictionary/word_card.dart';
import 'package:dictionary/models.dart';
import 'dart:convert';

class SearchResults extends StatefulWidget {
  const SearchResults(this.query, {Key? key}) : super(key: key);
  final String query;

  @override
  State<SearchResults> createState() => _SearchResultsState();
}

class _SearchResultsState extends State<SearchResults> {
  List<Word> words = [];

  @override
  void initState() {
    final url =
        Uri.https('api.dictionaryapi.dev', 'api/v2/entries/en/${widget.query}');
    http.get(url).then((response) {
      if (response.statusCode == 200) {
        setState(() {
          words = jsonDecode(response.body)
              .cast<Map<String, dynamic>>()
              .map<Word>(Word.fromJson)
              .toList();
        });
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
            "Dictionary",
            style: TextStyle(fontSize: 30),
          ),
          actions: [
            // Navigate to the Search Screen
            IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.search))
          ]),
      body: words.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : WordGroup(
              words: words,
            ),
    );
  }
}
