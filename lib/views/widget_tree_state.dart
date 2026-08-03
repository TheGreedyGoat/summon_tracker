import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:summon_tracker/views/pages/summons_overview.dart';
part 'widget_tree_state.freezed.dart';

@freezed
class WidgetTreeState with _$WidgetTreeState {
  final Widget body;
  final String? title;
  final Widget? floatingActionButton;

  const WidgetTreeState({
    required this.body,
    this.title,
    this.floatingActionButton,
  });
}
