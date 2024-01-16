import 'package:attendsync/pages/admin/home_admin_page.dart';
import 'package:attendsync/pages/user/home_user_page.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool obsecurePassword = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        children: [
          Container(
            margin: const EdgeInsets.only(
              top: 40,
              bottom: 20,
            ),
            child: const CircleAvatar(
              radius: 80,
              backgroundImage: NetworkImage('https://picsum.photos/200'),
            ),
          ),
          Text(
            'Attendsync',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          const SizedBox(height: 90),
          TextFormField(
            decoration: InputDecoration(
              label: const Text('Username'),
              prefixIcon: const Icon(Icons.person_sharp),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
          ),
          const SizedBox(height: 20),
          TextFormField(
            obscureText: obsecurePassword,
            decoration: InputDecoration(
              label: const Text('Password'),
              prefixIcon: const Icon(Icons.lock_sharp),
              suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    obsecurePassword = !obsecurePassword;
                  });
                },
                icon: Icon(
                  !obsecurePassword ? Icons.visibility : Icons.visibility_off,
                ),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
          ),
          const SizedBox(height: 30),
          ElevatedButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text('Role'),
                    content: const Text('Pilih role anda'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const HomeAdminPage(),
                            ),
                          );
                        },
                        child: const Text('Admin'),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const HomeUserPage(),
                            ),
                          );
                        },
                        child: const Text('User'),
                      ),

                    ],
                  );
                },
              );
            },
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              minimumSize: const Size(300, 50),
            ),
            child: const Text('Login'),
          )
        ],
      ),
    );
  }
}
