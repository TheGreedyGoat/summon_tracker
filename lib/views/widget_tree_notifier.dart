import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:summon_tracker/models/summon_template.dart';
import 'package:summon_tracker/views/pages/summon_edit_page.dart';
import 'package:summon_tracker/views/pages/summons_overview.dart';
import 'package:summon_tracker/views/widget_tree_state.dart';

final widgetTreeProvider = NotifierProvider(
  () => WidgetTreeNotifier(),
);

class WidgetTreeNotifier extends Notifier<WidgetTreeState> {
  @override
  WidgetTreeState build() => templateOverview;

  WidgetTreeState get templateOverview => WidgetTreeState(
    title: 'Templates',
    body: SummonsOverview(),
    floatingActionButton: FloatingActionButton(
      onPressed: () {
        state = templateEdit(null);
      },
      child: Icon(Icons.add),
    ),
  );

  WidgetTreeState templateEdit(SummonTemplate? template) {
    final page = SummonEditPage(summonData: null);
    return WidgetTreeState(
      title: template == null ? 'Create' : 'Edit',
      body: page,
    );
  }

  void setPage(WidgetTreeState page) {
    state = page;
  }

  set floatingActionButton(Widget fab) =>
      state = state.copyWith(floatingActionButton: fab);
}
