import 'package:flutter/material.dart';
import 'package:flutter_tawk/flutter_tawk.dart';

class ChatTawk extends StatefulWidget {
  const ChatTawk({Key? key}) : super(key: key);

  @override
  State<ChatTawk> createState() => _ChatTawkState();
}

class _ChatTawkState extends State<ChatTawk> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Live Chat',style: TextStyle(color: Colors.black),),backgroundColor: Colors.white,),
      body: Tawk(
        directChatLink:
            'https://tawk.to/chat/634ff264b0d6371309ca5cce/1gfo4lml5',
        visitor: TawkVisitor(
          name: '',
          email: '',
        ),
        onLoad: () {
          print('Hello Tawk!');
        },
        onLinkTap: (String url) {
          print(url);
        },
        placeholder: const Center(
          child: Text('Loading...'),
        ),
      ),
    );
  }
}
