import 'package:appscrip_users/repository/user_repository.dart';
import 'package:flutter/material.dart';

class UserViewModel extends ChangeNotifier {

  final UserRepository userRepository;

  UserViewModel({required this.userRepository});

  //! Users List
  List users = [];
  bool isLoading = false;
  String? errorMessage;



  bool get hasError => errorMessage != null;
  bool get isEmpty => users.isEmpty && !isLoading && !hasError;


  //! Get Users
  Future loadUsers() async {
    isLoading = true;
    errorMessage = null;
    notifyListeners();

    try {
      users = await userRepository.getUsers();
      errorMessage = null;
    }catch (e) {
      errorMessage = e.toString().replaceAll('Exception', '');
      users = [];
    }finally {
      isLoading = false;
      notifyListeners();
    }
  }
}