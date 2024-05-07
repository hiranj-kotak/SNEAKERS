import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sneakers/home.dart';
import 'package:sneakers/login_page.dart';
import 'package:sneakers/product_detail.dart';
import 'package:sneakers/profile_page.dart';
import 'package:sneakers/search_list.dart';
import 'package:sneakers/signup_page.dart';
import 'package:sneakers/utils/apiCalls.dart';
import 'package:sneakers/utils/new.dart';
import 'package:sneakers/utils/product_provider.dart';
import './firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MYAPP());
}

class MYAPP extends StatelessWidget {
  const MYAPP({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => searchList()),
        ChangeNotifierProvider(create: (context) => ProductProvider()),
      ],
      child: MaterialApp(
        home: FirebaseAuth.instance.currentUser != null
            ? const HomePage()
            : const Login(),
        routes: {
          ProductDetail.RouteNmae: (context) => ProductDetail(),
          HomePage.RouteName: (context) => const HomePage(),
          Login.routeName: (context) => const Login(),
          Signup.routeName: (context) => const Signup(),
          Profile.routeName: (context) => const Profile(),
        },
      ),
    );
  }
}
