import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_idtmessaging/viewmodels/conversation_viewmodel.dart';
import 'package:test_idtmessaging/views/home_page.dart';

import 'locator.dart';

void main() {
  setupServices();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'IDT Messaging',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Provider(create: (_) => ConversationViewModel(), child: HomePage()),
    );
  }
}
