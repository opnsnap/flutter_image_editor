import 'package:flutter/material.dart';
import 'package:colorfilter_generator/colorfilter_generator.dart';

typedef OnFilterSelected = void Function(ColorFilterGenerator filter);

class FilterWidget extends StatefulWidget {
  const FilterWidget(
      {Key? key,
      required this.valueListenable,
      required this.onFilterSelected,
      required this.filter})
      : super(key: key);

  final ColorFilterGenerator filter;
  final ValueNotifier<ColorFilterGenerator> valueListenable;
  final OnFilterSelected onFilterSelected;

  @override
  _FilterWidgetState createState() => _FilterWidgetState();
}

class _FilterWidgetState extends State<FilterWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onFilterSelected(widget.filter);
      },
      child: ValueListenableBuilder<ColorFilterGenerator>(
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
