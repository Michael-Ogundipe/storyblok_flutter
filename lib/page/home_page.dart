import 'package:flutter/material.dart';
import 'package:storyblok_flutter/service/connect_content.dart';
import 'package:storyblok_flutter/widget/section.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: ConnectContent().content(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final content = snapshot.data!;
            return Scaffold(
              appBar: AppBar(
                title: Text('Science Genius',
                    style: Theme.of(context).textTheme.headlineLarge),
              ),
              body: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20.0, vertical: 10.0),
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.bottomLeft,
                      padding: const EdgeInsets.all(20),
                      width: 450,
                      height: 200,
                      decoration: BoxDecoration(
                        image: const DecorationImage(
                          image: NetworkImage(
                              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSfeCiZwoJs9hxlm4lQMkyFyPFuEekbAMMLEQ&usqp=CAU'),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: const Text(
                        'An educational mobile app that celebrates the brilliance of renowned scientists and their groundbreaking discoveries. ',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Section(
                        title: 'Scientist Profiles',
                        description:
                            'Delve into the lives of eminent scientists from various fields, including physics, chemistry, biology, and more. Each scientist profile provides a captivating biography, along with a portrait that brings their image to life.'),
                    const SizedBox(height: 20),
                    const Section(
                        title: 'Major Discoveries',
                        description:
                            'Uncover the most significant scientific contributions of each scientist. The app highlights their major discoveries, theories, and advancements that revolutionized our understanding of the natural world.'),
                  ],
                ),
              ),
            );
          } else {
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }
        });
  }
}
