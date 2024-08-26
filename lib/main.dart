import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MyCoffee',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: Color(0x3AFF96D3),
      ),
      home: CoffeeNteaApp(),
    );
  }
}

class CoffeeNteaApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text('MyCoffee'),
          bottom: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.home), text: "Home"),
              Tab(icon: Icon(Icons.list), text: "Coffees"),
              Tab(icon: Icon(Icons.settings), text: "Settings"),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Center(child: Text("Welcome to MyCoffee!")),
            CatListScreen(),
            Center(child: Text("Settings Page")),
          ],
        ),
      ),
    );
  }
}

class CatListScreen extends StatefulWidget {
  @override
  _CatListScreenState createState() => _CatListScreenState();
}

class _CatListScreenState extends State<CatListScreen> {
  final List<Map<String, dynamic>> coffees = [
    {"name": "섬세한", "description": "고급진", "image": "assets/coffee01.jpg", "isLiked": false},
    {"name": "에스프레소", "description": "따뜻한", "image": "assets/coffee02.jpg", "isLiked": false},
    {"name": "수프리모", "description": "클래식", "image": "assets/coffee03.png", "isLiked": false},
    {"name": "홍차", "description": "영국왕실티", "image": "assets/coffee04.jpg", "isLiked": false},
    {"name": "꽃차", "description": "캐모마일", "image": "assets/coffee05.jpg", "isLiked": false},
  ];

  void toggleLike(int index) {
    setState(() {
      coffees[index]["isLiked"] = !coffees[index]["isLiked"];
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: coffees.length,
      itemBuilder: (context, index) {
        return Card(
          margin: EdgeInsets.all(8.0),
          child: ListTile(
            leading: Image.asset(coffees[index]["image"], width: 50, height: 50, fit: BoxFit.cover),
            title: Text('${index + 1}. ${coffees[index]["name"]}', style: TextStyle(color: Colors.purple)),
            subtitle: Text(coffees[index]["description"]),
            trailing: IconButton(
              icon: Icon(
                coffees[index]["isLiked"] ? Icons.favorite : Icons.favorite_border,
                color: Colors.red,
              ),
              onPressed: () => toggleLike(index),
            ),
          ),
        );
      },
    );
  }
}