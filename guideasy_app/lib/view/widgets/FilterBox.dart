import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FilterBox extends StatefulWidget {
  final List<String> filters;
  double height;

  FilterBox({@required this.filters, @required this.height});

  @override
  _FilterBoxState createState() => new _FilterBoxState(height);
}

class _FilterBoxState extends State<FilterBox>{
  double height;

  _FilterBoxState(this.height);
  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    final Iterable<ListTile> tiles = widget.filters.map(
          (String filter){
        return ListTile(
          title: Text(filter),
        );
      },
    );
    final List<Widget> divided = ListTile
        .divideTiles(
          context: context,
          tiles: tiles,
        )
        .toList();

    return Container(
      constraints: BoxConstraints.expand(
        height: this.height,
      ),
      child: Scaffold(
        appBar: AppBar(
        title:
          Text(
            'Filters: ',
            style: theme.textTheme.headline,
          ),
        ),
        body: ListView(children: divided),
      )
    );
  }
}