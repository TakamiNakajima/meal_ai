import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meal_ai/domain/menu_list/menu_list_service.dart';
import 'package:meal_ai/domain/menu_list/menu_list_state.dart';

final menuListProvider = StateNotifierProvider.autoDispose<MenuListNotifier, MenuListState>(
  (ref) => MenuListNotifier(menuListService: ref.read(menuListService)),
);

///
/// 献立表画面のNotifier
///
class MenuListNotifier extends StateNotifier<MenuListState> {
  MenuListNotifier({
    required MenuListService menuListService,
  })  : _menuListService = menuListService,
        super(const MenuListState()) {
    init();
  }

  final MenuListService _menuListService;

  /// 初期処理
  Future<void> init() async {
    try {
      state = state.copyWith(
        isLoading: true,
      );

      final recipes = await _menuListService.fetchRecipeList();

      state = state.copyWith(
        isLoading: false,
        recipeList: recipes,
      );
    } catch (e) {
      state = state.copyWith(
        isLoading: false,
      );
    }
  }
}
