import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:gpt/core/colors.dart';
import 'package:gpt/data/models/conversation_model.dart';
import 'package:gpt/module/chat/chat_page.dart';
import 'package:gpt/services/locale_services.dart';
import 'dart:ui' as ui;
class ChatItemWidget extends StatelessWidget {
  final Conversation conversation;

  const ChatItemWidget(this.conversation, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
      child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            color: GlobalColors.secondBackgroundColor,
            // border: Border.all(color: GlobalColors.borderColor, width: 1),
          ),
          child: InkWell(
            child: Padding(
                padding: const EdgeInsets.all(15),
                child: Row(
                  children: [
                    Icon(
                      FontAwesomeIcons.chevronRight,
                      color: GlobalColors.whiteTextColor,
                      size: 20,
                    ),
                    // const Spacer(),
                    Expanded(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(conversation.summary,
                            softWrap: true,
                            textDirection: LocaleServices()
                                .detectTextDirection(conversation.lastMessage),
                            style: TextStyle(
                                color: GlobalColors.whiteTextColor,
                                fontSize: 16,
                                fontWeight: FontWeight.bold)),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(conversation.lastMessage,
                            maxLines: 3,
                            softWrap: true,
                            textDirection: LocaleServices()
                                .detectTextDirection(conversation.lastMessage),
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: GlobalColors.whiteTextColor,
                                fontSize: 14,
                                fontWeight: FontWeight.normal)),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(getDate(conversation.createdDate),
                            textDirection: ui.TextDirection.ltr,
                            style: TextStyle(
                                color: GlobalColors.fadeTextColor,
                                fontSize: 16,
                                fontWeight: FontWeight.normal))
                      ],
                    ))
                  ],
                )),
            onTap: () {
              Get.to(ChatPage(conversation.id, false));
            },
          )),
    );
  }

  String getDate(String createdDate) {
    DateTime dateTime = DateTime.parse(createdDate);
    return "${dateTime.year}-${dateTime.month}-${dateTime.day} ${dateTime.hour}:${dateTime.minute}";
  }
}
