import 'package:flutter/material.dart';
import 'package:flutter_application_1/aois/apis.dart'; // Import your API file

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _controller = TextEditingController();
  final List<Map<String, String>> _messages = [];
  bool _isTyping = false;

  Future<void> sendMessage(String message) async {
    setState(() {
      _messages.add({"role": "user", "content": message});
      _isTyping = true;
    });

    _controller.clear();

    // Fetch response from API
    try {
      String aiResponse = await APIs.getAnswer(message);

      setState(() {
        _messages.add({"role": "ai", "content": aiResponse});
        _isTyping = false;
      });
    } catch (e) {
      setState(() {
        _messages.add({"role": "ai", "content": "Error fetching response."});
        _isTyping = false;
      });
    }
  }

  Widget _buildMessage(String text, bool isUser) {
    return Align(
      alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        padding: EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: isUser ? Colors.blueAccent : Colors.grey[300],
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
            bottomLeft: isUser ? Radius.circular(16) : Radius.zero,
            bottomRight: isUser ? Radius.zero : Radius.circular(16),
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: isUser ? Colors.white : Colors.black87,
            fontSize: 16,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF6F8FA),
      appBar: AppBar(
        title: Text("AI ChatBot",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.blueAccent, Colors.purpleAccent],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _messages.length,
              padding: EdgeInsets.symmetric(vertical: 10),
              itemBuilder: (context, index) {
                final message = _messages[index];
                return _buildMessage(
                    message["content"]!, message["role"] == "user");
              },
            ),
          ),
          if (_isTyping)
            Padding(
              padding: EdgeInsets.only(left: 12, bottom: 8),
              child: Row(
                children: [
                  CircularProgressIndicator(strokeWidth: 2),
                  SizedBox(width: 10),
                  Text("AI is typing...",
                      style: TextStyle(fontSize: 14, color: Colors.black54)),
                ],
              ),
            ),
          Padding(
            padding: EdgeInsets.all(12),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(24),
                      boxShadow: [
                        BoxShadow(color: Colors.black12, blurRadius: 4),
                      ],
                    ),
                    child: TextField(
                      controller: _controller,
                      decoration: InputDecoration(
                        hintText: "Type a message...",
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                        border: InputBorder.none,
                      ),
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                GestureDetector(
                  onTap: () {
                    if (_controller.text.isNotEmpty) {
                      sendMessage(_controller.text);
                    }
                  },
                  child: Container(
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.blueAccent,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(color: Colors.black12, blurRadius: 4),
                      ],
                    ),
                    child: Icon(Icons.send, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
