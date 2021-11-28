import 'package:flutter/material.dart';
import 'package:gram_clone/models/catalog.dart';
import 'package:gram_clone/pages/widgets/item_widget.dart';

import 'package:gram_clone/pages/widgets/widgets.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final dummyList = List.generate(20, (index) => CatalogModel.items[0]);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "AzvernGram",
        ),
      ),
      body: ListView.builder(
          itemCount: dummyList.length,
          itemBuilder: (context, index) {
            return ItemWidget(
              item: dummyList[index],
            );
          }),
      drawer: MyDrawer(),
    );
  }
}
