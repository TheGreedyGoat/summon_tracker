// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'rulebook.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AbilityScoreString {

 Ability get ability; String get score; bool get saveProficient;
/// Create a copy of AbilityScoreString
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AbilityScoreStringCopyWith<AbilityScoreString> get copyWith => _$AbilityScoreStringCopyWithImpl<AbilityScoreString>(this as AbilityScoreString, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AbilityScoreString&&(identical(other.ability, ability) || other.ability == ability)&&(identical(other.score, score) || other.score == score)&&(identical(other.saveProficient, saveProficient) || other.saveProficient == saveProficient));
}


@override
int get hashCode => Object.hash(runtimeType,ability,score,saveProficient);

@override
String toString() {
  return 'AbilityScoreString(ability: $ability, score: $score, saveProficient: $saveProficient)';
}


}

/// @nodoc
abstract mixin class $AbilityScoreStringCopyWith<$Res>  {
  factory $AbilityScoreStringCopyWith(AbilityScoreString value, $Res Function(AbilityScoreString) _then) = _$AbilityScoreStringCopyWithImpl;
@useResult
$Res call({
 Ability ability, String score, bool saveProficient
});




}
/// @nodoc
class _$AbilityScoreStringCopyWithImpl<$Res>
    implements $AbilityScoreStringCopyWith<$Res> {
  _$AbilityScoreStringCopyWithImpl(this._self, this._then);

  final AbilityScoreString _self;
  final $Res Function(AbilityScoreString) _then;

/// Create a copy of AbilityScoreString
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? ability = null,Object? score = null,Object? saveProficient = null,}) {
  return _then(AbilityScoreString(
ability: null == ability ? _self.ability : ability // ignore: cast_nullable_to_non_nullable
as Ability,score: null == score ? _self.score : score // ignore: cast_nullable_to_non_nullable
as String,saveProficient: null == saveProficient ? _self.saveProficient : saveProficient // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [AbilityScoreString].
extension AbilityScoreStringPatterns on AbilityScoreString {
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

/// @nodoc
mixin _$SkillProficiency {

 String get skillName; Proficiency get prof;
/// Create a copy of SkillProficiency
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SkillProficiencyCopyWith<SkillProficiency> get copyWith => _$SkillProficiencyCopyWithImpl<SkillProficiency>(this as SkillProficiency, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SkillProficiency&&(identical(other.skillName, skillName) || other.skillName == skillName)&&(identical(other.prof, prof) || other.prof == prof));
}


@override
int get hashCode => Object.hash(runtimeType,skillName,prof);

@override
String toString() {
  return 'SkillProficiency(skillName: $skillName, prof: $prof)';
}


}

/// @nodoc
abstract mixin class $SkillProficiencyCopyWith<$Res>  {
  factory $SkillProficiencyCopyWith(SkillProficiency value, $Res Function(SkillProficiency) _then) = _$SkillProficiencyCopyWithImpl;
@useResult
$Res call({
 String skillName, Proficiency prof
});




}
/// @nodoc
class _$SkillProficiencyCopyWithImpl<$Res>
    implements $SkillProficiencyCopyWith<$Res> {
  _$SkillProficiencyCopyWithImpl(this._self, this._then);

  final SkillProficiency _self;
  final $Res Function(SkillProficiency) _then;

/// Create a copy of SkillProficiency
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? skillName = null,Object? prof = null,}) {
  return _then(SkillProficiency(
skillName: null == skillName ? _self.skillName : skillName // ignore: cast_nullable_to_non_nullable
as String,prof: null == prof ? _self.prof : prof // ignore: cast_nullable_to_non_nullable
as Proficiency,
  ));
}

}


/// Adds pattern-matching-related methods to [SkillProficiency].
extension SkillProficiencyPatterns on SkillProficiency {
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

/// @nodoc
mixin _$ActionAbility {

 String get name; String get description;
/// Create a copy of ActionAbility
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ActionAbilityCopyWith<ActionAbility> get copyWith => _$ActionAbilityCopyWithImpl<ActionAbility>(this as ActionAbility, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ActionAbility&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description));
}


@override
int get hashCode => Object.hash(runtimeType,name,description);

@override
String toString() {
  return 'ActionAbility(name: $name, description: $description)';
}


}

/// @nodoc
abstract mixin class $ActionAbilityCopyWith<$Res>  {
  factory $ActionAbilityCopyWith(ActionAbility value, $Res Function(ActionAbility) _then) = _$ActionAbilityCopyWithImpl;
@useResult
$Res call({
 String name, String description
});




}
/// @nodoc
class _$ActionAbilityCopyWithImpl<$Res>
    implements $ActionAbilityCopyWith<$Res> {
  _$ActionAbilityCopyWithImpl(this._self, this._then);

  final ActionAbility _self;
  final $Res Function(ActionAbility) _then;

/// Create a copy of ActionAbility
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? description = null,}) {
  return _then(ActionAbility(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [ActionAbility].
extension ActionAbilityPatterns on ActionAbility {
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
