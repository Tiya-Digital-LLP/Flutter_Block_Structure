import 'package:blockstructure/core/api/api_provider.dart';
import 'package:blockstructure/core/models/post_model.dart';

class PostRepository {
  final ApiProvider _apiProvider = ApiProvider();

  Future<List<Post>> getPosts() {
    return _apiProvider.fetchPosts();
  }
}
