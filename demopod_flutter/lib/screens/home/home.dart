import 'package:demopod_flutter/global.dart';
import 'package:flutter/material.dart';
import 'package:demopod_client/demopod_client.dart';
import 'package:flutter/foundation.dart';

class HomePage extends StatefulWidget {
  static const String routeName = '/home';
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // These fields hold the last result or error message that we've received from
  // the server or null if no result exists yet.
  dynamic _resultMessage;
  String? _errorMessage;

  final _textEditingController = TextEditingController();

  Future<void> _getArticleById() async {
    try {
      var res = await client.example
          .getArticleById(int.parse(_textEditingController.text.toString()));
      setState(() {
        _resultMessage = res;
      });
    } catch (e) {
      setState(() {
        _errorMessage = '$e';
      });
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }

  void _addArticle() {
    try {
      client.example.addArticle(Article(
          title: 'Demo title',
          content: 'Demo Content',
          authorName: 'Mellow',
          publishedOn: DateTime.now(),
          isPrime: true));
    } catch (e) {
      setState(() {
        _errorMessage = '$e';
      });
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }

  Future<void> _deleteArticle() async {
    try {
      var res = await client.example
          .deleteArticle(int.parse(_textEditingController.text.toString()));
      setState(() {
        _resultMessage = res;
      });
    } catch (e) {
      setState(() {
        _errorMessage = '$e';
      });
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }

  Future<void> _callHello() async {
    try {
      var res =
          await client.example.hello(_textEditingController.text.toString());
      setState(() {
        _resultMessage = res;
      });
    } catch (e) {
      setState(() {
        _errorMessage = '$e';
      });
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Demo Pod'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: TextField(
                controller: _textEditingController,
                decoration: const InputDecoration(
                  hintText: 'Enter your name',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: ElevatedButton(
                onPressed: _callHello,
                child: const Text('Demo'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: ElevatedButton(
                onPressed: _getArticleById,
                child: const Text('Get Article By ID'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: ElevatedButton(
                onPressed: _addArticle,
                child: const Text('Add Article'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: ElevatedButton(
                onPressed: _deleteArticle,
                child: const Text('Delete Article By ID'),
              ),
            ),
            _ResultDisplay(
              resultMessage: (_resultMessage is Article)
                  ? (_resultMessage as Article).title
                  : _resultMessage.toString(),
              errorMessage: _errorMessage,
            ),
          ],
        ),
      ),
    );
  }
}

// _ResultDisplays shows the result of the call. Either the returned result from
// the `example.hello` endpoint method or an error message.
class _ResultDisplay extends StatelessWidget {
  final String? resultMessage;
  final String? errorMessage;

  const _ResultDisplay({
    this.resultMessage,
    this.errorMessage,
  });

  @override
  Widget build(BuildContext context) {
    String text;
    Color backgroundColor;
    if (errorMessage != null) {
      backgroundColor = Colors.red[300]!;
      text = errorMessage!;
    } else if (resultMessage != null) {
      backgroundColor = Colors.green[300]!;
      text = resultMessage!;
    } else {
      backgroundColor = Colors.grey[300]!;
      text = 'No server response yet.';
    }

    return Container(
      height: 50,
      color: backgroundColor,
      child: Center(
        child: Text(text),
      ),
    );
  }
}
