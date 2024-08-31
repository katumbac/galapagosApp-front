import 'package:flutter/material.dart';

class ItemSelection extends StatefulWidget {
  final String title;
  final List<String> items;
  final ValueChanged<String> onSelected;

  const ItemSelection(
      {super.key, required this.title, required this.items, required this.onSelected});

  @override
  State<ItemSelection> createState() => _ItemSelectionState();
}

class _ItemSelectionState extends State<ItemSelection> {
  late String title;

  @override
  void initState() {
    super.initState();
    title = widget.title;
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
        title: Text(title),
        trailing: PopupMenuButton<String>(
            itemBuilder: (context) => widget.items.map((item) {
                  return PopupMenuItem<String>(
                      value: item,
                      child: Text(
                        item,
                        style: const TextStyle(color: Colors.black),
                      ),
                  );
            }
            ).toList(),
            onSelected: (String newItem) {
              setState(() {
                title = newItem;
              });
              widget.onSelected(newItem);
            }));
  }
}
