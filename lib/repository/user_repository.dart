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
}