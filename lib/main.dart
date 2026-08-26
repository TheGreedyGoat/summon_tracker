import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:summon_tracker/services/database/database_service.dart';
import 'package:summon_tracker/widget_tree.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
    sqfliteFfiInit();
    databaseFactory = databaseFactoryFfi;
  }
  // await DatabaseService.instance.reset();
  await DatabaseService.instance.templates;
  runApp(
    ProviderScope(child: MaterialApp(home: WidgetTree())),
  );
}
