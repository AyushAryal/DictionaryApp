class Word {
  Word({
    required this.word,
    required this.phonetic,
    required this.phonetics,
    required this.meanings,
  });
  Word.fromJson(Map<String, dynamic> json)
      : word = json['word'],
        phonetic = json['phonetic'],
        phonetics = (json['phonetics'] as List<Map<String, dynamic>>)
            .map(Phonetic.fromJson)
            .toList(),
        meanings = (json['meanings'] as List<Map<String, dynamic>>)
            .map(Meaning.fromJson)
            .toList();

  String word;
  String phonetic;
  List<Phonetic> phonetics;
  List<Meaning> meanings;
}

class Phonetic {
  Phonetic({
    required this.phonetic,
    required this.audio,
  });

  Phonetic.fromJson(Map<String, dynamic> json)
      : phonetic = json['text'],
        audio = json['audio'];

  String phonetic;
  String audio;
}

class Meaning {
  Meaning({
    required this.partOfSpeech,
    required this.definitions,
  });

  Meaning.fromJson(Map<String, dynamic> json)
      : partOfSpeech = json["partOfSpeech"],
        definitions = (json["definitions"] as List<Map<String, dynamic>>)
            .map(Definition.fromJson)
            .toList();
  String partOfSpeech;
  List<Definition> definitions;
}

class Definition {
  Definition({
    required this.definition,
    required this.synonyms,
    required this.antonyms,
    required this.example,
  });

  Definition.fromJson(Map<String, dynamic> json)
      : definition = json["definition"],
        synonyms = json["synonyms"].cast<String>(),
        antonyms = json["antonyms"].cast<String>(),
        example = json["example"] ?? "";

  String definition;
  List<String> synonyms;
  List<String> antonyms;
  String example;
}
