import 'package:flutter/material.dart';

class UserPage extends StatelessWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User'),
        titleTextStyle: Theme.of(context).textTheme.headlineSmall!.copyWith(
              color: Colors.white,
            ),
        centerTitle: true,
        backgroundColor: Colors.blue,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.only(
          top: 20,
          left: 20,
          right: 20,
        ),
        children: [
          TextFormField(
            decoration: InputDecoration(
              label: const Text('Nama Lengkap'),
              prefixIcon: const Icon(Icons.person_sharp),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
          ),
          const SizedBox(height: 20),
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              label: const Text('Email'),
              prefixIcon: const Icon(Icons.email),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
          ),
          const SizedBox(height: 20),
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
            obscureText: true,
            decoration: InputDecoration(
              label: const Text('Password'),
              prefixIcon: const Icon(Icons.lock_sharp),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
          ),
          const SizedBox(height: 20),
          TextFormField(
            obscureText: true,
            decoration: InputDecoration(
              label: const Text('Konfirmasi Password'),
              prefixIcon: const Icon(Icons.phone_android_sharp),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
          ),
          const SizedBox(height: 20),
          DropdownButtonFormField(
            decoration: InputDecoration(
              label: const Text('Role'),
              prefixIcon: const Icon(Icons.person_sharp),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            value: 'user',
            items: const [
              DropdownMenuItem(
                value: 'admin',
                child: Text('Admin'),
              ),
              DropdownMenuItem(
                value: 'user',
                child: Text('User'),
              ),
            ],
            onChanged: (value) {},
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              minimumSize: const Size(300, 50),
            ),
            child: const Text('Buat Akun'),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const ListUserPage(),
            ),
          );
        },
        child: const Icon(Icons.list),
      ),
    );
  }
}

class ListUserPage extends StatelessWidget {
  const ListUserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Pertanyaan'),
        titleTextStyle: Theme.of(context).textTheme.headlineSmall!.copyWith(
              color: Colors.white,
            ),
        centerTitle: true,
        backgroundColor: Colors.blue,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.only(
          top: 10,
          left: 10,
          right: 10,
        ),
        itemCount: 10,
        itemBuilder: (context, index) {
          return Dismissible(
            key: Key('$index'),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: ExpansionTile(
                title: Text('User $index'),
                children: [
                  ListTile(
                    title: const Text('Nama Lengkap'),
                    subtitle: Text('User $index'),
                  ),
                  ListTile(
                    title: const Text('Email'),
                    subtitle: Text('Email $index'),
                  ),
                  ListTile(
                    title: const Text('Username'),
                    subtitle: Text('Username $index'),
                  ),
                  ListTile(
                    title: const Text('Role'),
                    subtitle: Text('Role $index'),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
