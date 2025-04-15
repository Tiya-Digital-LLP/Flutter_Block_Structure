import 'package:blockstructure/screens/home_screen.dart';
import 'package:blockstructure/screens/post_screen.dart';
import 'package:blockstructure/screens/spalsh_screen.dart';
import 'package:blockstructure/screens/user_screen.dart';

class AppRoutes {
  static final routes = {
    '/': (context) => const SplashScreen(),
    '/home': (context) => HomeScreen(),
    '/users': (context) => UserScreen(),
    '/posts': (context) => PostScreen(),
  };
}
