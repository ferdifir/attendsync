import 'package:attendsync/pages/admin/question_page.dart';
import 'package:attendsync/pages/admin/report_attendance_page.dart';
import 'package:attendsync/pages/admin/report_question_page.dart';
import 'package:attendsync/pages/admin/user_page.dart';
import 'package:attendsync/pages/user/video_page.dart';
import 'package:flutter/material.dart';

class HomeAdminPage extends StatelessWidget {
  const HomeAdminPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu Admin'),
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
                    builder: (context) => const UserPage(),
                  ),
                );
              },
              child: SizedBox(
                width: 150,
                height: 170,
                child: Column(
                  children: [
                    const Icon(
                      Icons.person,
                      size: 100,
                      color: Colors.blueGrey,
                    ),
                    Text(
                      'User',
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
                    builder: (context) => const QuestionPage(),
                  ),
                );
              },
              child: SizedBox(
                width: 150,
                height: 170,
                child: Column(
                  children: [
                    const Icon(
                      Icons.question_answer,
                      size: 100,
                      color: Colors.blueGrey,
                    ),
                    Text(
                      'Question',
                      style: Theme.of(context).textTheme.headlineSmall!.copyWith(
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
                    builder: (context) => ReportQuestionPage(),
                  ),
                );
              },
              child: SizedBox(
                width: 150,
                height: 170,
                child: Column(
                  children: [
                    const Icon(
                      Icons.report,
                      size: 100,
                      color: Colors.blueGrey,
                    ),
                    Text(
                      'Report Question',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headlineSmall!.copyWith(
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
                    builder: (context) => ReportAttendancePage(),
                  ),
                );
              },
              child: SizedBox(
                width: 150,
                height: 170,
                child: Column(
                  children: [
                    const Icon(
                      Icons.date_range_rounded,
                      size: 100,
                      color: Colors.blueGrey,
                    ),
                    Text(
                      'Report Absensi',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headlineSmall!.copyWith(
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
                      Icons.video_call,
                      size: 100,
                      color: Colors.blueGrey,
                    ),
                    Text(
                      'Video',
                      style: Theme.of(context).textTheme.headlineSmall!.copyWith(
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
