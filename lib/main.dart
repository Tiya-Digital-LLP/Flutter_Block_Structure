import 'package:blockstructure/blocs/post/post_bloc.dart';
import 'package:blockstructure/blocs/post/post_event.dart';
import 'package:blockstructure/blocs/user/user_bloc.dart';
import 'package:blockstructure/blocs/user/user_event.dart';
import 'package:blockstructure/core/repository/post_repository.dart';
import 'package:blockstructure/core/repository/user_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'routes/app_routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final UserRepository userRepository = UserRepository();
  final PostRepository postRepository = PostRepository();

  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<UserBloc>(
          create: (_) => UserBloc(userRepository)..add(LoadUsers()),
        ),
        BlocProvider<PostBloc>(
          create: (_) => PostBloc(postRepository)..add(LoadPosts()),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Bloc Pattern App',
        initialRoute: '/',
        routes: AppRoutes.routes,
      ),
    );
  }
}
