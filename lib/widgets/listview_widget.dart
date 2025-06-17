import 'package:flutter/material.dart';

class ListviewWidget extends StatefulWidget {
  const ListviewWidget({super.key});

  @override
  State<ListviewWidget> createState() => _ListviewWidgetState();
}

class _ListviewWidgetState extends State<ListviewWidget> {
  late final List<String> items;

  @override
  void initState() {
    items = List.generate(1000, (i) => 'Item $i');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(items[index]),
          // Add a key to the Text widget for each item. This makes
          // it possible to look for a particular item in the list
          // and verify that the text is correct
          key: Key('item_${index}_text'),
        );
      },
    );
  }
}
