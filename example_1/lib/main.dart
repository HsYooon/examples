import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'cart_page.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => CartModel(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: const MyHomePage(title: 'EXAMPLE-1'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final cart = CartModel();
  final list = [];
  @override
  void initState() {
    list.add(Item("Red", Colors.red.shade600));
    list.add(Item("Orange", Colors.orange));
    list.add(Item("Blue", Colors.blue));
    list.add(Item("Indigo", Colors.indigo));
    list.add(Item("Green", Colors.greenAccent));
    list.add(Item("Purple", Colors.purple));
    super.initState();
  }

  void onPressed(Item item) {
    cart.add(item);
    print(cart.items.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          toolbarHeight: 70,
          centerTitle: true,
          elevation: 0.0,
          actions: [
            IconButton(
              icon: const Icon(Icons.shopping_cart),
              tooltip: 'cart',
              onPressed: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => const CartPage(),
                  ),
                )
              },
            ),
          ],
        ),
        body: ListView.builder(
          itemCount: list.length,
          itemBuilder: (BuildContext ctx, int idx) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                children: [
                  Container(
                    width: 70,
                    height: 70,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.blueGrey.shade50, width: 7),
                      borderRadius: BorderRadius.circular(20),
                      color: list[idx].color,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Text(
                      list[idx].name,
                      style: const TextStyle(fontSize: 20),
                    ),
                  ),
                  const Spacer(),
                  TextButton(
                    onPressed: () => onPressed(list[idx]),
                    child: const Icon(
                      Icons.add,
                      color: Colors.black54,
                    ),
                  )
                ],
              ),
            );
          },
        ) // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}

class Item {
  Item(this.name, this.color);
  Color color;
  String name;
}

class CartModel extends ChangeNotifier {
  final List<Item> _list = [];
  get items => UnmodifiableListView(_list);
  void add(Item item) {
    _list.add(item);
    notifyListeners();
  }

  void removeAll() {
    _list.clear();
    notifyListeners();
  }
}
