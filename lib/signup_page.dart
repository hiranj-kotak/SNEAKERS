import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:iconify_flutter_plus/iconify_flutter_plus.dart';
import "package:iconify_flutter_plus/icons/logos.dart";
import 'package:sneakers/home.dart';
import 'package:sneakers/login_page.dart';

class Signup extends StatefulWidget {
  static const routeName = "/signup";
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _nameController = TextEditingController();
  final _cPasswordController = TextEditingController();

  void firebaseSignup() async {
    if (_passwordController.text.trim() == _cPasswordController.text.trim()) {
      try {
        final Credential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim(),
        );
        if (Credential.user != null) {
          Navigator.of(context).popUntil((route) => route.isFirst);
          Navigator.of(context).pushReplacementNamed(HomePage.RouteName);
        }
      } catch (e) {
        print(e);
      }
    } else {
      debugPrint("password not match");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            SizedBox(
              height: MediaQuery.of(context).padding.top + 50,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: const Text(
                "Lets Register Account",
                style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              child: const Text(
                "Hello user, You have a greatful journey waiting for you",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                // contentPadding: const EdgeInsets.only(left: 10),
                constraints: const BoxConstraints(minHeight: 80),
                hintText: "Name",
                // hintStyle: const TextStyle(fontSize: 18),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: const BorderSide(
                    color: Colors.black,
                    width: 2,
                  ),
                ),
                focusColor: Colors.black,
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: const BorderSide(
                    color: Colors.black,
                    width: 2,
                  ),
                ),
              ),
            ),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(
                // contentPadding: const EdgeInsets.only(left: 10),
                constraints: const BoxConstraints(minHeight: 80),
                hintText: "Email",
                // hintStyle: const TextStyle(fontSize: 18),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: const BorderSide(
                    color: Colors.black,
                    width: 2,
                  ),
                ),
                focusColor: Colors.black,
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: const BorderSide(
                    color: Colors.black,
                    width: 2,
                  ),
                ),
              ),
            ),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(
                // contentPadding: const EdgeInsets.only(left: 10),
                constraints: const BoxConstraints(minHeight: 80),
                hintText: "password",
                // hintStyle: const TextStyle(fontSize: 18),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: const BorderSide(
                    color: Colors.black,
                    width: 2,
                  ),
                ),
                focusColor: Colors.black,
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: const BorderSide(
                    color: Colors.black,
                    width: 2,
                  ),
                ),
              ),
            ),
            TextField(
              controller: _cPasswordController,
              obscureText: true,
              decoration: InputDecoration(
                // contentPadding: const EdgeInsets.only(left: 10),
                constraints: const BoxConstraints(minHeight: 80),
                hintText: "Confirm Password",
                // hintStyle: const TextStyle(fontSize: 18),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: const BorderSide(
                    color: Colors.black,
                    width: 2,
                  ),
                ),
                focusColor: Colors.black,
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: const BorderSide(
                    color: Colors.black,
                    width: 2,
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                firebaseSignup();
              },
              child: Container(
                height: 60,
                width: MediaQuery.of(context).size.width * 0.98,
                decoration: const BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.all(Radius.circular(14)),
                ),
                child: const Center(
                  child: Text(
                    "Sign up",
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                    child: Divider(
                  color: Colors.black,
                )),
                SizedBox(
                  width: 3,
                ),
                Text(
                  "or",
                  style: TextStyle(
                    fontSize: 21,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  width: 3,
                ),
                Expanded(
                    child: Divider(
                  color: Colors.black,
                )),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Iconify(
                    Logos.google_icon,
                    size: 30,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Iconify(
                    Logos.facebook,
                    size: 30,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Iconify(
                    Logos.apple,
                    size: 30,
                  ),
                ),
              ],
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Don't have an account ?",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                TextButton(
                    onPressed: () {
                      Navigator.of(context)
                          .pushReplacementNamed(Login.routeName);
                    },
                    child: const Text(
                      "Register Now",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    )),
              ],
            )
          ],
        ),
      ),
    );
  }
}
