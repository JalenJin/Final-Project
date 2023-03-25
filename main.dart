// Author: Zhaoqi Jin
// Version 1.0
// Since 03/15/2023
// Purpose: This app is used for toddlers and kids to learn about some common animals.
// This app contains 20 common animal pictures, sounds, and pronunciation of English words.
// The second part is a small game, a total of five rounds,
// each round will randomly appear an animal's name, and four animal pictures,
// the user can choose the picture that matches the animal's name,
// the answer is correct, the user will get 100 points,
// and the answer is wrong, fifty points will be deducted.
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart'; // Import the audio players
import 'find_animals_page.dart'; // Import find animals page class

void main() {
  runApp(const MyApp());
}
// This app is named 'Animal World'
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: 'Animal World App',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: const HomePage(),
    );
  }
}
// This is the home page of the app and contains two buttons,
// "Meet Animals" and "Find Animals".
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container( // Set the background image
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: NetworkImage('https://img.599ku.com/ele_banner2/81af0a162b70dd867a344c4daa069f4a.jpg'),
            fit: BoxFit.cover, // filling the whole container
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
              const Text(
                'Animal World',
                style: TextStyle(fontFamily: 'Orange', fontSize: 70, fontWeight: FontWeight.bold, color: Colors.lightBlue),
                textAlign: TextAlign.center,
              ),
            const SizedBox(height: 150),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const DogPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  shape: const StadiumBorder(),
                  minimumSize: const Size(double.infinity, 60),
                ),
                icon: const Icon(Icons.menu_book_outlined, color: Colors.white, size: 30),
                label: const Text(
                  'Meet Animals',
                  style: TextStyle(fontFamily:'Milk', color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const FindAnimalsPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  shape: const StadiumBorder(),
                  minimumSize: const Size(double.infinity, 60),
                ),
                icon: const Icon(Icons.search, color: Colors.white, size: 30),
                label: const Text(
                    'Find Animals',
                  style: TextStyle(fontFamily:'Milk', color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
// In order to play audio, AudioCache
// and AudioPlayer classes of the audioplayers package were used
// AudioCache is used to play local audio files
final AudioCache _audioCache = AudioCache(prefix: 'assets/');
// AudioPlayer is used to play online audio files
final AudioPlayer _audioPlayer = AudioPlayer();
// This function is used to play online audio files
Future<void> _playOnlineAudio(String url) async {
  await _audioPlayer.play(url);
}
// This function is used to play local audio files
Future<void> _playLocalAudio(String fileName) async {
  await _audioCache.play(fileName);
}
// The dog page is used to present the dog's picture, sound, and pronunciation.
class DogPage extends StatelessWidget {
  const DogPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container( // Used to set the background image
        decoration: const BoxDecoration( // Used to set the detailed properties of the background image
          image: DecorationImage(
            image: NetworkImage('https://img.599ku.com/ele_banner2/81af0a162b70dd867a344c4daa069f4a.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack( // Stack is used to place components in specific locations
          children: [
            Center(
              child: Image.network( // The dog's picture
                'http://p9.itc.cn/images01/20200715/520e00314a854ada8fc45e2b6b57ac60.png',
                width: 400,
                height: 400,
              ),
            ),
            Positioned( // set the button to be in the upper left section
              top: MediaQuery.of(context).padding.top + 80,
              left: 10,
              child: ElevatedButton.icon( // Used to create the button with an icon
                onPressed: () {
                  Navigator.pop(context); // Back to previous page
                },
                icon: const Icon(Icons.arrow_back, size: 25, color: Colors.white),
                label: const Text(''),
                style: ElevatedButton.styleFrom( // Set the style of the button
                  fixedSize: const Size(60, 60),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                ),
              ),
              ),
            ),
            Positioned( // Set the 'dog' content to be in the upper center
              top: MediaQuery.of(context).padding.top + 80,
              left: MediaQuery.of(context).size.width / 2 - 35,
              child: const Text(
                'Dog',
                style: TextStyle(fontFamily: 'Milk', fontSize: 50, fontWeight: FontWeight.bold, color: Colors.lightBlue),
              ),
            ),
            Positioned( // Set the button to be in the upper right section
              top: MediaQuery.of(context).padding.top + 80,
              right: 10,
              child: ElevatedButton.icon( // Used to create the button with an icon
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const CatPage()),
                  ); // Go to the next page
                },
                  icon: const Icon(Icons.arrow_forward, size: 25, color: Colors.white),
                label: const Text(''),
                style: ElevatedButton.styleFrom( // Set the style of the button
                  fixedSize: const Size(60, 60),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
              ),
              ),
            Positioned( // set the button to be in the lower left section
              bottom: 120,
              left: 10,
              child:
                  ElevatedButton.icon(
                    onPressed: () { // Back to the home page
                      Navigator.popUntil(context, ModalRoute.withName('/'));
                    },
                    icon: const Icon(Icons.home, color: Colors.white, size: 25),
                    label: const Text(''),
                    style: ElevatedButton.styleFrom(
                      fixedSize: const Size(60, 60),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                  ),
            ),
                  Positioned( // Set the button to be in the lower center
                    bottom: 120,
                    left: MediaQuery.of(context).size.width / 2 - 35,
                    child: ElevatedButton.icon( // Play the animal's sound
                      onPressed: () {
                        _playLocalAudio('dog_barking.mp3');
                      },
                      icon: const Icon(Icons.volume_up, color: Colors.white, size: 25),
                      label: const Text(''),
                      style: ElevatedButton.styleFrom( // Set the button style
                        fixedSize: const Size(60, 60),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                    ),
                  ),
                  Positioned( // Set the button to be in the lower right section
                    bottom: 120,
                    right: 10,
                    child: ElevatedButton.icon( // Play the pronunciation of dog
                      onPressed: () {
                        _playOnlineAudio('https://ssl.gstatic.com/dictionary/static/sounds/oxford/dog--_us_1.mp3');
                      },
                      icon: const Icon(Icons.record_voice_over_outlined, color: Colors.white, size: 25),
                      label: const Text(''),
                      style: ElevatedButton.styleFrom( // Set the button style
                        fixedSize: const Size(60, 60),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
        );
  }
}// End of Dog class

// The remaining 19 classes have the same style and design as the dog class,
// only the animal names, pictures, sounds and English pronunciations replaced.
class CatPage extends StatelessWidget {
  const CatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: NetworkImage('https://img.599ku.com/ele_banner2/81af0a162b70dd867a344c4daa069f4a.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            Center(
              child: Image.network(
                'https://picx.zhimg.com/v2-22cf461858198227392b899b96d8e9cb_720w.jpg?source=172ae18b',
                width: 400,
                height: 400,
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).padding.top + 80,
              left: 10,
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back, size: 25, color: Colors.white),
                label: const Text(''),
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(60, 60),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).padding.top + 80,
              left: MediaQuery.of(context).size.width / 2 - 35,
              child: const Text(
                'Cat',
                style: TextStyle(fontFamily: 'Milk', fontSize: 50, fontWeight: FontWeight.bold, color: Colors.lightBlue),
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).padding.top + 80,
              right: 10,
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const HenPage()),
                  );
                },
                icon: const Icon(Icons.arrow_forward, size: 25, color: Colors.white),
                label: const Text(''),
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(60, 60),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 120,
              left: 10,
              child:
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.popUntil(context, ModalRoute.withName('/'));
                },
                icon: const Icon(Icons.home, color: Colors.white, size: 25),
                label: const Text(''),
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(60, 60),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 120,
              left: MediaQuery.of(context).size.width / 2 - 35,
              child: ElevatedButton.icon(
                onPressed: () {
                  _playLocalAudio('cat_meowing.mp3');
                },
                icon: const Icon(Icons.volume_up, color: Colors.white, size: 25),
                label: const Text(''),
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(60, 60),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 120,
              right: 10,
              child: ElevatedButton.icon(
                onPressed: () {
                  _playOnlineAudio('https://ssl.gstatic.com/dictionary/static/sounds/oxford/cat--_us_1.mp3');
                },
                icon: const Icon(Icons.record_voice_over_outlined, color: Colors.white, size: 25),
                label: const Text(''),
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(60, 60),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}// End of Cat class

class HenPage extends StatelessWidget {
  const HenPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: NetworkImage('https://img.599ku.com/ele_banner2/81af0a162b70dd867a344c4daa069f4a.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            Center(
              child: Image.network(
                'https://backyardpoultry.iamcountryside.com/wp-content/uploads/sites/3/2019/03/iStock-509077517.jpg',
                width: 400,
                height: 400,
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).padding.top + 80,
              left: 10,
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back, size: 25, color: Colors.white),
                label: const Text(''),
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(60, 60),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).padding.top + 80,
              left: MediaQuery.of(context).size.width / 2 - 35,
              child: const Text(
                'Hen',
                style: TextStyle(fontFamily: 'Milk', fontSize: 50, fontWeight: FontWeight.bold, color: Colors.lightBlue),
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).padding.top + 80,
              right: 10,
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const GoatPage()),
                  );
                },
                icon: const Icon(Icons.arrow_forward, size: 25, color: Colors.white),
                label: const Text(''),
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(60, 60),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 120,
              left: 10,
              child:
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.popUntil(context, ModalRoute.withName('/'));
                },
                icon: const Icon(Icons.home, color: Colors.white, size: 25),
                label: const Text(''),
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(60, 60),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 120,
              left: MediaQuery.of(context).size.width / 2 - 35,
              child: ElevatedButton.icon(
                onPressed: () {
                  _playLocalAudio('hen_sound.mp3');
                },
                icon: const Icon(Icons.volume_up, color: Colors.white, size: 25),
                label: const Text(''),
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(60, 60),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 120,
              right: 10,
              child: ElevatedButton.icon(
                onPressed: () {
                  _playOnlineAudio('https://ssl.gstatic.com/dictionary/static/sounds/oxford/hen--_us_1.mp3');
                },
                icon: const Icon(Icons.record_voice_over_outlined, color: Colors.white, size: 25),
                label: const Text(''),
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(60, 60),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}// End of Hen class

class GoatPage extends StatelessWidget {
  const GoatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: NetworkImage('https://img.599ku.com/ele_banner2/81af0a162b70dd867a344c4daa069f4a.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            Center(
              child: Image.network(
                'https://a-z-animals.com/media/2021/12/lovely-white-baby-goat-running-on-grass-picture-id1281182694-1024x535.jpg',
                width: 400,
                height: 400,
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).padding.top + 80,
              left: 10,
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back, size: 25, color: Colors.white),
                label: const Text(''),
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(60, 60),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).padding.top + 80,
              left: MediaQuery.of(context).size.width / 2 - 40,
              child: const Text(
                'Goat',
                style: TextStyle(fontFamily: 'Milk', fontSize: 50, fontWeight: FontWeight.bold, color: Colors.lightBlue),
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).padding.top + 80,
              right: 10,
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const TigerPage()),
                  );
                },
                icon: const Icon(Icons.arrow_forward, size: 25, color: Colors.white),
                label: const Text(''),
                style: ElevatedButton.styleFrom(

                  fixedSize: const Size(60, 60),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 120,
              left: 10,
              child:
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.popUntil(context, ModalRoute.withName('/'));
                },
                icon: const Icon(Icons.home, color: Colors.white, size: 25),
                label: const Text(''),
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(60, 60),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 120,
              left: MediaQuery.of(context).size.width / 2 - 35,
              child: ElevatedButton.icon(
                onPressed: () {
                  _playLocalAudio('goat_mev.mp3');
                },
                icon: const Icon(Icons.volume_up, color: Colors.white, size: 25),
                label: const Text(''),
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(60, 60),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 120,
              right: 10,
              child: ElevatedButton.icon(
                onPressed: () {
                  _playOnlineAudio('https://ssl.gstatic.com/dictionary/static/sounds/oxford/goat--_us_1.mp3');
                },
                icon: const Icon(Icons.record_voice_over_outlined, color: Colors.white, size: 25),
                label: const Text(''),
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(60, 60),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}// End of Goat class

class TigerPage extends StatelessWidget {
  const TigerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: NetworkImage('https://img.599ku.com/ele_banner2/81af0a162b70dd867a344c4daa069f4a.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            Center(
              child: Image.network(
                'https://cdn.artphotolimited.com/images/5cdad65d9c936e3bb1f33485/300x300/petit-tigre.jpg',
                width: 400,
                height: 400,
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).padding.top + 80,
              left: 10,
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back, size: 25, color: Colors.white),
                label: const Text(''),
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(60, 60),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).padding.top + 80,
              left: 160,
              child: const Text(
                'Tiger',
                style: TextStyle(fontFamily: 'Milk', fontSize: 50, fontWeight: FontWeight.bold, color: Colors.lightBlue),
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).padding.top + 80,
              right: 10,
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const LionPage()),
                  );
                },
                icon: const Icon(Icons.arrow_forward, size: 25, color: Colors.white),
                label: const Text(''),
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(60, 60),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 120,
              left: 10,
              child:
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.popUntil(context, ModalRoute.withName('/'));
                },
                icon: const Icon(Icons.home, color: Colors.white, size: 25),
                label: const Text(''),
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(60, 60),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 120,
              left: MediaQuery.of(context).size.width / 2 - 35,
              child: ElevatedButton.icon(
                onPressed: () {
                  _playLocalAudio('tiger_sound.mp3');
                },
                icon: const Icon(Icons.volume_up, color: Colors.white, size: 25),
                label: const Text(''),
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(60, 60),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 120,
              right: 10,
              child: ElevatedButton.icon(
                onPressed: () {
                  _playOnlineAudio('https://ssl.gstatic.com/dictionary/static/sounds/oxford/tiger--_us_1.mp3');
                },
                icon: const Icon(Icons.record_voice_over_outlined, color: Colors.white, size: 25),
                label: const Text(''),
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(60, 60),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}// End of Tiger class

class LionPage extends StatelessWidget {
  const LionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: NetworkImage('https://img.599ku.com/ele_banner2/81af0a162b70dd867a344c4daa069f4a.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            Center(
              child: Image.network(
                'https://freedesignfile.com/upload/2017/10/Walking-little-lion-Stock-Photo.jpg',
                width: 400,
                height: 400,
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).padding.top + 80,
              left: 10,
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back, size: 25, color: Colors.white),
                label: const Text(''),
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(60, 60),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).padding.top + 80,
              left: MediaQuery.of(context).size.width / 2 - 40,
              child: const Text(
                'Lion',
                style: TextStyle(fontFamily: 'Milk', fontSize: 50, fontWeight: FontWeight.bold, color: Colors.lightBlue),
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).padding.top + 80,
              right: 10,
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ElephantPage()),
                  );
                },
                icon: const Icon(Icons.arrow_forward, size: 25, color: Colors.white),
                label: const Text(''),
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(60, 60),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 120,
              left: 10,
              child:
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.popUntil(context, ModalRoute.withName('/'));
                },
                icon: const Icon(Icons.home, color: Colors.white, size: 25),
                label: const Text(''),
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(60, 60),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 120,
              left: MediaQuery.of(context).size.width / 2 - 35,
              child: ElevatedButton.icon(
                onPressed: () {
                  _playLocalAudio('lion_roar.mp3');
                },
                icon: const Icon(Icons.volume_up, color: Colors.white, size: 25),
                label: const Text(''),
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(60, 60),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 120,
              right: 10,
              child: ElevatedButton.icon(
                onPressed: () {
                  _playOnlineAudio('https://ssl.gstatic.com/dictionary/static/sounds/oxford/lion--_us_1.mp3');
                },
                icon: const Icon(Icons.record_voice_over_outlined, color: Colors.white, size: 25),
                label: const Text(''),
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(60, 60),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}// End of Lion class

class ElephantPage extends StatelessWidget {
  const ElephantPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: NetworkImage('https://img.599ku.com/ele_banner2/81af0a162b70dd867a344c4daa069f4a.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            Center(
              child: Image.network(
                'https://blog.humanesociety.org/wp-content/uploads/2022/04/HSI-Makalali-154_414838-scaled.jpg',
                width: 400,
                height: 400,
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).padding.top + 80,
              left: 10,
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back, size: 25, color: Colors.white),
                label: const Text(''),
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(60, 60),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).padding.top + 80,
              left: 130,
              child: const Text(
                'Elephant',
                style: TextStyle(fontFamily: 'Milk', fontSize: 50, fontWeight: FontWeight.bold, color: Colors.lightBlue),
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).padding.top + 80,
              right: 10,
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const CowPage()),
                  );
                },
                icon: const Icon(Icons.arrow_forward, size: 25, color: Colors.white),
                label: const Text(''),
                style: ElevatedButton.styleFrom(

                  fixedSize: const Size(60, 60),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 120,
              left: 10,
              child:
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.popUntil(context, ModalRoute.withName('/'));
                },
                icon: const Icon(Icons.home, color: Colors.white, size: 25),
                label: const Text(''),
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(60, 60),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 120,
              left: MediaQuery.of(context).size.width / 2 - 35,
              child: ElevatedButton.icon(
                onPressed: () {
                  _playLocalAudio('elephant_sound.mp3');
                },
                icon: const Icon(Icons.volume_up, color: Colors.white, size: 25),
                label: const Text(''),
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(60, 60),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 120,
              right: 10,
              child: ElevatedButton.icon(
                onPressed: () {
                  _playOnlineAudio('https://ssl.gstatic.com/dictionary/static/sounds/oxford/elephant--_us_1.mp3');
                },
                icon: const Icon(Icons.record_voice_over_outlined, color: Colors.white, size: 25),
                label: const Text(''),
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(60, 60),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}// End of Elephant class

class CowPage extends StatelessWidget {
  const CowPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: NetworkImage('https://img.599ku.com/ele_banner2/81af0a162b70dd867a344c4daa069f4a.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            Center(
              child: Image.network(
                'https://cf-images.us-east-1.prod.boltdns.net/v1/static/3281700261001/3d9d98eb-4554-4f45-8efd-8cf6ef41cca7/5e98be74-cc41-487f-b7e7-5ef0c9442b88/1280x720/match/image.jpg',
                width: 400,
                height: 400,
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).padding.top + 80,
              left: 10,
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back, size: 25, color: Colors.white),
                label: const Text(''),
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(60, 60),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).padding.top + 80,
              left: MediaQuery.of(context).size.width / 2 - 35,
              child: const Text(
                'Cow',
                style: TextStyle(fontFamily: 'Milk', fontSize: 50, fontWeight: FontWeight.bold, color: Colors.lightBlue),
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).padding.top + 80,
              right: 10,
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const DuckPage()),
                  );
                },
                icon: const Icon(Icons.arrow_forward, size: 25, color: Colors.white),
                label: const Text(''),
                style: ElevatedButton.styleFrom(

                  fixedSize: const Size(60, 60),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 120,
              left: 10,
              child:
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.popUntil(context, ModalRoute.withName('/'));
                },
                icon: const Icon(Icons.home, color: Colors.white, size: 25),
                label: const Text(''),
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(60, 60),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 120,
              left: MediaQuery.of(context).size.width / 2 - 35,
              child: ElevatedButton.icon(
                onPressed: () {
                  _playLocalAudio('cow_sound.mp3');
                },
                icon: const Icon(Icons.volume_up, color: Colors.white, size: 25),
                label: const Text(''),
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(60, 60),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 120,
              right: 10,
              child: ElevatedButton.icon(
                onPressed: () {
                  _playOnlineAudio('https://ssl.gstatic.com/dictionary/static/sounds/oxford/cow--_us_1.mp3');
                },
                icon: const Icon(Icons.record_voice_over_outlined, color: Colors.white, size: 25),
                label: const Text(''),
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(60, 60),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}// End of Cow class

class DuckPage extends StatelessWidget {
  const DuckPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: NetworkImage('https://img.599ku.com/ele_banner2/81af0a162b70dd867a344c4daa069f4a.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            Center(
              child: Image.network(
                'https://media.australian.museum/media/dd/images/mallard.ef584b7.width-800.8b55bd7.jpg',
                width: 400,
                height: 400,
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).padding.top + 80,
              left: 10,
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back, size: 25, color: Colors.white),
                label: const Text(''),
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(60, 60),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).padding.top + 80,
              left: MediaQuery.of(context).size.width / 2 - 40,
              child: const Text(
                'Duck',
                style: TextStyle(fontFamily: 'Milk', fontSize: 50, fontWeight: FontWeight.bold, color: Colors.lightBlue),
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).padding.top + 80,
              right: 10,
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const HorsePage()),
                  );
                },
                icon: const Icon(Icons.arrow_forward, size: 25, color: Colors.white),
                label: const Text(''),
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(60, 60),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 120,
              left: 10,
              child:
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.popUntil(context, ModalRoute.withName('/'));
                },
                icon: const Icon(Icons.home, color: Colors.white, size: 25),
                label: const Text(''),
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(60, 60),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 120,
              left: MediaQuery.of(context).size.width / 2 - 35,
              child: ElevatedButton.icon(
                onPressed: () {
                  _playLocalAudio('duck_quack.mp3');
                },
                icon: const Icon(Icons.volume_up, color: Colors.white, size: 25),
                label: const Text(''),
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(60, 60),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 120,
              right: 10,
              child: ElevatedButton.icon(
                onPressed: () {
                  _playOnlineAudio('https://ssl.gstatic.com/dictionary/static/sounds/oxford/duck--_us_1.mp3');
                },
                icon: const Icon(Icons.record_voice_over_outlined, color: Colors.white, size: 25),
                label: const Text(''),
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(60, 60),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}// End of Duck class

class HorsePage extends StatelessWidget {
  const HorsePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: NetworkImage('https://img.599ku.com/ele_banner2/81af0a162b70dd867a344c4daa069f4a.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            Center(
              child: Image.network(
                'https://cdn.shopify.com/s/files/1/0512/2529/7057/files/HG-hot-fizzy-horse-blog-281021-002.jpg?v=1642636393',
                width: 400,
                height: 400,
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).padding.top + 80,
              left: 10,
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back, size: 25, color: Colors.white),
                label: const Text(''),
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(60, 60),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).padding.top + 80,
              left: 150,
              child: const Text(
                'Horse',
                style: TextStyle(fontFamily: 'Milk', fontSize: 50, fontWeight: FontWeight.bold, color: Colors.lightBlue),
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).padding.top + 80,
              right: 10,
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const PigPage()),
                  );
                },
                icon: const Icon(Icons.arrow_forward, size: 25, color: Colors.white),
                label: const Text(''),
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(60, 60),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 120,
              left: 10,
              child:
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.popUntil(context, ModalRoute.withName('/'));
                },
                icon: const Icon(Icons.home, color: Colors.white, size: 25),
                label: const Text(''),
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(60, 60),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 120,
              left: MediaQuery.of(context).size.width / 2 - 35,
              child: ElevatedButton.icon(
                onPressed: () {
                  _playLocalAudio('horse_sound.mp3');
                },
                icon: const Icon(Icons.volume_up, color: Colors.white, size: 25),
                label: const Text(''),
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(60, 60),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 120,
              right: 10,
              child: ElevatedButton.icon(
                onPressed: () {
                  _playOnlineAudio('https://ssl.gstatic.com/dictionary/static/sounds/oxford/horse--_us_1.mp3');
                },
                icon: const Icon(Icons.record_voice_over_outlined, color: Colors.white, size: 25),
                label: const Text(''),
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(60, 60),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}// End of Horse class

class PigPage extends StatelessWidget {
  const PigPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: NetworkImage('https://img.599ku.com/ele_banner2/81af0a162b70dd867a344c4daa069f4a.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            Center(
              child: Image.network(
                'https://www.treehugger.com/thmb/mJQG8jpmRwB1NDZbhQlaFzoYZXM=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/piglet-grass-dandelions-01-b21d7ef8f881496f8346dbe01859537e.jpg',
                width: 400,
                height: 400,
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).padding.top + 80,
              left: 10,
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back, size: 25, color: Colors.white),
                label: const Text(''),
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(60, 60),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).padding.top + 80,
              left: MediaQuery.of(context).size.width / 2 - 35,
              child: const Text(
                'Pig',
                style: TextStyle(fontFamily: 'Milk', fontSize: 50, fontWeight: FontWeight.bold, color: Colors.lightBlue),
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).padding.top + 80,
              right: 10,
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const PandaPage()),
                  );
                },
                icon: const Icon(Icons.arrow_forward, size: 25, color: Colors.white),
                label: const Text(''),
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(60, 60),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 120,
              left: 10,
              child:
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.popUntil(context, ModalRoute.withName('/'));
                },
                icon: const Icon(Icons.home, color: Colors.white, size: 25),
                label: const Text(''),
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(60, 60),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 120,
              left: MediaQuery.of(context).size.width / 2 - 35,
              child: ElevatedButton.icon(
                onPressed: () {
                  _playLocalAudio('pig_sound.mp3');
                },
                icon: const Icon(Icons.volume_up, color: Colors.white, size: 25),
                label: const Text(''),
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(60, 60),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 120,
              right: 10,
              child: ElevatedButton.icon(
                onPressed: () {
                  _playOnlineAudio('https://ssl.gstatic.com/dictionary/static/sounds/oxford/pig--_us_1.mp3');
                },
                icon: const Icon(Icons.record_voice_over_outlined, color: Colors.white, size: 25),
                label: const Text(''),
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(60, 60),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}// End of Pig class

class PandaPage extends StatelessWidget {
  const PandaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: NetworkImage('https://img.599ku.com/ele_banner2/81af0a162b70dd867a344c4daa069f4a.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            Center(
              child: Image.network(
                'https://www.treehugger.com/thmb/38yOs2_WMKpehD1NPB5aBOvTEmo=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/giant-panda-96cd8616b8304fbba5b9bbe59545ecf7.jpg',
                width: 400,
                height: 400,
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).padding.top + 80,
              left: 10,
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back, size: 25, color: Colors.white),
                label: const Text(''),
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(60, 60),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).padding.top + 80,
              left: 145,
              child: const Text(
                'Panda',
                style: TextStyle(fontFamily: 'Milk', fontSize: 50, fontWeight: FontWeight.bold, color: Colors.lightBlue),
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).padding.top + 80,
              right: 10,
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const RabbitPage()),
                  );
                },
                icon: const Icon(Icons.arrow_forward, size: 25, color: Colors.white),
                label: const Text(''),
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(60, 60),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 120,
              left: 10,
              child:
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.popUntil(context, ModalRoute.withName('/'));
                },
                icon: const Icon(Icons.home, color: Colors.white, size: 25),
                label: const Text(''),
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(60, 60),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 120,
              left: MediaQuery.of(context).size.width / 2 - 35,
              child: ElevatedButton.icon(
                onPressed: () {
                  _playLocalAudio('panda_sound.mp3');
                },
                icon: const Icon(Icons.volume_up, color: Colors.white, size: 25),
                label: const Text(''),
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(60, 60),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 120,
              right: 10,
              child: ElevatedButton.icon(
                onPressed: () {
                  _playOnlineAudio('https://ssl.gstatic.com/dictionary/static/sounds/oxford/panda--_us_1.mp3');
                },
                icon: const Icon(Icons.record_voice_over_outlined, color: Colors.white, size: 25),
                label: const Text(''),
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(60, 60),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}// End of Panda class

class RabbitPage extends StatelessWidget {
  const RabbitPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: NetworkImage('https://img.599ku.com/ele_banner2/81af0a162b70dd867a344c4daa069f4a.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            Center(
              child: Image.network(
                'https://upload.wikimedia.org/wikipedia/commons/3/37/Oryctolagus_cuniculus_Tasmania_2.jpg',
                width: 400,
                height: 400,
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).padding.top + 80,
              left: 10,
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back, size: 25, color: Colors.white),
                label: const Text(''),
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(60, 60),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).padding.top + 80,
              left: 140,
              child: const Text(
                'Rabbit',
                style: TextStyle(fontFamily: 'Milk', fontSize: 50, fontWeight: FontWeight.bold, color: Colors.lightBlue),
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).padding.top + 80,
              right: 10,
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const MonkeyPage()),
                  );
                },
                icon: const Icon(Icons.arrow_forward, size: 25, color: Colors.white),
                label: const Text(''),
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(60, 60),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 120,
              left: 10,
              child:
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.popUntil(context, ModalRoute.withName('/'));
                },
                icon: const Icon(Icons.home, color: Colors.white, size: 25),
                label: const Text(''),
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(60, 60),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 120,
              left: MediaQuery.of(context).size.width / 2 - 35,
              child: ElevatedButton.icon(
                onPressed: () {
                  _playLocalAudio('rabbit_sound.mp3');
                },
                icon: const Icon(Icons.volume_up, color: Colors.white, size: 25),
                label: const Text(''),
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(60, 60),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 120,
              right: 10,
              child: ElevatedButton.icon(
                onPressed: () {
                  _playOnlineAudio('https://ssl.gstatic.com/dictionary/static/sounds/oxford/rabbit--_us_1.mp3');
                },
                icon: const Icon(Icons.record_voice_over_outlined, color: Colors.white, size: 25),
                label: const Text(''),
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(60, 60),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}// End of Rabbit class

class MonkeyPage extends StatelessWidget {
  const MonkeyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: NetworkImage('https://img.599ku.com/ele_banner2/81af0a162b70dd867a344c4daa069f4a.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            Center(
              child: Image.network(
                'https://i.guim.co.uk/img/media/f84c4ae6dafddee667fb3090ff53f0038479e400/0_688_4771_2862/master/4771.jpg?width=1200&height=900&quality=85&auto=format&fit=crop&s=9f9786ac021cb2f8cf5e8be1e7840003',
                width: 400,
                height: 400,
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).padding.top + 80,
              left: 10,
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back, size: 25, color: Colors.white),
                label: const Text(''),
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(60, 60),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).padding.top + 80,
              left: 140,
              child: const Text(
                'Monkey',
                style: TextStyle(fontFamily: 'Milk', fontSize: 50, fontWeight: FontWeight.bold, color: Colors.lightBlue),
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).padding.top + 80,
              right: 10,
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const PenguinPage()),
                  );
                },
                icon: const Icon(Icons.arrow_forward, size: 25, color: Colors.white),
                label: const Text(''),
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(60, 60),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 120,
              left: 10,
              child:
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.popUntil(context, ModalRoute.withName('/'));
                },
                icon: const Icon(Icons.home, color: Colors.white, size: 25),
                label: const Text(''),
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(60, 60),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 120,
              left: MediaQuery.of(context).size.width / 2 - 35,
              child: ElevatedButton.icon(
                onPressed: () {
                  _playLocalAudio('monkey_sound.mp3');
                },
                icon: const Icon(Icons.volume_up, color: Colors.white, size: 25),
                label: const Text(''),
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(60, 60),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 120,
              right: 10,
              child: ElevatedButton.icon(
                onPressed: () {
                  _playOnlineAudio('https://ssl.gstatic.com/dictionary/static/sounds/oxford/monkey--_us_1.mp3');
                },
                icon: const Icon(Icons.record_voice_over_outlined, color: Colors.white, size: 25),
                label: const Text(''),
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(60, 60),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}// End of Monkey class

class PenguinPage extends StatelessWidget {
  const PenguinPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: NetworkImage('https://img.599ku.com/ele_banner2/81af0a162b70dd867a344c4daa069f4a.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            Center(
              child: Image.network(
                'https://www.whatsnewsmedia.com/wp-content/uploads/2022/01/photo_2022-01-11_22-43-22.jpg',
                width: 400,
                height: 400,
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).padding.top + 80,
              left: 10,
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back, size: 25, color: Colors.white),
                label: const Text(''),
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(60, 60),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).padding.top + 80,
              left: 130,
              child: const Text(
                'Penguin',
                style: TextStyle(fontFamily: 'Milk', fontSize: 50, fontWeight: FontWeight.bold, color: Colors.lightBlue),
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).padding.top + 80,
              right: 10,
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const BearPage()),
                  );
                },
                icon: const Icon(Icons.arrow_forward, size: 25, color: Colors.white),
                label: const Text(''),
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(60, 60),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 120,
              left: 10,
              child:
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.popUntil(context, ModalRoute.withName('/'));
                },
                icon: const Icon(Icons.home, color: Colors.white, size: 25),
                label: const Text(''),
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(60, 60),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 120,
              left: MediaQuery.of(context).size.width / 2 - 35,
              child: ElevatedButton.icon(
                onPressed: () {
                  _playLocalAudio('penguin_sound.mp3');
                },
                icon: const Icon(Icons.volume_up, color: Colors.white, size: 25),
                label: const Text(''),
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(60, 60),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 120,
              right: 10,
              child: ElevatedButton.icon(
                onPressed: () {
                  _playOnlineAudio('https://ssl.gstatic.com/dictionary/static/sounds/oxford/penguin--_us_1.mp3');
                },
                icon: const Icon(Icons.record_voice_over_outlined, color: Colors.white, size: 25),
                label: const Text(''),
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(60, 60),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}// End of Penguin class

class BearPage extends StatelessWidget {
  const BearPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: NetworkImage('https://img.599ku.com/ele_banner2/81af0a162b70dd867a344c4daa069f4a.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            Center(
              child: Image.network(
                'https://cloudfront-us-east-1.images.arcpublishing.com/advancelocal/WV2AST74END4TFIUKH7MALIYGQ.jpg',
                width: 400,
                height: 400,
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).padding.top + 80,
              left: 10,
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back, size: 25, color: Colors.white),
                label: const Text(''),
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(60, 60),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).padding.top + 80,
              left: 160,
              child: const Text(
                'Bear',
                style: TextStyle(fontFamily: 'Milk', fontSize: 50, fontWeight: FontWeight.bold, color: Colors.lightBlue),
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).padding.top + 80,
              right: 10,
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const KoalaPage()),
                  );
                },
                icon: const Icon(Icons.arrow_forward, size: 25, color: Colors.white),
                label: const Text(''),
                style: ElevatedButton.styleFrom(

                  fixedSize: const Size(60, 60),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 120,
              left: 10,
              child:
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.popUntil(context, ModalRoute.withName('/'));
                },
                icon: const Icon(Icons.home, color: Colors.white, size: 25),
                label: const Text(''),
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(60, 60),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 120,
              left: MediaQuery.of(context).size.width / 2 - 35,
              child: ElevatedButton.icon(
                onPressed: () {
                  _playLocalAudio('bear_roar.mp3');
                },
                icon: const Icon(Icons.volume_up, color: Colors.white, size: 25),
                label: const Text(''),
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(60, 60),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 120,
              right: 10,
              child: ElevatedButton.icon(
                onPressed: () {
                  _playOnlineAudio('https://ssl.gstatic.com/dictionary/static/sounds/oxford/bear--_us_1.mp3');
                },
                icon: const Icon(Icons.record_voice_over_outlined, color: Colors.white, size: 25),
                label: const Text(''),
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(60, 60),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}// End of Bear class

class KoalaPage extends StatelessWidget {
  const KoalaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: NetworkImage('https://img.599ku.com/ele_banner2/81af0a162b70dd867a344c4daa069f4a.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            Center(
              child: Image.network(
                'https://www.wwf.org.uk/sites/default/files/styles/social_share_image/public/2022-05/_WW236934.jpg?itok=wsulCklO',
                width: 400,
                height: 400,
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).padding.top + 80,
              left: 10,
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back, size: 25, color: Colors.white),
                label: const Text(''),
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(60, 60),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).padding.top + 80,
              left: 160,
              child: const Text(
                'Koala',
                style: TextStyle(fontFamily: 'Milk', fontSize: 50, fontWeight: FontWeight.bold, color: Colors.lightBlue),
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).padding.top + 80,
              right: 10,
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const PeacockPage()),
                  );
                },
                icon: const Icon(Icons.arrow_forward, size: 25, color: Colors.white),
                label: const Text(''),
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(60, 60),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 120,
              left: 10,
              child:
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.popUntil(context, ModalRoute.withName('/'));
                },
                icon: const Icon(Icons.home, color: Colors.white, size: 25),
                label: const Text(''),
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(60, 60),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 120,
              left: MediaQuery.of(context).size.width / 2 - 35,
              child: ElevatedButton.icon(
                onPressed: () {
                  _playLocalAudio('koala_sound.mp3');
                },
                icon: const Icon(Icons.volume_up, color: Colors.white, size: 25),
                label: const Text(''),
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(60, 60),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 120,
              right: 10,
              child: ElevatedButton.icon(
                onPressed: () {
                  _playOnlineAudio('https://ssl.gstatic.com/dictionary/static/sounds/oxford/koala--_us_1.mp3');
                },
                icon: const Icon(Icons.record_voice_over_outlined, color: Colors.white, size: 25),
                label: const Text(''),
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(60, 60),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}// End of Koala class

class PeacockPage extends StatelessWidget {
  const PeacockPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: NetworkImage('https://img.599ku.com/ele_banner2/81af0a162b70dd867a344c4daa069f4a.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            Center(
              child: Image.network(
                'https://media.hswstatic.com/eyJidWNrZXQiOiJjb250ZW50Lmhzd3N0YXRpYy5jb20iLCJrZXkiOiJnaWZcL3BlYWNvY2stZmVhdGhlcnMuanBnIiwiZWRpdHMiOnsicmVzaXplIjp7IndpZHRoIjo4Mjh9fX0=',
                width: 400,
                height: 400,
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).padding.top + 80,
              left: 10,
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back, size: 25, color: Colors.white),
                label: const Text(''),
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(60, 60),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).padding.top + 80,
              left: 130,
              child: const Text(
                'Peacock',
                style: TextStyle(fontFamily: 'Milk', fontSize: 50, fontWeight: FontWeight.bold, color: Colors.lightBlue),
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).padding.top + 80,
              right: 10,
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const GiraffePage()),
                  );
                },
                icon: const Icon(Icons.arrow_forward, size: 25, color: Colors.white),
                label: const Text(''),
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(60, 60),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 120,
              left: 10,
              child:
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.popUntil(context, ModalRoute.withName('/'));
                },
                icon: const Icon(Icons.home, color: Colors.white, size: 25),
                label: const Text(''),
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(60, 60),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 120,
              left: MediaQuery.of(context).size.width / 2 - 35,
              child: ElevatedButton.icon(
                onPressed: () {
                  _playLocalAudio('peacock_sound.mp3');
                },
                icon: const Icon(Icons.volume_up, color: Colors.white, size: 25),
                label: const Text(''),
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(60, 60),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 120,
              right: 10,
              child: ElevatedButton.icon(
                onPressed: () {
                  _playOnlineAudio('https://ssl.gstatic.com/dictionary/static/sounds/oxford/peacock--_us_1.mp3');
                },
                icon: const Icon(Icons.record_voice_over_outlined, color: Colors.white, size: 25),
                label: const Text(''),
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(60, 60),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}// End of Peacock class

class GiraffePage extends StatelessWidget {
  const GiraffePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: NetworkImage('https://img.599ku.com/ele_banner2/81af0a162b70dd867a344c4daa069f4a.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            Center(
              child: Image.network(
                'https://img.mp.itc.cn/upload/20170627/7b0c74e3495d427eb886cebc60d6ca0c_th.jpg',
                width: 400,
                height: 400,
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).padding.top + 80,
              left: 10,
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back, size: 25, color: Colors.white),
                label: const Text(''),
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(60, 60),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).padding.top + 80,
              left: 135,
              child: const Text(
                'Giraffe',
                style: TextStyle(fontFamily: 'Milk', fontSize: 50, fontWeight: FontWeight.bold, color: Colors.lightBlue),
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).padding.top + 80,
              right: 10,
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const GoosePage()),
                  );
                },
                icon: const Icon(Icons.arrow_forward, size: 25, color: Colors.white),
                label: const Text(''),
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(60, 60),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 120,
              left: 10,
              child:
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.popUntil(context, ModalRoute.withName('/'));
                },
                icon: const Icon(Icons.home, color: Colors.white, size: 25),
                label: const Text(''),
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(60, 60),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 120,
              left: MediaQuery.of(context).size.width / 2 - 35,
              child: ElevatedButton.icon(
                onPressed: () {
                  _playLocalAudio('bear_roar.mp3');
                },
                icon: const Icon(Icons.volume_up, color: Colors.white, size: 25),
                label: const Text(''),
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(60, 60),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 120,
              right: 10,
              child: ElevatedButton.icon(
                onPressed: () {
                  _playOnlineAudio('https://ssl.gstatic.com/dictionary/static/sounds/oxford/giraffe--_us_1.mp3');
                },
                icon: const Icon(Icons.record_voice_over_outlined, color: Colors.white, size: 25),
                label: const Text(''),
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(60, 60),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}// End of Giraffe class

// In Goose Page class, the main difference with other classes is that
// the Next button is not added because Goose is the last animal in this app.
class GoosePage extends StatelessWidget {
  const GoosePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: NetworkImage('https://img.599ku.com/ele_banner2/81af0a162b70dd867a344c4daa069f4a.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            Center(
              child: Image.network(
                'https://www.dartagnan.com/dw/image/v2/BJQL_PRD/on/demandware.static/-/Sites-dartagnan-Library/default/dwe263db36/images/content/goose-facts-and-cooking.jpg?sw=1200&strip=false',
                width: 400,
                height: 400,
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).padding.top + 80,
              left: 10,
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back, size: 25, color: Colors.white),
                label: const Text(''),
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(60, 60),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
              ),
            ),
            Positioned(
              top: MediaQuery.of(context).padding.top + 80,
              left: 160,
              child: const Text(
                'Goose',
                style: TextStyle(fontFamily: 'Milk', fontSize: 50, fontWeight: FontWeight.bold, color: Colors.lightBlue),
              ),
            ),
            Positioned(
              bottom: 120,
              left: 10,
              child:
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.popUntil(context, ModalRoute.withName('/'));
                },
                icon: const Icon(Icons.home, color: Colors.white, size: 25),
                label: const Text(''),
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(60, 60),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 120,
              left: MediaQuery.of(context).size.width / 2 - 35,
              child: ElevatedButton.icon(
                onPressed: () {
                  _playLocalAudio('goose_sound.mp3');
                },
                icon: const Icon(Icons.volume_up, color: Colors.white, size: 25),
                label: const Text(''),
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(60, 60),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 120,
              right: 10,
              child: ElevatedButton.icon(
                onPressed: () {
                  _playOnlineAudio('https://ssl.gstatic.com/dictionary/static/sounds/oxford/goose--_us_1.mp3');
                },
                icon: const Icon(Icons.record_voice_over_outlined, color: Colors.white, size: 25),
                label: const Text(''),
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(60, 60),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}// End of Goose Class
