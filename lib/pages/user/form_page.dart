import 'package:flutter/material.dart';

class FormPage extends StatefulWidget {
  const FormPage({super.key});

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Form'),
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
            readOnly: true,
            initialValue: 'Jl. Raya Bogor, Cibinong, Bogor, Jawa Barat',
            decoration: InputDecoration(
              labelText: 'Lokasi',
              prefixIcon: const Icon(Icons.location_on_outlined),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
          ),
          const SizedBox(height: 20),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: data.length,
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.only(bottom: 20),
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: Colors.blueGrey,
                  ),
                ),
                child: Column(
                  children: [
                    Text(
                      data[index].question,
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: Colors.black,
                            fontSize: 20,
                          ),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ChoiceChip(
                          label: const Text('Ya'),
                          selected: data[index].answer == 'Ya',
                          onSelected: (value) {
                            setState(() {
                              data[index].answer = 'Ya';
                            });
                          },
                        ),
                        ChoiceChip(
                          label: const Text('Tidak'),
                          selected: data[index].answer == 'Tidak',
                          onSelected: (value) {
                            setState(() {
                              data[index].answer = 'Tidak';
                            });
                          },
                        ),
                        ChoiceChip(
                          label: const Text('N/A'),
                          selected: data[index].answer == 'N/A',
                          onSelected: (value) {
                            setState(() {
                              data[index].answer = 'N/A';
                            });
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        minimumSize: const Size(double.infinity, 40),
                      ),
                      child: const Text('Upload Foto'),
                    ),
                  ],
                ),
              );
            },
          ),
          const SizedBox(height: 40),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              minimumSize: const Size(double.infinity, 40),
            ),
            child: const Text('Submit'),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}

class Question {
  final String question;
  String answer;

  Question({
    required this.question,
    required this.answer,
  });
}

List<Question> data = [
  Question(
    question: 'Apakah ada kebocoran?',
    answer: '',
  ),
  Question(
    question: 'Apakah ada kerusakan?',
    answer: '',
  ),
  Question(
    question: 'Apakah ada kebocoran?',
    answer: '',
  ),
  Question(
    question: 'Apakah ada kerusakan?',
    answer: '',
  ),
  Question(
    question: 'Apakah ada kebocoran?',
    answer: '',
  ),
  Question(
    question: 'Apakah ada kerusakan?',
    answer: '',
  ),
  Question(
    question: 'Apakah ada kebocoran?',
    answer: '',
  ),
  Question(
    question: 'Apakah ada kerusakan?',
    answer: '',
  ),
  Question(
    question: 'Apakah ada kebocoran?',
    answer: '',
  ),
  Question(
    question: 'Apakah ada kerusakan?',
    answer: '',
  ),
];
