import 'package:flutter/material.dart';
import 'package:animation/models/shoot_entry.dart';
import 'package:provider/provider.dart';

class ShootFilter extends StatefulWidget {
  @override
  _ShootFilterState createState() => _ShootFilterState();
}

ShootEntry shootentry = ShootEntry();

class _ShootFilterState extends State<ShootFilter> {
  final List<ShootEntry> _options = [
    ShootEntry(name: 'Gun'),
    ShootEntry(name: 'Bomb'),
    ShootEntry(name: 'Sniper')
  ];

  Iterable<Widget> get shootWidget sync* {
    for (final ShootEntry shoot in _options) {
      yield Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
        child: FilterChip(
          label: Text(shoot.name),
          selected: Provider.of<ShootEntry>(context, listen: false)
              .filters
              .contains(shoot.name),
          onSelected: (bool value) {
            setState(() {
              if (value) {
                Provider.of<ShootEntry>(context, listen: false)
                    .filters
                    .add(shoot.name);
              } else {
                Provider.of<ShootEntry>(context, listen: false)
                    .filters
                    .removeWhere((String name) => name == shoot.name);
              }
            });
          },
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Wrap(
          children: shootWidget.toList(),
        ),
      ],
    );
  }
}

// class ShootChip extends StatefulWidget {
//   @override
//   _ShootChipState createState() => _ShootChipState();
// }

// class _ShootChipState extends State<ShootChip> {
//   List<String> _options = ['Gun', 'Bomb', 'Sniper'];
//   List<bool> _selected = [false, false, false];

//   Widget _buildChips() {
//     List<Widget> chips = new List();

//     for (int i = 0; i < _options.length; i++) {
//       FilterChip filterChip = FilterChip(
//         selected: _selected[i],
//         label: Text(_options[i], style: TextStyle(color: Colors.black)),
//         labelPadding: EdgeInsets.symmetric(horizontal: 18, vertical: -1),
//         elevation: 2,
//         pressElevation: 5,
//         shadowColor: Colors.black12.withOpacity(0.1),
//         selectedColor: Colors.deepPurple,
//         onSelected: (bool selected) {
//           setState(() {
//             _selected[i] = selected;
//             if (selected = true) {
//               print(_options[i]);
//             }
//           });
//         },
//       );

//       chips.add(Padding(
//           padding: EdgeInsets.symmetric(horizontal: 10), child: filterChip));
//     }

//     return ListView(
//       // This next line does the trick.
//       scrollDirection: Axis.horizontal,
//       children: chips,
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 15.0),
//       child: Column(
//         children: <Widget>[
//           Container(
//             height: 30,
//             child: _buildChips(),
//           ),
//         ],
//       ),
//     );
//   }
// }
