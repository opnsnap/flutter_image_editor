import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:colorfilter_generator/colorfilter_generator.dart';
import 'package:colorfilter_generator/presets.dart';

typedef OnFilterSelected = void Function(ColorFilter filter);

class FilterWidget extends StatefulWidget {
  const FilterWidget(
      {Key? key,
      required this.valueListenable,
      required this.onFilterSelected,
      required this.filter})
      : super(key: key);

  final ColorFilterGenerator filter;
  final ValueNotifier<int> valueListenable;
  final OnFilterSelected onFilterSelected;

  @override
  _FilterWidgetState createState() => _FilterWidgetState();
}

class _FilterWidgetState extends State<FilterWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print("Tapped");
        print(widget.filter.name);
        // widget.onFilterSelected(selectedFilter.);
      },
      child: ValueListenableBuilder<int>(
        valueListenable: widget.valueListenable,
        builder: (ctx, value, child) {
          return Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white, width: 1),
              shape: BoxShape.rectangle,
            ),
            child:
                Text(widget.filter.name, style: TextStyle(color: Colors.white)),
          );
        },
      ),
    );
  }
}
