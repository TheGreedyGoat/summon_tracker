// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ability.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AbilityScore {

 Ability get ability; String get score; Proficiency get proficiency;
/// Create a copy of AbilityScore
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AbilityScoreCopyWith<AbilityScore> get copyWith => _$AbilityScoreCopyWithImpl<AbilityScore>(this as AbilityScore, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AbilityScore&&(identical(other.ability, ability) || other.ability == ability)&&(identical(other.score, score) || other.score == score)&&(identical(other.proficiency, proficiency) || other.proficiency == proficiency));
}


@override
int get hashCode => Object.hash(runtimeType,ability,score,proficiency);

@override
String toString() {
  return 'AbilityScore(ability: $ability, score: $score, proficiency: $proficiency)';
}


}

/// @nodoc
abstract mixin class $AbilityScoreCopyWith<$Res>  {
  factory $AbilityScoreCopyWith(AbilityScore value, $Res Function(AbilityScore) _then) = _$AbilityScoreCopyWithImpl;
@useResult
$Res call({
 Ability ability, String score, Proficiency proficiency
});




}
/// @nodoc
class _$AbilityScoreCopyWithImpl<$Res>
    implements $AbilityScoreCopyWith<$Res> {
  _$AbilityScoreCopyWithImpl(this._self, this._then);

  final AbilityScore _self;
  final $Res Function(AbilityScore) _then;

/// Create a copy of AbilityScore
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? ability = null,Object? score = null,Object? proficiency = null,}) {
  return _then(AbilityScore(
ability: null == ability ? _self.ability : ability // ignore: cast_nullable_to_non_nullable
as Ability,score: null == score ? _self.score : score // ignore: cast_nullable_to_non_nullable
as String,proficiency: null == proficiency ? _self.proficiency : proficiency // ignore: cast_nullable_to_non_nullable
as Proficiency,
  ));
}

}


/// Adds pattern-matching-related methods to [AbilityScore].
extension AbilityScorePatterns on AbilityScore {
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
