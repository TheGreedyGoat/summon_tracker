import 'package:freezed_annotation/freezed_annotation.dart';

part 'action_feature.freezed.dart';

@freezed
class ActionFeature with _$ActionFeature {
  final String name;
  final String description;

  ActionFeature({required this.name, required this.description});
}
