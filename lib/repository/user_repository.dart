import 'package:appscrip_users/models/user_model.dart';
import 'package:appscrip_users/services/api_service.dart';

class UserRepository {

  final ApiService apiService;

  UserRepository({required this.apiService});


  //! Get Users
  Future<List<UserModel>> getUsers() async {
    try {
      return await apiService.fetchUsers();
    }catch (e) {
      rethrow;
    }
  }


  //! Get user by ID
  Future<UserModel> getUserById(int id) async {
    try {
      return await apiService.fetchUserById(id);
    } catch (e) {
      rethrow;
    }
  }

  //! Search users by name 
  List<UserModel> searchUsers(List<UserModel> users, String query) {
    if (query.isEmpty) return users;
    
    final lowerQuery = query.toLowerCase();
    return users.where((user) {
      return user.name.toLowerCase().contains(lowerQuery) ||
          user.email.toLowerCase().contains(lowerQuery) ||
          user.username.toLowerCase().contains(lowerQuery);
    }).toList();
  }

}