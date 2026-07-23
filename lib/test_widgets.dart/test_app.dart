import 'package:flutter/material.dart';
import 'package:summon_tracker/summon_example.dart';
import 'package:summon_tracker/test_widgets.dart/summon_display_test.dart';
import 'package:summon_tracker/widget_tree.dart';

void runTestApp() {
  runApp(
    MaterialApp(
      home: WidgetTree(
        appBarTitle: Text('DisplayTest'),
        body: Center(child: SummonDisplayTest(summonData: summonExample)),
      ),
    ),
  );
}
