import 'package:blockstructure/blocs/post/post_event.dart';
import 'package:blockstructure/blocs/post/post_state.dart';
import 'package:blockstructure/core/repository/post_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  final PostRepository repository;

  PostBloc(this.repository) : super(PostInitial()) {
    on<LoadPosts>((event, emit) async {
      emit(PostLoading());
      try {
        final posts = await repository.getPosts();
        emit(PostLoaded(posts));
      } catch (e) {
        emit(PostError("Failed to fetch posts"));
      }
    });
  }
}
