import 'package:flutter/material.dart';

class TopTenList extends StatefulWidget {
  @override
  _TopTenListState createState() => _TopTenListState();
}

class _TopTenListState extends State<TopTenList> {
  List<String> topTenGames = [
    "World of Warcraft",
    "Final Fantasy VII",
    "Animal Crossing",
    "Diablo II",
    "Overwatch",
    "Valorant",
    "Minecraft",
    "Dota 2",
    "Half Life 3",
    "Grand Theft Auto: Vice City"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Top Ten"),
      ),
      body: ReorderableListView(
        onReorder: onReorder,
        children: getListItems(),
      ),
    );
  }

  void onReorder(int oldIndex, int newIndex) {
    if (newIndex > oldIndex) {
      newIndex -= 1;
    }

    setState(() {
      String game = topTenGames[oldIndex];

      topTenGames.removeAt(oldIndex);
      topTenGames.insert(newIndex, game);
    });
  }

  List<ListTile> getListItems() => topTenGames
      .asMap()
      .map((i, item) => MapEntry(i, buildTenableListTile(item, i)))
      .values
      .toList();

  ListTile buildTenableListTile(String item, int index) {
    return ListTile(
      key: ValueKey(item),
      title: Text(item),
      leading: Text("#${index + 1}"),
    );
  }
}
