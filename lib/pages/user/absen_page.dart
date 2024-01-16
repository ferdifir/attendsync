import 'package:flutter/material.dart';

class AbsenPage extends StatelessWidget {
  AbsenPage({super.key});

  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Absen'),
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
          DropdownButtonFormField(
            decoration: InputDecoration(
              labelText: 'Lokasi',
              prefixIcon: const Icon(Icons.location_on_outlined),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            isDense: true,
            isExpanded: true,
            items: const [
              DropdownMenuItem(
                value: 'Jl. Raya Bogor, Cibinong, Bogor, Jawa Barat',
                child: Text('Jl. Raya Bogor, Cibinong, Bogor, Jawa Barat'),
              ),
              DropdownMenuItem(
                value: 'Jl. Raya Jakarta, Cibinong, Bogor, Jawa Barat',
                child: Text('Jl. Raya Jakarta, Cibinong, Bogor, Jawa Barat'),
              ),
              DropdownMenuItem(
                value: 'Jl. Raya Depok, Cibinong, Bogor, Jawa Barat',
                child: Text('Jl. Raya Depok, Cibinong, Bogor, Jawa Barat'),
              ),
            ],
            onChanged: (value) {},
          ),
          const SizedBox(height: 20),
          TextFormField(
            controller: _controller,
            readOnly: true,
            onTap: () {
              showDatePicker(
                context: context,
                initialDate: DateTime.now(),
                firstDate: DateTime.now(),
                lastDate: DateTime.now(),
              ).then((value) {
                _controller.text = value.toString().substring(0, 10);
              });
            },
            decoration: InputDecoration(
              labelText: 'Tanggal',
              prefixIcon: const Icon(Icons.calendar_today_outlined),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(double.infinity, 50),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            child: const Text('Submit'),
          ),
        ],
      ),
    );
  }
}
