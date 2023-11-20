import 'package:flutter/material.dart';

import 'grid_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        floatingActionButton: Builder(builder: (context) {
          return FloatingActionButton(
              child: const Icon(Icons.mouse), // 그리드뷰 보기
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const GridPage()));
              });
        }),
        body: CustomScrollView(
          slivers: [
            const SliverAppBar(
              pinned: true,
              expandedHeight: 250.0,
              flexibleSpace: FlexibleSpaceBar(
                title: Text('Demo'),
              ),
            ),
            SliverGrid(
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200.0, //한개 grid의 가로방향길이
                mainAxisSpacing: 10.0,
                crossAxisSpacing: 10.0,
                childAspectRatio: 4.0,
              ),
              delegate: SliverChildBuilderDelegate(
                childCount: 20,
                (BuildContext context, int index) {
                  return Container(
                    alignment: Alignment.center,
                    color: Colors.teal[100 * (index % 9)],
                    child: Text('Grid Item $index'),
                  );
                },
              ),
            ),
            SliverFixedExtentList(
              itemExtent: 50.0, //세로방향길이, 그리드가 아니니 한개의 cell
              delegate: SliverChildBuilderDelegate(
                childCount: 10,
                (BuildContext context, int index) {
                  return Container(
                    alignment: Alignment.center,
                    color: Colors.lightBlue[100 * (index % 9)],
                    child: Text('List Item $index'),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
