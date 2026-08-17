// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'damage_mod.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$DamageModifier {

 String get damageType; DamageMod get damageMod;
/// Create a copy of DamageModifier
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DamageModifierCopyWith<DamageModifier> get copyWith => _$DamageModifierCopyWithImpl<DamageModifier>(this as DamageModifier, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DamageModifier&&(identical(other.damageType, damageType) || other.damageType == damageType)&&(identical(other.damageMod, damageMod) || other.damageMod == damageMod));
}


@override
int get hashCode => Object.hash(runtimeType,damageType,damageMod);

@override
String toString() {
  return 'DamageModifier(damageType: $damageType, damageMod: $damageMod)';
}


}

/// @nodoc
abstract mixin class $DamageModifierCopyWith<$Res>  {
  factory $DamageModifierCopyWith(DamageModifier value, $Res Function(DamageModifier) _then) = _$DamageModifierCopyWithImpl;
@useResult
$Res call({
 String damageType, DamageMod damageMod
});




}
/// @nodoc
class _$DamageModifierCopyWithImpl<$Res>
    implements $DamageModifierCopyWith<$Res> {
  _$DamageModifierCopyWithImpl(this._self, this._then);

  final DamageModifier _self;
  final $Res Function(DamageModifier) _then;

/// Create a copy of DamageModifier
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? damageType = null,Object? damageMod = null,}) {
  return _then(DamageModifier(
damageType: null == damageType ? _self.damageType : damageType // ignore: cast_nullable_to_non_nullable
as String,damageMod: null == damageMod ? _self.damageMod : damageMod // ignore: cast_nullable_to_non_nullable
as DamageMod,
  ));
}

}


/// Adds pattern-matching-related methods to [DamageModifier].
extension DamageModifierPatterns on DamageModifier {
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
