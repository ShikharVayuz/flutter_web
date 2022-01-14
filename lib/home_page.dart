import "package:flutter/material.dart";
import 'package:flutter_web/ThemeData/theme_data.dart';
import 'package:flutter_web/package_dash.dart';
import 'package:flutter_web/routes.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        backgroundColor: VlccColor.lightOrange,
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              child: Text('Drawer Header'),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              title: Text('Item 1'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Item 2'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.grey[900],
        title: Text(
          "Flutter Web",
          style: TextStyle(color: VlccColor.lightOrange),
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.more_vert),
            onPressed: () {},
          ),
        ],
      ),
      bottomSheet: TabBar(controller: tabController, tabs: const [
        Tab(text: 'Home'),
        Tab(text: 'About'),
        Tab(text: 'Contact'),
      ]),
      body: TabBarView(controller: tabController, children: [
        GridView.builder(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 400, childAspectRatio: 3 / 2),
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: PackageCards(
                    tags: const Icon(
                      Icons.airplane_ticket,
                      size: 30,
                    ),
                    onTap: () {
                      Navigator.pushNamed(context, Routes.viewdetails);
                    },
                    color: Colors.primaries[index]),
              );
            },
            itemCount: 10),
        Container(
          color: VlccColor.primaryTheme,
          child: const Center(
            child: Text(
              'About',
              style: TextStyle(color: Colors.black),
            ),
          ),
        ),
        Container(
          color: VlccColor.primaryTheme,
          child: const Center(
            child: Text(
              'Contact',
              style: TextStyle(color: Colors.black),
            ),
          ),
        ),
      ]),
    );
  }
}
