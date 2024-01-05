import 'package:firebase_loginsystem/utils/firebase_helper.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Home Screen"),
          actions: [
            IconButton(onPressed: () async {
              await FirebaseHelper.helper.firebaseLogout();
            }, icon: Icon(Icons.logout),),
          ],
        ),
        body: Column(
          children: [],
        ),
      ),
    );
  }
}
