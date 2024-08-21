import 'package:flutter/material.dart';

class ItemSelection extends StatefulWidget {
  final String title;
  final List<String> styles;
  //final ValueChanged<String> onSelected;

  const ItemSelection(
      {super.key, required this.title, required this.styles });//required this.onSelected});

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
            itemBuilder: (context) => widget.styles.map((style) {
                  return PopupMenuItem<String>(
                      value: style,
                      child: Text(
                        style,
                        style: const TextStyle(color: Colors.black),
                      ),
                  );
            }
            ).toList(),
            onSelected: (String newItem) {
              setState(() {
                title = newItem;
              });
              //widget.onSelected(newItem);
            }));
  }
}
