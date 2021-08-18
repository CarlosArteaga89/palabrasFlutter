import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Palabras',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: RandomWords()
    );
  }
}

class RandomWords extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return RandomWordsState();
  }
}

class RandomWordsState extends State<RandomWords> {
  final _palabras = <WordPair>[];
  @override
  Widget build(BuildContext context) {
    final wordPair = new WordPair.random();
    return Scaffold(
            appBar: AppBar(
              title: const Text('Palabras'),
            ),
            body: _buildPalabras()
        );
  }

  Widget _buildPalabras() {
    return ListView.builder(
      itemBuilder: (context, i) {
        if (i >= _palabras.length) {
          _palabras.addAll(generateWordPairs().take(10));
        }
        return _buildRow(_palabras[i]);
      },
    );
  }

  Widget _buildRow(WordPair pair) {
    return ListTile(
      title: Text(pair.asPascalCase),
    );
  }
}
