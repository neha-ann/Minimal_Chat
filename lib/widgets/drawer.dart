import 'package:flutter/material.dart';
import 'package:minimal_chat/pages/settings.dart';
import 'package:minimal_chat/services/auth/auth_services.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key});

  void logout() {
    final _auth = AuthService();
    _auth.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: const EdgeInsets.only(top: 100.0),
        child: Column(
          children: [
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('H O M E'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('S E T T I N G S'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Settings()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('L O G O U T'),
              onTap: logout,
            ),
          ],
        ),
      ),
    );
  }
}
