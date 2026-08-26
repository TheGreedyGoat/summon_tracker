import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:summon_tracker/views/pages/template_edit/template_edit_page_view.dart';
import 'package:summon_tracker/views/pages/template_overview.dart';
import 'package:summon_tracker/widget_tree.dart';

part 'widget_tree_state.freezed.dart';

final wtProvider = NotifierProvider(
  () => WidgetTreeNotifier(),
);

@freezed
class WidgetTreeState with _$WidgetTreeState {
  final PreferredSizeWidget? appbar;
  final Widget body;
  final Widget? floatingActionbutton;

  WidgetTreeState({this.appbar, required this.body, this.floatingActionbutton});
}

class WidgetTreeNotifier extends Notifier<WidgetTreeState> {
  @override
  WidgetTreeState build() => overview;

  void set(WidgetTreeState newState) => state = newState;

  WidgetTreeState get overview => WidgetTreeState(
    body: TemplateOverview(),
    floatingActionbutton: FloatingActionButton(
      onPressed: () {
        set(getEditPage());
      },
      child: Icon(Icons.add),
    ),
  );
  WidgetTreeState getEditPage() =>
      WidgetTreeState(body: TemplateEditPageView());
}
