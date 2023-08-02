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
            final story = snapshot.data!.story.content;
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
                        image: DecorationImage(
                          image: NetworkImage(story.headerImage.filename),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Text(
                        story.headerDescription,
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Section(
                      title: story.scienctistProfile,
                      description: story.profileDescription,
                    ),
                    const SizedBox(height: 20),
                    Section(
                      title: story.majorDiscovery,
                      description: story.discoveryDescription,
                    ),
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
