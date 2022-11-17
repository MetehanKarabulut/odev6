import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ListShow(),
    );
  }

}

class ListShow extends StatelessWidget{
  const ListShow({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: const RandomWord(),

    );
  }
}

class RandomWord extends StatefulWidget {
  const RandomWord({super.key});


  @override
  State<StatefulWidget> createState() => _randomWordState();
}

class _randomWordState extends State<RandomWord>{
  final _temp = <WordPair>[];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      itemBuilder: (context, i) {
        if (i.isOdd) return const Divider();

        final index = i ~/ 2;
        if (index >= _temp.length) {
          _temp.addAll(generateWordPairs().take(10));
        }
        return ListTile(
          title: Text(
            _temp[index].asPascalCase,
            style: const TextStyle(fontSize: 20),
          ),
        );
      },
    );
  }
}