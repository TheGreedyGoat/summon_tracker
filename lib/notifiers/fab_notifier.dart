import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

typedef ButtonCallback = void Function();

final abProvider = NotifierProvider(
  () => FaBNotifier(),
);

class FabState {
  final Widget? fab;
  FabState({this.fab});

  factory FabState.icon({IconData? icon, required void Function() onPressed}) =>
      FabState(
        fab: IconButton(onPressed: onPressed, icon: Icon(icon)),
      );

  @override
  bool operator ==(Object other) => other is FabState && other.fab == fab;

  @override
  int get hashCode => Object.hash(
    'fab',
    fab,
  );
}

class FaBNotifier extends Notifier<FabState> {
  @override
  FabState build() => FabState();

  void set(Widget? next) => state = FabState(fab: next);
}
