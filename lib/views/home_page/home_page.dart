import 'package:flutter/material.dart';
import 'package:test_idtmessaging/viewmodels/conversation_viewmodel.dart';
import 'package:provider/provider.dart';

import 'conversation_card.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var viewModel = Provider.of<ConversationViewModel>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
      ),
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
            return Text("${snapshot.error}");
          }
          // By default, show a loading spinner.
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
