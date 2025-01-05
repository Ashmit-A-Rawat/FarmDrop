import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class Message {
  final String sender;
  final String location;
  final String content;
  final List<String> replies;

  Message({
    required this.sender,
    required this.location,
    required this.content,
    List<String>? replies,
  }) : replies = replies ?? [];

  void addReply(String reply) {
    replies.add(reply);
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Messaging System',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MessageListPage(),
    );
  }
}

class MessageListPage extends StatelessWidget {
  final List<Message> messages = [
    Message(sender: 'Farmer A', location: 'Pune', content: 'आम्ही उद्या ठरलेल्या ठिकाणी भेटू.'),
    Message(sender: 'Farmer B', location: 'Nagpur', content: 'Offer too low, increase price.'),
    Message(sender: 'Farmer C', location: 'Mumbai', content: 'ठीक आहे. नंतर सांगतो.'),
    Message(sender: 'Farmer D', location: 'Aurangabad', content: 'Money received.'),
    Message(sender: 'Farmer E', location: 'Nashik', content: 'Please confirm the delivery date.'),
  ];

  @override
  Widget build(BuildContext context) {
    // Sorting messages based on content may not be ideal. Consider using timestamps for sorting.
    final sortedMessages = List<Message>.from(messages)
      ..sort((a, b) => b.content.compareTo(a.content)); // Change this to sort by timestamp if available

    return Scaffold(
      appBar: AppBar(
        title: Text('Messages'),
      ),
      body: ListView.builder(
        itemCount: sortedMessages.length,
        itemBuilder: (context, index) {
          final message = sortedMessages[index];
          return ListTile(
            contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            leading: CircleAvatar(
              backgroundColor: Colors.blueGrey,
              child: Text(message.sender[0]),
            ),
            title: Text(
              message.sender,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(message.location, style: Theme.of(context).textTheme.bodySmall),
            trailing: SizedBox(
              width: 200,
              child: Text(
                message.content,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.grey[700]),
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ChatDetailPage(message: message),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class ChatDetailPage extends StatefulWidget {
  final Message message;

  ChatDetailPage({required this.message});

  @override
  _ChatDetailPageState createState() => _ChatDetailPageState();
}

class _ChatDetailPageState extends State<ChatDetailPage> {
  final TextEditingController _replyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat with ${widget.message.sender}'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(16.0),
              itemCount: widget.message.replies.length + 1,
              itemBuilder: (context, index) {
                if (index == 0) {
                  // Display the original message
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Container(
                        padding: EdgeInsets.all(12.0),
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Text(
                          widget.message.content,
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                      ),
                    ),
                  );
                }
                // Display replies
                final reply = widget.message.replies[index - 1];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      padding: EdgeInsets.all(12.0),
                      decoration: BoxDecoration(
                        color: Colors.blue[100],
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Text(
                        reply,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _replyController,
                    decoration: InputDecoration(
                      hintText: 'Write a reply...',
                      border: OutlineInputBorder(),
                      contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    if (_replyController.text.isNotEmpty) {
                      setState(() {
                        widget.message.addReply(_replyController.text);
                        _replyController.clear();
                      });
                    }
                  },
                  child: Text('Send'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
