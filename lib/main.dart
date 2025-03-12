import 'package:flutter/material.dart';
import 'screen/cv_screen.dart';
import 'service/sentiment_service.dart';

void main() {
  runApp(SentimentApp());
}

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'My CV',
//       theme: ThemeData(primarySwatch: Colors.blue),
//       home: CVScreen(), // Điều hướng sang màn hình CV
//     );
//   }
// }

// ===========================
// Sentiment Analysis Feature
// ===========================

class SentimentApp extends StatelessWidget {
  const SentimentApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sentiment Analysis',
      home: SentimentScreen(),
    );
  }
}

class SentimentScreen extends StatefulWidget {
  const SentimentScreen({super.key});

  @override
  _SentimentScreenState createState() => _SentimentScreenState();
}

class _SentimentScreenState extends State<SentimentScreen> {
  final TextEditingController _controller = TextEditingController();
  String _sentiment = "neutral";
  Color _backgroundColor = Colors.white; // Default background
  String _emoji = "😐"; // Neutral emoji

  Future<void> analyzeSentiment() async {
    if (_controller.text.isNotEmpty) {
      String result = await SentimentService.analyzeSentiment(_controller.text);

      setState(() {
        if (result.contains("positive")) {
          _sentiment = "positive";
          _backgroundColor = Colors.green;
          _emoji = "😀"; // Happy emoji
        } else if (result.contains("negative") ||
            _controller.text.contains("not ")) {
          // Detect 'not'
          _sentiment = "negative";
          _backgroundColor = Colors.red;
          _emoji = "☹️"; // Sad emoji
        } else {
          _sentiment = "neutral";
          _backgroundColor = Colors.white;
          _emoji = "😐"; // Neutral emoji
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          _backgroundColor, // Background changes based on sentiment
      appBar: AppBar(title: Text('Sentiment Analysis')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter a sentence',
                filled: true,
                fillColor: Colors.white,
              ),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: analyzeSentiment,
              child: Text('Analyze Sentiment'),
            ),
            SizedBox(height: 20),
            Text(
              _emoji, // Display emoji based on sentiment
              style: TextStyle(fontSize: 50),
            ),
          ],
        ),
      ),
    );
  }
}
