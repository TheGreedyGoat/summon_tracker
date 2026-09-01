// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'change_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ChangeState {

 int get master; int get variant; int get instance; int get abilityScore; int get variable; int get feature; int get skillProf; int get skill; int get damagemod; int get damageType;
/// Create a copy of ChangeState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChangeStateCopyWith<ChangeState> get copyWith => _$ChangeStateCopyWithImpl<ChangeState>(this as ChangeState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChangeState&&(identical(other.master, master) || other.master == master)&&(identical(other.variant, variant) || other.variant == variant)&&(identical(other.instance, instance) || other.instance == instance)&&(identical(other.abilityScore, abilityScore) || other.abilityScore == abilityScore)&&(identical(other.variable, variable) || other.variable == variable)&&(identical(other.feature, feature) || other.feature == feature)&&(identical(other.skillProf, skillProf) || other.skillProf == skillProf)&&(identical(other.skill, skill) || other.skill == skill)&&(identical(other.damagemod, damagemod) || other.damagemod == damagemod)&&(identical(other.damageType, damageType) || other.damageType == damageType));
}


@override
int get hashCode => Object.hash(runtimeType,master,variant,instance,abilityScore,variable,feature,skillProf,skill,damagemod,damageType);

@override
String toString() {
  return 'ChangeState(master: $master, variant: $variant, instance: $instance, abilityScore: $abilityScore, variable: $variable, feature: $feature, skillProf: $skillProf, skill: $skill, damagemod: $damagemod, damageType: $damageType)';
}


}

/// @nodoc
abstract mixin class $ChangeStateCopyWith<$Res>  {
  factory $ChangeStateCopyWith(ChangeState value, $Res Function(ChangeState) _then) = _$ChangeStateCopyWithImpl;
@useResult
$Res call({
 int master, int variant, int instance, int abilityScore, int variable, int feature, int skillProf, int skill, int damagemod, int damageType
});




}
/// @nodoc
class _$ChangeStateCopyWithImpl<$Res>
    implements $ChangeStateCopyWith<$Res> {
  _$ChangeStateCopyWithImpl(this._self, this._then);

  final ChangeState _self;
  final $Res Function(ChangeState) _then;

/// Create a copy of ChangeState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? master = null,Object? variant = null,Object? instance = null,Object? abilityScore = null,Object? variable = null,Object? feature = null,Object? skillProf = null,Object? skill = null,Object? damagemod = null,Object? damageType = null,}) {
  return _then(ChangeState(
master: null == master ? _self.master : master // ignore: cast_nullable_to_non_nullable
as int,variant: null == variant ? _self.variant : variant // ignore: cast_nullable_to_non_nullable
as int,instance: null == instance ? _self.instance : instance // ignore: cast_nullable_to_non_nullable
as int,abilityScore: null == abilityScore ? _self.abilityScore : abilityScore // ignore: cast_nullable_to_non_nullable
as int,variable: null == variable ? _self.variable : variable // ignore: cast_nullable_to_non_nullable
as int,feature: null == feature ? _self.feature : feature // ignore: cast_nullable_to_non_nullable
as int,skillProf: null == skillProf ? _self.skillProf : skillProf // ignore: cast_nullable_to_non_nullable
as int,skill: null == skill ? _self.skill : skill // ignore: cast_nullable_to_non_nullable
as int,damagemod: null == damagemod ? _self.damagemod : damagemod // ignore: cast_nullable_to_non_nullable
as int,damageType: null == damageType ? _self.damageType : damageType // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [ChangeState].
extension ChangeStatePatterns on ChangeState {
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
