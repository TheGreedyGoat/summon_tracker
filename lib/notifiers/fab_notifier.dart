import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

typedef ButtonCallback = void Function();

final fabProvider = NotifierProvider(
  () => FaBNotifier(),
);

class FabState {
  final ButtonCallback onPressed;
  final IconData icon;
  final FabState? child;

  FabState({required this.onPressed, required this.icon, this.child});

  bool get hasChild => child != null;

  @override
  bool operator ==(Object other) =>
      other is FabState &&
      other.onPressed == onPressed &&
      other.icon == icon &&
      other.child == child;

  @override
  int get hashCode => Object.hash(onPressed, icon, child);
}

class FaBNotifier extends Notifier<FabState?> {
  @override
  FabState? build() => null;

  void set(FabState? next) => state = next;
}
