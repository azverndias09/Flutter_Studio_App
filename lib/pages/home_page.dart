import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gram_clone/core/store.dart';
import 'package:gram_clone/models/cart.dart';

import 'package:gram_clone/utils/routes.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:gram_clone/models/catalog.dart';

import 'widgets/home_widgets/catalog_header.dart';
import 'widgets/home_widgets/catalog_list.dart';

import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final url = "https://api.jsonbin.io/b/604dbddb683e7e079c4eefd3";

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(const Duration(seconds: 2));

    // final response = await http.get(Uri.parse(url));
    // final catalogJson = response.body;

    final catalogJson =
        await rootBundle.loadString("assets/files/catalogs.json");
    final decodedData = jsonDecode(catalogJson);
    var productsData = decodedData["products"];
    CatalogModel.items = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final _cart = (VxState.store as MyStore).cart;
    return Scaffold(
        backgroundColor: context.canvasColor,
        floatingActionButton: VxBuilder(
          builder: (context, _, __) => FloatingActionButton(
            backgroundColor: context.theme.buttonColor,
            onPressed: () => Navigator.pushNamed(context, MyRoutes.cartRoute),
            child: const Icon(CupertinoIcons.cart, color: Colors.white),
          ).badge(
            color: Vx.red500,
            size: 22,
            count: _cart.items.length,
            textStyle: const TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold),
          ),
          mutations: const {AddMutation, RemoveMutation},
        ),
        body: SafeArea(
          bottom: false,
          child: Container(
            padding: Vx.mOnly(top: 32, left: 32, right: 32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CatalogHeader(),
                if (CatalogModel.items != null &&
                    CatalogModel.items!.isNotEmpty)
                  CatalogList().py16().expand()
                else
                  const Center(
                    child: CircularProgressIndicator(),
                  )
              ],
            ),
          ),
        ));
  }
}
