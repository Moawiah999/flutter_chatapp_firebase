import 'package:flutter/material.dart';
import 'package:mychatapp/constant/constant.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mychatapp/models/messages.dart';
import '../widget/chat_buble.dart';

class ChatScreen extends StatefulWidget {
  ChatScreen({super.key});
  static String id = "ChateScreen";

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final _controller = ScrollController();
  TextEditingController messageController = TextEditingController();
  CollectionReference messages =
      FirebaseFirestore.instance.collection(KMessagescollection);
  @override
  Widget build(BuildContext context) {
    var emailarguments = ModalRoute.of(context)!.settings.arguments;
    return StreamBuilder<QuerySnapshot>(
      stream: messages.orderBy(kCreatedAt, descending: true).snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<Message> messagelist = [];
          for (int i = 0; i < snapshot.data!.docs.length; i++) {
            messagelist.add(Message.fromJson(snapshot.data!.docs[i]));
            // print("@@@@@@@@@@@@@@@@@@@");
            // print(snapshot.data!.docs[i]["message"]);
          }
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Text("chate"),
              automaticallyImplyLeading: false,
              backgroundColor: KPrimaryColor,
            ),
            body: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    reverse: true,
                    controller: _controller,
                    itemCount: messagelist.length,
                    itemBuilder: (context, index) {
                      return messagelist[index].id == emailarguments
                          ? ChatBuble(
                              message: messagelist[index],
                            )
                          : ChatBubleforfriend(message: messagelist[index]);
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: TextField(
                    controller: messageController,
                    onSubmitted: (data) {
                      messages.add({
                        "message": messageController.text,
                        kCreatedAt: DateTime.now(),
                        "id": emailarguments
                      });
                      messageController.clear();
                      _controller.animateTo(
                          // _controller.position.maxScrollExtent,
                          0,
                          duration: Duration(seconds: 1),
                          curve: Curves.fastOutSlowIn);
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide(color: KPrimaryColor),
                      ),
                      hintText: "Write A Message",
                      suffixIcon: IconButton(
                        icon: Icon(Icons.send),
                        onPressed: () {
                          messages.add(
                            {
                              "message": messageController.text,
                              kCreatedAt: DateTime.now(),
                              // "id": emailarguments
                            },
                          );
                          messageController.clear();
                          _controller.animateTo(
                              _controller.position.maxScrollExtent,
                              duration: Duration(seconds: 1),
                              curve: Curves.fastOutSlowIn);
                        },
                        color: KPrimaryColor,
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide(color: KPrimaryColor),
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
        } else {
          return Text("data");
        }
      },
    );
  }
}
