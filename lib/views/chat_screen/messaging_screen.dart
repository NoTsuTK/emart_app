import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emart_app/consts/consts.dart';
import 'package:emart_app/services/firestore_service.dart';
import 'package:emart_app/views/chat_screen/chat_screen.dart';
import 'package:emart_app/widget_common/loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MessageScreen extends StatelessWidget {
  const MessageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
          title: "My messages"
              .text
              .color(darkFontGrey)
              .fontFamily(semibold)
              .make()),
      body: StreamBuilder(
        stream: FirestoreService.getAllMesssages(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: loadingIndicator(),
            );
          } else if (snapshot.data!.docs.isEmpty) {
            return "No messages yet!".text.color(darkFontGrey).makeCentered();
          } else {
            var data = snapshot.data!.docs;
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: data.length,
                      itemBuilder: (context, index) {
                        return Card(
                          child: ListTile(
                            onTap: () {
                              Get.to(() => const ChatScreen(), arguments: [
                                data[index]['friend_name'],
                                data[index]['toId']
                              ]);
                            },
                            leading: const CircleAvatar(
                              backgroundColor: pinkColor,
                              child: Icon(Icons.person, color: whiteColor),
                            ),
                            title: "${data[index]['friend_name']}"
                                .text
                                .fontFamily(semibold)
                                .color(darkFontGrey)
                                .make(),
                            subtitle: "${data[index]['friend_name']}"
                                .text
                                .fontFamily(semibold)
                                .color(darkFontGrey)
                                .make(),
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
