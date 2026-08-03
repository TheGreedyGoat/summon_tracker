// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'summon_template.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SummonTemplate {

 String get id; String get name; StatExpression get hitPoints; StatExpression get armorClass; StatExpression get strength; StatExpression get dexterity; StatExpression get constitution; StatExpression get intelligence; StatExpression get wisdom; StatExpression get charisma; StatExpression get proficiency;
/// Create a copy of SummonTemplate
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SummonTemplateCopyWith<SummonTemplate> get copyWith => _$SummonTemplateCopyWithImpl<SummonTemplate>(this as SummonTemplate, _$identity);





@override
String toString() {
  return 'SummonTemplate(id: $id, name: $name, hitPoints: $hitPoints, armorClass: $armorClass, strength: $strength, dexterity: $dexterity, constitution: $constitution, intelligence: $intelligence, wisdom: $wisdom, charisma: $charisma, proficiency: $proficiency)';
}


}

/// @nodoc
abstract mixin class $SummonTemplateCopyWith<$Res>  {
  factory $SummonTemplateCopyWith(SummonTemplate value, $Res Function(SummonTemplate) _then) = _$SummonTemplateCopyWithImpl;
@useResult
$Res call({
 String? id, String name, StatExpression hitPoints, StatExpression armorClass, StatExpression strength, StatExpression dexterity, StatExpression constitution, StatExpression intelligence, StatExpression wisdom, StatExpression charisma, StatExpression proficiency
});




}
/// @nodoc
class _$SummonTemplateCopyWithImpl<$Res>
    implements $SummonTemplateCopyWith<$Res> {
  _$SummonTemplateCopyWithImpl(this._self, this._then);

  final SummonTemplate _self;
  final $Res Function(SummonTemplate) _then;

/// Create a copy of SummonTemplate
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? name = null,Object? hitPoints = null,Object? armorClass = null,Object? strength = null,Object? dexterity = null,Object? constitution = null,Object? intelligence = null,Object? wisdom = null,Object? charisma = null,Object? proficiency = null,}) {
  return _then(SummonTemplate(
id: freezed == id ? _self.id! : id // ignore: cast_nullable_to_non_nullable
as String?,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,hitPoints: null == hitPoints ? _self.hitPoints : hitPoints // ignore: cast_nullable_to_non_nullable
as StatExpression,armorClass: null == armorClass ? _self.armorClass : armorClass // ignore: cast_nullable_to_non_nullable
as StatExpression,strength: null == strength ? _self.strength : strength // ignore: cast_nullable_to_non_nullable
as StatExpression,dexterity: null == dexterity ? _self.dexterity : dexterity // ignore: cast_nullable_to_non_nullable
as StatExpression,constitution: null == constitution ? _self.constitution : constitution // ignore: cast_nullable_to_non_nullable
as StatExpression,intelligence: null == intelligence ? _self.intelligence : intelligence // ignore: cast_nullable_to_non_nullable
as StatExpression,wisdom: null == wisdom ? _self.wisdom : wisdom // ignore: cast_nullable_to_non_nullable
as StatExpression,charisma: null == charisma ? _self.charisma : charisma // ignore: cast_nullable_to_non_nullable
as StatExpression,proficiency: null == proficiency ? _self.proficiency : proficiency // ignore: cast_nullable_to_non_nullable
as StatExpression,
  ));
}

}


/// Adds pattern-matching-related methods to [SummonTemplate].
extension SummonTemplatePatterns on SummonTemplate {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({required TResult orElse(),}){
final _that = this;
switch (_that) {
case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(){
final _that = this;
switch (_that) {
case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(){
final _that = this;
switch (_that) {
case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({required TResult orElse(),}) {final _that = this;
switch (_that) {
case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>() {final _that = this;
switch (_that) {
case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>() {final _that = this;
switch (_that) {
case _:
  return null;

}
}

}

// dart format on
