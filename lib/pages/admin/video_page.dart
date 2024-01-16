import 'package:flutter/material.dart';

class VideoPage extends StatelessWidget {
  const VideoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Video'),
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
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.blue,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Icon(
                  Icons.video_collection_outlined,
                  size: 100,
                  color: Colors.blue,
                ),
                const SizedBox(height: 10),
                Text(
                  'Preview Video',
                  style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                        color: Colors.blue,
                      ),
                ),
              ],
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
              'Upload Video',
            ),
          ),
          const SizedBox(height: 20),
          TextFormField(
            maxLines: 3,
            decoration: InputDecoration(
              label: const Text('Deskripsi Video'),
              prefixIcon: const Icon(Icons.video_collection_outlined),
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
              minimumSize: const Size(200, 50),
            ),
            child: const Text(
              'Submit Video',
            ),
          ),
        ],
      ),
    );
  }
}
