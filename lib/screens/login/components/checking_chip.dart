import 'package:flutter/material.dart';
import 'package:animation/models/checking_entry.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class CheckingChips extends StatefulWidget {
  List<String> option;
  CheckingChips({this.option});
  @override
  _CheckingChipsState createState() => _CheckingChipsState();
}

// CheckingEntry checkentry = CheckingEntry();

class _CheckingChipsState extends State<CheckingChips> {
  final List<CheckingEntry> _options = <CheckingEntry>[
    CheckingEntry(name: 'Phone'),
    CheckingEntry(name: 'Car'),
    CheckingEntry(name: 'Person'),
  ];

  Iterable<Widget> get checkingWidgets sync* {
    for (final CheckingEntry checking in _options) {
      yield Builder(
        builder: (BuildContext context) => Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
          child: FilterChip(
            label: Text(checking.name),
            selected: Provider.of<CheckingEntry>(context, listen: false)
                .filter
                .contains(checking.name),
            onSelected: (bool value) {
              setState(() {
                if (value) {
                  Provider.of<CheckingEntry>(context, listen: false)
                      .filter
                      .add(checking.name);
                } else {
                  Provider.of<CheckingEntry>(context, listen: false)
                      .filter
                      .removeWhere((String name) => name == checking.name);
                }
              });
            },
          ),
        ),
      );
    }
  }
  // Widget _buildChips() {
  //   List<Widget> chips = new List();

  //   for (int i = 0; i < _options.length; i++) {
  //     FilterChip filterChip = FilterChip(
  //       selected: _selected[i],
  //       label: Text(_options[i], style: TextStyle(color: Colors.black)),
  //       labelPadding: EdgeInsets.symmetric(horizontal: 18, vertical: -1),
  //       elevation: 5,
  //       pressElevation: 5,
  //       selectedColor: Colors.deepPurple,
  //       onSelected: (bool selected) {
  //         setState(() {
  //           _selected[i] = selected;
  //         });
  //       },
  //     );

  //     chips.add(Padding(
  //         padding: EdgeInsets.symmetric(horizontal: 10), child: filterChip));
  //   }

  //   return ListView(
  //     // This next line does the trick.
  //     scrollDirection: Axis.horizontal,
  //     children: chips,
  //   );
  // }

  // @override
  // Widget build(BuildContext context) {
  //   return Padding(
  //     padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 15.0),
  //     child: Column(
  //       children: <Widget>[
  //         Container(
  //           height: 30,
  //           child: _buildChips(),
  //         ),
  //       ],
  //     ),
  //   );
  // }
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Wrap(
          children: checkingWidgets.toList(),
        ),
      ],
    );
  }
}
