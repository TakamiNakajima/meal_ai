// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'menu_list_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MenuListState _$MenuListStateFromJson(Map<String, dynamic> json) {
  return _MenuListState.fromJson(json);
}

/// @nodoc
mixin _$MenuListState {
  List<Recipe> get recipeList => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;

  /// Serializes this MenuListState to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MenuListState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MenuListStateCopyWith<MenuListState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MenuListStateCopyWith<$Res> {
  factory $MenuListStateCopyWith(
          MenuListState value, $Res Function(MenuListState) then) =
      _$MenuListStateCopyWithImpl<$Res, MenuListState>;
  @useResult
  $Res call({List<Recipe> recipeList, bool isLoading});
}

/// @nodoc
class _$MenuListStateCopyWithImpl<$Res, $Val extends MenuListState>
    implements $MenuListStateCopyWith<$Res> {
  _$MenuListStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MenuListState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? recipeList = null,
    Object? isLoading = null,
  }) {
    return _then(_value.copyWith(
      recipeList: null == recipeList
          ? _value.recipeList
          : recipeList // ignore: cast_nullable_to_non_nullable
              as List<Recipe>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MenuListStateImplCopyWith<$Res>
    implements $MenuListStateCopyWith<$Res> {
  factory _$$MenuListStateImplCopyWith(
          _$MenuListStateImpl value, $Res Function(_$MenuListStateImpl) then) =
      __$$MenuListStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Recipe> recipeList, bool isLoading});
}

/// @nodoc
class __$$MenuListStateImplCopyWithImpl<$Res>
    extends _$MenuListStateCopyWithImpl<$Res, _$MenuListStateImpl>
    implements _$$MenuListStateImplCopyWith<$Res> {
  __$$MenuListStateImplCopyWithImpl(
      _$MenuListStateImpl _value, $Res Function(_$MenuListStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of MenuListState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? recipeList = null,
    Object? isLoading = null,
  }) {
    return _then(_$MenuListStateImpl(
      recipeList: null == recipeList
          ? _value._recipeList
          : recipeList // ignore: cast_nullable_to_non_nullable
              as List<Recipe>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MenuListStateImpl implements _MenuListState {
  const _$MenuListStateImpl(
      {final List<Recipe> recipeList = const [], this.isLoading = false})
      : _recipeList = recipeList;

  factory _$MenuListStateImpl.fromJson(Map<String, dynamic> json) =>
      _$$MenuListStateImplFromJson(json);

  final List<Recipe> _recipeList;
  @override
  @JsonKey()
  List<Recipe> get recipeList {
    if (_recipeList is EqualUnmodifiableListView) return _recipeList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_recipeList);
  }

  @override
  @JsonKey()
  final bool isLoading;

  @override
  String toString() {
    return 'MenuListState(recipeList: $recipeList, isLoading: $isLoading)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MenuListStateImpl &&
            const DeepCollectionEquality()
                .equals(other._recipeList, _recipeList) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_recipeList), isLoading);

  /// Create a copy of MenuListState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MenuListStateImplCopyWith<_$MenuListStateImpl> get copyWith =>
      __$$MenuListStateImplCopyWithImpl<_$MenuListStateImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MenuListStateImplToJson(
      this,
    );
  }
}

abstract class _MenuListState implements MenuListState {
  const factory _MenuListState(
      {final List<Recipe> recipeList,
      final bool isLoading}) = _$MenuListStateImpl;

  factory _MenuListState.fromJson(Map<String, dynamic> json) =
      _$MenuListStateImpl.fromJson;

  @override
  List<Recipe> get recipeList;
  @override
  bool get isLoading;

  /// Create a copy of MenuListState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MenuListStateImplCopyWith<_$MenuListStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
