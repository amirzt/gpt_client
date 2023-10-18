import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:gpt/core/colors.dart';
import 'package:gpt/data/models/conversation_model.dart';
import 'package:gpt/module/chat/chat_page.dart';

class ChatItemWidget extends StatelessWidget {
  final Conversation conversation;

  const ChatItemWidget(this.conversation, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          color: GlobalColors.thirdBackgroundColor,
          border: Border.all(color: GlobalColors.borderColor, width: 1),
        ),
        child: InkWell(
          child:Padding(
              padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  Flexible(flex: 5,
                    child: Column(
                      children: [
                        Text(conversation.summary,
                            style: TextStyle(
                                color: GlobalColors.whiteTextColor,
                                fontSize: 16,
                                fontWeight: FontWeight.bold)),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(conversation.lastMessage,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: GlobalColors.whiteTextColor,
                                fontSize: 16,
                                fontWeight: FontWeight.normal)),
                        Text(conversation.createdDate,
                            style: TextStyle(
                                color: GlobalColors.fadeTextColor,
                                fontSize: 16,
                                fontWeight: FontWeight.normal))
                      ],
                    ),),
                  Flexible(
                      flex: 1,
                      child: Icon(
                        FontAwesomeIcons.chevronRight,
                        color: GlobalColors.whiteTextColor,
                        size: 20,
                      ))
                ],
              )),
          onTap: (){
            Get.to(const ChatPage());
          },
        ));
  }
}
