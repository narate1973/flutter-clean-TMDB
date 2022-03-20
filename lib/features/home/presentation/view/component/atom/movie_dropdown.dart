import 'package:flutter/material.dart';

enum MovieType { popular, nowShowing }

class MovieDropDown extends StatefulWidget {
  final Function(MovieType value) onSelect;

  const MovieDropDown({
    required this.onSelect,
  }) : super(key: const Key('MovieDropDown'));

  @override
  State<MovieDropDown> createState() => _MovieDropDownState();
}

class _MovieDropDownState extends State<MovieDropDown> {
  late MovieType dropdownValue;

  @override
  void initState() {
    dropdownValue = MovieType.popular;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton<MovieType>(
      value: dropdownValue,
      elevation: 16,
      icon: const SizedBox.shrink(),
      style: const TextStyle(color: Colors.deepPurple),
      onChanged: (MovieType? newValue) {
        if (newValue == dropdownValue) return;
        setState(() {
          dropdownValue = newValue!;
          widget.onSelect(newValue);
        });
      },
      underline: Container(),
      items: const [
        DropdownMenuItem<MovieType>(
          key: Key('MovieTypePopular'),
          value: MovieType.popular,
          child: Text('popular'),
        ),
        DropdownMenuItem<MovieType>(
          key: Key('MovieTypeNowShowing'),
          value: MovieType.nowShowing,
          child: Text('nowShow'),
        ),
      ],
    );
  }
}
