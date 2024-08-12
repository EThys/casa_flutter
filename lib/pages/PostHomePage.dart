import 'package:flutter/material.dart';

class PostHomePage extends StatefulWidget {
  const PostHomePage({super.key});

  @override
  State<PostHomePage> createState() => _PostHomePageState();
}

class _PostHomePageState extends State<PostHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:Center(
            child:Text("Publier",style:TextStyle(fontSize: 20))
        )
    );
  }
}
