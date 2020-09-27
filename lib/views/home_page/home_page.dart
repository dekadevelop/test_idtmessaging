import 'package:flutter/material.dart';
import 'package:test_idtmessaging/viewmodels/conversation_viewmodel.dart';
import 'package:provider/provider.dart';
import 'package:test_idtmessaging/views/widgets/appbar_background.dart';

import 'conversation_card.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var viewModel = Provider.of<ConversationViewModel>(context, listen: false);
    return Scaffold(
      appBar: _appBar(),
      body: FutureBuilder(
        future: viewModel.getConversations(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var conversations = snapshot.data;
            return ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: conversations.length,
              itemBuilder: (BuildContext context, int index) {
                return ConversationCard(conversations[index]);
              },
            );
          } else if (snapshot.hasError) {
            return Center(child: Text("${snapshot.error}"));
          }
          // By default, show a loading spinner.
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  PreferredSize _appBar() {
    return PreferredSize(
      preferredSize: Size.fromHeight(80.0),
      child: AppBar(
        backgroundColor: Colors.blueGrey,
        centerTitle: true,
        flexibleSpace: AppBarBackGround(),
        title: Padding(
          padding: const EdgeInsets.only(top: 15.0),
          child: Text(
            "Home Page",
            style: TextStyle(
              color: Colors.white,
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
