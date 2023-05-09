import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_catalog/core/store.dart';
import 'package:flutter_catalog/models/catalog.dart';
import 'package:flutter_catalog/utils/routes.dart';
import 'package:flutter_catalog/widgets/themes.dart';
import 'dart:convert';
import 'package:velocity_x/velocity_x.dart';
import '../widgets/home_widgets/catalog_header.dart';
import '../widgets/home_widgets/catalog_list.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final int days = 30;
  final String name = "Codepur";

  final url = "https://api.jsonbin.io/b/604dbddb683e7e079c4eefd3";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 2));
    final catalogJson =
        await rootBundle.loadString("assets/files/catalog.json");

    // final response=await http.get(Uri.parse(url));
    // final catalogJson=response.body;
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
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.pushNamed(context, MyRoutes.cartRoute);
        },
        backgroundColor: MyTheme.darkBluishColor,
        child: Icon(CupertinoIcons.cart),
      ).badge(
          color: Vx.red500,
          size: 20,
          count: _cart.items.length,
          textStyle: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          )
      ),

      // floatingActionButton: VxBuilder(
      //   mutations: {AddMutation, RemoveMutation},
      //   builder: (ctx, _) => FloatingActionButton(
      //     onPressed: () => Navigator.pushNamed(context, MyRoutes.cartRoute),
      //     backgroundColor: MyTheme.darkBluishColor,
      //     child: Icon(CupertinoIcons.cart),
      //   ).badge(
      //       color: Vx.red500,
      //       size: 20,
      //       count: _cart.items.length,
      //       textStyle: TextStyle(
      //         color: Colors.black,
      //         fontWeight: FontWeight.bold,
      //       )),
      // ),
      body: SafeArea(
        child: Container(
            padding: Vx.m32,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CatalogHeader(),
                if (CatalogModel.items != null && CatalogModel.items.isNotEmpty)
                  CatalogList().py16().expand()
                else
                  Center(
                    child: CircularProgressIndicator().centered().expand(),
                  )
              ],
            )),
      ),
    );
  }
}
