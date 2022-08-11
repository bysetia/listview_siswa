import 'package:flutter/material.dart';
import 'list_siswa.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TabBarDemo(),
    );
  }
}

class TabBarDemo extends StatefulWidget {
  @override
  _TabBarDemoState createState() => _TabBarDemoState();
}

class _TabBarDemoState extends State<TabBarDemo>
    with SingleTickerProviderStateMixin {
  late TabController _controller;
  int _selectedIndex = 0;

  List<Widget> list = [
    Tab(icon: Text('Chat')),
    Tab(icon: Text('Status')),
    Tab(icon: Text('Panggilan')),
  ];

  @override
  void initState() {
    super.initState();

    _controller = TabController(length: list.length, vsync: this);

    _controller.addListener(() {
      setState(() {
        _selectedIndex = _controller.index;
      });
      print("Selected Index: " + _controller.index.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            onTap: (index) {
              // Should not used it as it only called when tab options are clicked,
              // not when user swapped
            },
            controller: _controller,
            tabs: list,
          ),
          title: Text('List Daftar Siswa'),
        ),
        body: TabBarView(
          controller: _controller,
          children: [
            ListSiswa(),
            Center(
                child: Text(
              _selectedIndex.toString(),
              style: TextStyle(fontSize: 40),
            )),
            Center(
                child: Text(
              _selectedIndex.toString(),
              style: TextStyle(fontSize: 40),
            )),
          ],
        ),
      ),
    );
  }
}
