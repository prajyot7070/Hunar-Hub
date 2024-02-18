import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class OpenAIPage extends StatefulWidget {
  @override
  _OpenAIPageState createState() => _OpenAIPageState();
}

class _OpenAIPageState extends State<OpenAIPage> {
  TextEditingController _promptController = TextEditingController();
  String _response = '';

  Future<void> _sendRequest() async {
    String prompt = _promptController.text;

    var apiKey =
        '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'; // Replace with your OpenAI API key
    var url = 'https://api.openai.com/v1/completions';

    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $apiKey',
    };

    Map<String, dynamic> body = {
      'prompt': prompt,
      'max_tokens': 100,
      'temperature': 0.7,
      'n': 1,
    };

    var response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: jsonEncode(body),
    );

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      setState(() {
        _response = data['choices'][0]['text'];
      });
    } else {
      setState(() {
        _response = 'Error: ${response.statusCode}';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('OpenAI Integration'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _promptController,
              decoration: InputDecoration(
                labelText: 'Enter Prompt',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _sendRequest,
              child: Text('Generate Response'),
            ),
            SizedBox(height: 20),
            Expanded(
              child: SingleChildScrollView(
                child: Text(_response),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
