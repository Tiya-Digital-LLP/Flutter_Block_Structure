import 'package:blockstructure/core/api/api_provider.dart';
import 'package:blockstructure/core/models/user_model.dart';

class UserRepository {
  final ApiProvider _apiProvider = ApiProvider();

  Future<List<User>> getUsers() {
    return _apiProvider.fetchUsers();
  }
}
