import 'package:flutter_chat_ui/models/user_model.dart';

class Message {
  final User sendername;
  final String time; // Would usually be type DateTime or Firebase Timestamp in production apps
  final String text;
  final String unread;

  Message({
    required this.sendername,
    required this.time,
    required this.text,
    required this.unread,
  });

  Message fromJson(Map<dynamic, dynamic> json) => Message(
    sendername: sendername, time: time, text: text, unread: unread,
  );

  Map<String, Object> toJson() => {
    sendername.name : sendername,
    time : time,
    text : text,
    unread : unread,
  };
}

// YOU - current user
final User currentUser = User(
  id: 0,
  name: 'Current User',
  imageUrl: 'assets/images/person.png',
);

// USERS
final User vijay = User(
  id: 1,
  name: 'vijay',
  imageUrl: 'assets/images/person.png',
);
final User rahul = User(
  id: 2,
  name: 'rahul',
  imageUrl: 'assets/images/person.png',
);
final User shrey = User(
  id: 3,
  name: 'shrey',
  imageUrl: 'assets/images/person.png',
);
final User vinay = User(
  id: 4,
  name: 'vinay',
  imageUrl: 'assets/images/person.png',
);
final User jaydeep = User(
  id: 5,
  name: 'jaydeep',
  imageUrl: 'assets/images/person.png',
);
final User bhargav = User(
  id: 6,
  name: 'bhargav',
  imageUrl: 'assets/images/person.png',
);
final User jayan = User(
  id: 7,
  name: 'jayan',
  imageUrl: 'assets/images/person.png',
);

// FAVORITE CONTACTS
List<User> favorites = [vijay, rahul, shrey, vinay, jaydeep];

// EXAMPLE CHATS ON HOME SCREEN
List<Message> chats = [
  Message(
    sendername: jaydeep,
    time: '5:30 PM',
    text: 'Hey, how\'s it going? What did you do today?',
    unread: "true",
  ),
  Message(
    sendername: vijay,
    time: '4:30 PM',
    text: 'Hey, how\'s it going? What did you do today?',
    unread: "true",
  ),
  Message(
    sendername: shrey,
    time: '3:30 PM',
    text: 'Hey, how\'s it going? What did you do today?',
    unread: "true",
  ),
  Message(
    sendername: vinay,
    time: '2:30 PM',
    text: 'Hey, how\'s it going? What did you do today?',
    unread: "true",
  ),
  Message(
    sendername: bhargav,
    time: '1:30 PM',
    text: 'Hey, how\'s it going? What did you do today?',
    unread: "true",
  ),
  Message(
    sendername: rahul,
    time: '12:30 PM',
    text: 'Hey, how\'s it going? What did you do today?',
    unread: "true",
  ),
  Message(
    sendername: jayan,
    time: '11:30 AM',
    text: 'Hey, how\'s it going? What did you do today?',
    unread: "true",
  ),
];

// EXAMPLE MESSAGES IN CHAT SCREEN
List<Message> messages = [
  Message(
    sendername: vijay,
    time: '5:30 PM',
    text: 'Hey, how\'s it going? What did you do today?',
    unread: "true",
  ),
  Message(
    sendername: currentUser,
    time: '4:30 PM',
    text: 'Hey, how\'s it going? What did you do today?',
    unread: "true",
  ),
  Message(
    sendername: vijay,
    time: '3:45 PM',
    text: 'Hey, how\'s it going? What did you do today?',
    unread: "true",
  ),
  Message(
    sendername: vijay,
    time: '3:15 PM',
    text: 'Hey, how\'s it going? What did you do today?',
    unread: "true",
  ),
  Message(
    sendername: currentUser,
    time: '2:30 PM',
    text: 'Hey, how\'s it going? What did you do today?',
    unread: "true",
  ),
  Message(
    sendername: vijay,
    time: '2:00 PM',
    text: 'Hey, how\'s it going? What did you do today?',
    unread: "true",
  ),
];


