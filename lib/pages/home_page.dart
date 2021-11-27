import 'package:flutter/material.dart';
import 'package:gram_clone/pages/widgets/widgets.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "AzvernGram",
        ),
      ),
      body: Center(
        child: Container(
          child: Text("welcome to flutter"),
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}
