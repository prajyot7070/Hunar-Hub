import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:jaya_s_application3/core/utils/image_constant.dart';
import 'package:jaya_s_application3/core/utils/size_utils.dart';
import 'package:jaya_s_application3/presentation/worker_settings_page/worker_settings_page.dart';
import 'package:jaya_s_application3/theme/theme_helper.dart';
import 'package:jaya_s_application3/widgets/custom_icon_button.dart';
import 'package:jaya_s_application3/widgets/custom_image_view.dart';
import 'package:jaya_s_application3/widgets/custom_rating_bar.dart';
import '../my_profile_screen/my_profile_screen.dart';

class WorkerLearnerPage extends StatefulWidget {
  const WorkerLearnerPage({Key? key}) : super(key: key);

  @override
  _WorkerLearnerPageState createState() => _WorkerLearnerPageState();
}

class _WorkerLearnerPageState extends State<WorkerLearnerPage> {
  TextEditingController _questionController = TextEditingController();
  String _response = '';

  List<Map<String, String>> messages = [];
  final String OpenAiKey =
      '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'; // Changed to final instead of const

  Future<String> chatGPTAPI(String prompt) async {
    messages.add({
      'role': 'user',
      'content': prompt,
    });
    try {
      final res = await http.post(
        Uri.parse('https://api.openai.com/v1/chat/completions'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $OpenAiKey',
        },
        body: jsonEncode({
          "model": "gpt-3.5-turbo",
          "messages": messages,
        }),
      );

      if (res.statusCode == 200) {
        String content =
            jsonDecode(res.body)['choices'][0]['message']['content'];
        content = content.trim();

        messages.add({
          'role': 'assistant',
          'content': content,
        });
        return content;
      }
      return 'An internal error occurred';
    } catch (e) {
      return e.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Worker Learner Page'),
      ),
      bottomNavigationBar: _buildBottomBar(context),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _questionController,
              decoration: InputDecoration(
                hintText: 'Type your question here...',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              _sendQuestionToChatGPT();
            },
            child: Text('Search'),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: messages.length,
              itemBuilder: (BuildContext context, int index) {
                final message = messages[index];
                return ListTile(
                  title: Text(message['content']!),
                  subtitle: Text(message['role']!),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void _sendQuestionToChatGPT() async {
    String question = _questionController.text.trim();
    if (question.isNotEmpty) {
      try {
        String response = await chatGPTAPI(question);
        setState(() {
          _response = response;
        });
      } catch (e) {
        print('Error sending question to ChatGPT: $e');
      }
    }
  }

  @override
  void dispose() {
    _questionController.dispose();
    super.dispose();
  }

  Widget _buildBottomBar(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: theme.colorScheme.errorContainer.withOpacity(1),
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(30.h),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.fromLTRB(32.h, 7.v, 40.h, 7.v),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildBottomBarButton(
              context,
              ImageConstant.imgCalculator,
              () {},
              isActive: true,
            ),
            _buildBottomBarButton(
              context,
              ImageConstant.imgLock,
              () {
                // Navigate to settings page
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyProfileScreen()),
                );
              },
            ),
            _buildBottomBarButton(
              context,
              ImageConstant.imgCheckmark,
              () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => WorkerSettingsPage()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomBarButton(
    BuildContext context,
    String imagePath,
    VoidCallback onPressed, {
    bool isActive = false,
  }) {
    return InkWell(
      onTap: onPressed,
      child: CustomImageView(
        imagePath: imagePath,
        color: isActive ? Colors.purple : null,
      ),
    );
  }
}
