import 'package:audit_mobile/services/message_service.dart';
import 'package:audit_mobile/theme.dart';
import 'package:audit_mobile/widgets/chat_bubble.dart';
import 'package:flutter/material.dart';

class DetailChatPage extends StatefulWidget {
  @override
  State<DetailChatPage> createState() => _DetailChatPageState();
}

class _DetailChatPageState extends State<DetailChatPage> {
  TextEditingController messageController = TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    handleAddMessage() async {
      await MessageService().addMessage(
        message: messageController.text,
        isFromUser: true
      );
      setState(() {
        messageController.text = '';
      });
    }

    PreferredSizeWidget header() {
      return PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppBar(
          backgroundColor: backgroundColor1,
          centerTitle: false,
          title: Row(
            children: [
              SizedBox(
                width: 12,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Name',
                    style: primaryTextStyle.copyWith(
                      fontWeight: medium,
                    ),
                  ),
                  Text(
                    'Online',
                    style: secondaryTextStyle.copyWith(
                      fontWeight: light,
                      fontSize: 14,
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      );
    }

    Widget content() {
      return ListView(
        padding: EdgeInsets.symmetric(
          horizontal: defaultMargin,
        ),
        children: [
          ChatBubble(
            isSender: true,
            text: 'test',
          ),
          ChatBubble(
            isSender: false,
            text: 'test',
          ),
        ],
      );
    }

    Widget chatInput() {
      return Container(
        margin: EdgeInsets.all(20),
        child: Row(
          children: [
            Expanded(
              child: Container(
                height: 45,
                padding: EdgeInsets.symmetric(
                  horizontal: 16,
                ),
                decoration: BoxDecoration(
                  color: backgroundColor4,
                ),
                child: Center(
                  child: TextFormField(
                    controller: messageController,
                    style: primaryTextStyle,
                    decoration: InputDecoration(
                      hintText: 'Type Your Message',
                      hintStyle: subtitleTextStyle,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 20,
            ),
            GestureDetector(
              onTap: handleAddMessage,
              child: Image.asset(
                'assets/icon_send.png',
                width: 45,
                color: primaryColor,
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor3,
      appBar: header(),
      body: content(),
      bottomNavigationBar: chatInput(),
    );
  }
}
