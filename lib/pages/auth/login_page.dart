import 'package:attendsync/common/api.dart';
import 'package:attendsync/common/helper.dart';
import 'package:attendsync/pages/admin/home_admin_page.dart';
import 'package:attendsync/services/api/api_service.dart';
import 'package:attendsync/services/api/http_client.dart';
import 'package:attendsync/services/hive/hive_service.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool obsecurePassword = true;
  TextEditingController emailController = TextEditingController(
    text: 'fred',
  );
  TextEditingController passwordController = TextEditingController(
    text: '1q2w3e4r',
  );
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
            controller: emailController,
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
            controller: passwordController,
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
              Helper.showLoading(context);
              doLogin().then((value) {
                Navigator.pop(context);
                if (value) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HomeAdminPage(),
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Login gagal'),
                    ),
                  );
                }
              });
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

  Future<bool> doLogin() async {
    final httpClient = HttpClient();
    final apiService = ApiService(httpClient);
    try {
      final result = await apiService.login(
        Api.LOGIN,
        {
          'username': emailController.text,
          'password': passwordController.text,
        },
      );
      print(result);
      if (result['status'] == 'success') {
        HiveService.saveUserToken(result['data']['token']);
        HiveService.saveUserRole(result['data']['role']);
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e);
      return false;
    }
  }
}
