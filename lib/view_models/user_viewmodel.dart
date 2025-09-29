import 'package:appscrip_users/models/user_model.dart';
import 'package:appscrip_users/repository/user_repository.dart';
import 'package:appscrip_users/services/api_service.dart';
import 'package:flutter/material.dart';

class UserViewModel extends ChangeNotifier {
  final UserRepository repository = UserRepository(apiService: ApiService());

  List<UserModel> users = [];
  List<UserModel> filteredUsers = [];
  bool isLoading = false;
  String? errorMessage;
  String searchQuery = '';

  bool get hasError => errorMessage != null;
  bool get isEmpty => users.isEmpty && !isLoading && !hasError;

  Set<int> favoriteUserIds = {};

  //! Load users
  Future<void> loadUsers() async {
    isLoading = true;
    errorMessage = null;
    notifyListeners();

    try {
      users = await repository.getUsers();
      applySearch();
      errorMessage = null;
    } catch (e) {
      errorMessage = e.toString().replaceAll('Exception: ', '');
      users = [];
      filteredUsers = [];
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  //! Toggle favorite
  toggleFavorite(UserModel user) {
    if (favoriteUserIds.contains(user.id)) {
      favoriteUserIds.remove(user.id);
    } else {
      favoriteUserIds.add(user.id);
    }
    notifyListeners();
  }

  //! Check if user is favorite
  bool isFavorite(UserModel user) {
    return favoriteUserIds.contains(user.id);
  }

  //! Refresh users
  Future<void> refreshUsers() async {
    await loadUsers();
  }

  //! Search users by query
  void searchUsers(String query) {
    searchQuery = query;
    applySearch();
    notifyListeners();
  }

  //! Clear search
  void clearSearch() {
    searchQuery = '';
    applySearch();
    notifyListeners();
  }

  //! Apply search filter
  void applySearch() {
  if (searchQuery.isEmpty) {
    filteredUsers = List.from(users);
  } else {
    filteredUsers = repository.searchUsers(users, searchQuery);
  }

  // Move favorites to top
  filteredUsers.sort((a, b) {
    final aFav = favoriteUserIds.contains(a.id) ? 0 : 1;
    final bFav = favoriteUserIds.contains(b.id) ? 0 : 1;
    return aFav.compareTo(bFav);
  });
}


  //! Clear error message
  void clearError() {
    errorMessage = null;
    notifyListeners();
  }
}
