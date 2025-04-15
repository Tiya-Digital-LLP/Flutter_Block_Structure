import 'package:blockstructure/blocs/post/post_bloc.dart';
import 'package:blockstructure/blocs/post/post_state.dart';
import 'package:blockstructure/widgets/custom_app_bar.dart';
import 'package:blockstructure/widgets/post_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostScreen extends StatelessWidget {
  const PostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        size: MediaQuery.of(context).size,
        titleText: 'Posts',
      ),
      body: BlocBuilder<PostBloc, PostState>(
        builder: (context, state) {
          if (state is PostLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is PostLoaded) {
            return ListView.builder(
              itemCount: state.posts.length,
              itemBuilder: (_, i) => PostTile(post: state.posts[i]),
            );
          } else if (state is PostError) {
            return Center(child: Text(state.message));
          }
          return Center(child: Text("Press button to load posts"));
        },
      ),
    );
  }
}
