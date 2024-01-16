import 'package:flutter/material.dart';

class ReportAttendancePage extends StatelessWidget {
  ReportAttendancePage({super.key});

  final TextEditingController _dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Laporan Kehadiran'),
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
            controller: _dateController,
            onTap: () {
              showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime(2000),
                lastDate: DateTime(2100),
              ).then((value) {
                _dateController.text = value.toString().substring(0, 10);
              });
            },
            readOnly: true,
            decoration: InputDecoration(
              label: const Text('Tanggal'),
              prefixIcon: const Icon(Icons.person_sharp),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
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
            child: const Text(
              'Generate Report',
            ),
          ),
          const SizedBox(height: 40),
          Container(
            padding: const EdgeInsets.all(10),
            height: 300,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: Colors.blue,
              ),
            ),
            child: Center(
              child: Text(
                'Preview Report',
                style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      color: Colors.blue,
                    ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
