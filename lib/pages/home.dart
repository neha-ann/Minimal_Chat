import 'package:flutter/material.dart';
import 'package:minimal_chat/pages/chat_Page.dart';
import 'package:minimal_chat/services/auth/auth_services.dart';
import 'package:minimal_chat/services/chat/chat_services.dart';
import 'package:minimal_chat/widgets/drawer.dart';
import 'package:minimal_chat/widgets/userTile.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  final ChatServices _chatService = ChatServices();
  final AuthService _authService = AuthService();

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        backgroundColor: const Color.fromARGB(255, 221, 221, 221),
      ),
      drawer: const MyDrawer(),
      body: _buildUserList(),
    );
  }

  Widget _buildUserList() {
    return StreamBuilder(
      stream: widget._chatService.getUserStream(),
      builder: (context, snapshot) {
        // Error
        if (snapshot.hasError) {
          return const Text("Error");
        }

        // Waiting
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Text("Waiting");
        }

        // Return list view
        return ListView(
          children: snapshot.data!.map<Widget>((userData) {
            return _buildUserListItem(userData,
                context); // Assuming you have a function _buildUserListItem to create each item
          }).toList(),
        );
      },
    );
  }

  Widget _buildUserListItem(
      Map<String, dynamic> userData, BuildContext context) {
    //if (userData["email"] != widget._authService.getCurrentUser()!.email) {
    return UserTile(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (_) => ChatPage(
                      receiverEmail: userData["email"],
                      receiverID: userData['uid'],
                    )));
      },
      text: userData["email"],
    );
    //} else {
    // return Container();
    //}
  }
}
