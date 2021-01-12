import 'package:barberapp/app/data/model/auth_model.dart';
import 'package:barberapp/app/data/model/user_model.dart';
import 'package:barberapp/app/data/provider/auth_provider.dart';

class AuthRepository {
  final AuthApiClient apiClient = AuthApiClient();

  Future<Auth> login(String username, String password) async {
    Map json = await apiClient.login(username, password);
    return Auth.fromJson(json);
  }
  
  Future<User> register(String username, String password) async {
    Map json = await apiClient.register(username, password);
    return User.fromJson(json['user']);
  }
}
