// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'generate_menu_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GenerateMenuState _$GenerateMenuStateFromJson(Map<String, dynamic> json) {
  return _GenerateMenuState.fromJson(json);
}

/// @nodoc
mixin _$GenerateMenuState {
  bool get isLoading => throw _privateConstructorUsedError;
  DateTime? get rangeStartDay => throw _privateConstructorUsedError;
  DateTime? get rangeEndDay => throw _privateConstructorUsedError;
  GeneratePageType get pageState => throw _privateConstructorUsedError;

  /// Serializes this GenerateMenuState to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GenerateMenuState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GenerateMenuStateCopyWith<GenerateMenuState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GenerateMenuStateCopyWith<$Res> {
  factory $GenerateMenuStateCopyWith(
          GenerateMenuState value, $Res Function(GenerateMenuState) then) =
      _$GenerateMenuStateCopyWithImpl<$Res, GenerateMenuState>;
  @useResult
  $Res call(
      {bool isLoading,
      DateTime? rangeStartDay,
      DateTime? rangeEndDay,
      GeneratePageType pageState});
}

/// @nodoc
class _$GenerateMenuStateCopyWithImpl<$Res, $Val extends GenerateMenuState>
    implements $GenerateMenuStateCopyWith<$Res> {
  _$GenerateMenuStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GenerateMenuState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? rangeStartDay = freezed,
    Object? rangeEndDay = freezed,
    Object? pageState = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      rangeStartDay: freezed == rangeStartDay
          ? _value.rangeStartDay
          : rangeStartDay // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      rangeEndDay: freezed == rangeEndDay
          ? _value.rangeEndDay
          : rangeEndDay // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      pageState: null == pageState
          ? _value.pageState
          : pageState // ignore: cast_nullable_to_non_nullable
              as GeneratePageType,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GenerateMenuStateImplCopyWith<$Res>
    implements $GenerateMenuStateCopyWith<$Res> {
  factory _$$GenerateMenuStateImplCopyWith(_$GenerateMenuStateImpl value,
          $Res Function(_$GenerateMenuStateImpl) then) =
      __$$GenerateMenuStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading,
      DateTime? rangeStartDay,
      DateTime? rangeEndDay,
      GeneratePageType pageState});
}

/// @nodoc
class __$$GenerateMenuStateImplCopyWithImpl<$Res>
    extends _$GenerateMenuStateCopyWithImpl<$Res, _$GenerateMenuStateImpl>
    implements _$$GenerateMenuStateImplCopyWith<$Res> {
  __$$GenerateMenuStateImplCopyWithImpl(_$GenerateMenuStateImpl _value,
      $Res Function(_$GenerateMenuStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of GenerateMenuState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? rangeStartDay = freezed,
    Object? rangeEndDay = freezed,
    Object? pageState = null,
  }) {
    return _then(_$GenerateMenuStateImpl(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      rangeStartDay: freezed == rangeStartDay
          ? _value.rangeStartDay
          : rangeStartDay // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      rangeEndDay: freezed == rangeEndDay
          ? _value.rangeEndDay
          : rangeEndDay // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      pageState: null == pageState
          ? _value.pageState
          : pageState // ignore: cast_nullable_to_non_nullable
              as GeneratePageType,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GenerateMenuStateImpl implements _GenerateMenuState {
  const _$GenerateMenuStateImpl(
      {this.isLoading = false,
      this.rangeStartDay,
      this.rangeEndDay,
      this.pageState = GeneratePageType.start});

  factory _$GenerateMenuStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$GenerateMenuStateImplFromJson(json);

  @override
  @JsonKey()
  final bool isLoading;
  @override
  final DateTime? rangeStartDay;
  @override
  final DateTime? rangeEndDay;
  @override
  @JsonKey()
  final GeneratePageType pageState;

  @override
  String toString() {
    return 'GenerateMenuState(isLoading: $isLoading, rangeStartDay: $rangeStartDay, rangeEndDay: $rangeEndDay, pageState: $pageState)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GenerateMenuStateImpl &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.rangeStartDay, rangeStartDay) ||
                other.rangeStartDay == rangeStartDay) &&
            (identical(other.rangeEndDay, rangeEndDay) ||
                other.rangeEndDay == rangeEndDay) &&
            (identical(other.pageState, pageState) ||
                other.pageState == pageState));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, isLoading, rangeStartDay, rangeEndDay, pageState);

  /// Create a copy of GenerateMenuState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GenerateMenuStateImplCopyWith<_$GenerateMenuStateImpl> get copyWith =>
      __$$GenerateMenuStateImplCopyWithImpl<_$GenerateMenuStateImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GenerateMenuStateImplToJson(
      this,
    );
  }
}

abstract class _GenerateMenuState implements GenerateMenuState {
  const factory _GenerateMenuState(
      {final bool isLoading,
      final DateTime? rangeStartDay,
      final DateTime? rangeEndDay,
      final GeneratePageType pageState}) = _$GenerateMenuStateImpl;

  factory _GenerateMenuState.fromJson(Map<String, dynamic> json) =
      _$GenerateMenuStateImpl.fromJson;

  @override
  bool get isLoading;
  @override
  DateTime? get rangeStartDay;
  @override
  DateTime? get rangeEndDay;
  @override
  GeneratePageType get pageState;

  /// Create a copy of GenerateMenuState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GenerateMenuStateImplCopyWith<_$GenerateMenuStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
