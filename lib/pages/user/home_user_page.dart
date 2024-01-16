import 'package:attendsync/pages/user/absen_page.dart';
import 'package:attendsync/pages/user/form_page.dart';
import 'package:attendsync/pages/user/video_page.dart';
import 'package:flutter/material.dart';

class HomeUserPage extends StatelessWidget {
  const HomeUserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu User'),
        titleTextStyle: Theme.of(context).textTheme.headlineSmall!.copyWith(
              color: Colors.white,
            ),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Container(
        alignment: Alignment.topCenter,
        padding: const EdgeInsets.all(20),
        child: Wrap(
          spacing: 20,
          runSpacing: 20,
          children: [
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const VideoPage(),
                  ),
                );
              },
              child: SizedBox(
                width: 150,
                height: 170,
                child: Column(
                  children: [
                    const Icon(
                      Icons.video_collection_outlined,
                      size: 100,
                      color: Colors.blueGrey,
                    ),
                    Text(
                      'Video',
                      style:
                          Theme.of(context).textTheme.headlineSmall!.copyWith(
                                color: Colors.blueGrey,
                              ),
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const FormPage(),
                  ),
                );
              },
              child: SizedBox(
                width: 150,
                height: 170,
                child: Column(
                  children: [
                    const Icon(
                      Icons.question_answer_outlined,
                      size: 100,
                      color: Colors.blueGrey,
                    ),
                    Text(
                      'Form',
                      style:
                          Theme.of(context).textTheme.headlineSmall!.copyWith(
                                color: Colors.blueGrey,
                              ),
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AbsenPage(),
                  ),
                );
              },
              child: SizedBox(
                width: 150,
                height: 170,
                child: Column(
                  children: [
                    const Icon(
                      Icons.check_circle_outline,
                      size: 100,
                      color: Colors.blueGrey,
                    ),
                    Text(
                      'Absensi',
                      style:
                          Theme.of(context).textTheme.headlineSmall!.copyWith(
                                color: Colors.blueGrey,
                              ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}