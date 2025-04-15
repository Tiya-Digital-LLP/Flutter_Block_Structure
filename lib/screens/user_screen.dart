import 'package:blockstructure/blocs/user/user_bloc.dart';
import 'package:blockstructure/blocs/user/user_state.dart';
import 'package:blockstructure/widgets/custom_app_bar.dart';
import 'package:blockstructure/widgets/user_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        size: MediaQuery.of(context).size,
        titleText: 'Users',
      ),
      body: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          if (state is UserLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is UserLoaded) {
            return ListView.builder(
              itemCount: state.users.length,
              itemBuilder: (_, i) => UserTile(user: state.users[i]),
            );
          } else if (state is UserError) {
            return Center(child: Text(state.message));
          }
          return Center(child: Text("Press button to load users"));
        },
      ),
    );
  }
}
