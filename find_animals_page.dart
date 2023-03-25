// Author: Zhaoqi Jin
// Version 1.0
// Since 03/15/2023
// This is the find animals page class
// This class is used to design a small game
// The main function is to show the user pictures of different animals,
// and let the user select the corresponding picture based on the correct animal name given.
// For each round the user chooses the correct picture, 100 points are added to the score,
// while 50 points are deducted for wrong choices.
// There are 5 rounds in total. When the game is over, the user is taken to the GameOverPage page,
// which displays the total score and provides a button to return to the home page.
import 'package:flutter/material.dart';

class FindAnimalsPage extends StatefulWidget {
  const FindAnimalsPage({Key? key}) : super(key: key);

  @override
  FindAnimalsPageState createState() => FindAnimalsPageState();
}

class FindAnimalsPageState extends State<FindAnimalsPage> {
  // Create a Map containing the animal name and the corresponding image URL.
  final Map<String, String> _animals = { //
    'Dog': 'http://p9.itc.cn/images01/20200715/520e00314a854ada8fc45e2b6b57ac60.png',
    'Cat': 'https://picx.zhimg.com/v2-22cf461858198227392b899b96d8e9cb_720w.jpg?source=172ae18b',
    'Hen': 'https://backyardpoultry.iamcountryside.com/wp-content/uploads/sites/3/2019/03/iStock-509077517.jpg',
    'Goat': 'https://a-z-animals.com/media/2021/12/lovely-white-baby-goat-running-on-grass-picture-id1281182694-1024x535.jpg',
    'Tiger': 'https://cdn.artphotolimited.com/images/5cdad65d9c936e3bb1f33485/300x300/petit-tigre.jpg',
    'Lion': 'https://freedesignfile.com/upload/2017/10/Walking-little-lion-Stock-Photo.jpg',
    'Elephant': 'https://blog.humanesociety.org/wp-content/uploads/2022/04/HSI-Makalali-154_414838-scaled.jpg',
    'Cow': 'https://cf-images.us-east-1.prod.boltdns.net/v1/static/3281700261001/3d9d98eb-4554-4f45-8efd-8cf6ef41cca7/5e98be74-cc41-487f-b7e7-5ef0c9442b88/1280x720/match/image.jpg',
    'Duck': 'https://media.australian.museum/media/dd/images/mallard.ef584b7.width-800.8b55bd7.jpg',
    'Horse': 'https://cdn.shopify.com/s/files/1/0512/2529/7057/files/HG-hot-fizzy-horse-blog-281021-002.jpg?v=1642636393',
    'Pig': 'https://www.treehugger.com/thmb/mJQG8jpmRwB1NDZbhQlaFzoYZXM=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/piglet-grass-dandelions-01-b21d7ef8f881496f8346dbe01859537e.jpg',
    'Panda': 'https://www.treehugger.com/thmb/38yOs2_WMKpehD1NPB5aBOvTEmo=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/giant-panda-96cd8616b8304fbba5b9bbe59545ecf7.jpg',
    'Rabbit': 'https://upload.wikimedia.org/wikipedia/commons/3/37/Oryctolagus_cuniculus_Tasmania_2.jpg',
    'Monkey': 'https://i.guim.co.uk/img/media/f84c4ae6dafddee667fb3090ff53f0038479e400/0_688_4771_2862/master/4771.jpg?width=1200&height=900&quality=85&auto=format&fit=crop&s=9f9786ac021cb2f8cf5e8be1e7840003',
    'Penguin': 'https://www.whatsnewsmedia.com/wp-content/uploads/2022/01/photo_2022-01-11_22-43-22.jpg',
    'Bear': 'https://cloudfront-us-east-1.images.arcpublishing.com/advancelocal/WV2AST74END4TFIUKH7MALIYGQ.jpg',
    'Koala': 'https://www.wwf.org.uk/sites/default/files/styles/social_share_image/public/2022-05/_WW236934.jpg?itok=wsulCklO',
    'Peacock': 'https://media.hswstatic.com/eyJidWNrZXQiOiJjb250ZW50Lmhzd3N0YXRpYy5jb20iLCJrZXkiOiJnaWZcL3BlYWNvY2stZmVhdGhlcnMuanBnIiwiZWRpdHMiOnsicmVzaXplIjp7IndpZHRoIjo4Mjh9fX0=',
    'Giraffe': 'https://img.mp.itc.cn/upload/20170627/7b0c74e3495d427eb886cebc60d6ca0c_th.jpg',
    'Goose': 'https://www.dartagnan.com/dw/image/v2/BJQL_PRD/on/demandware.static/-/Sites-dartagnan-Library/default/dwe263db36/images/content/goose-facts-and-cooking.jpg?sw=1200&strip=false',

  };
  // Define the variables
  int _score = 0; // Variables for recording user scores
  int _currentRound = 1; // Variable that records the current number of game rounds
  final int _totalRounds = 5; // Total number of rounds played
  late String _correctAnimal; // Correct animal name for the current turn
  late List<String> _displayedAnimals; // List of animal names to be displayed in the current turn

  @override
  void initState() { // Called when the StatefulWidget is initialized.
    // it is used to generate the game data for the first round
    super.initState();
    _generateNewRound();
  }
  // Generate a new round of game data.
  // Includes the correct animal names and the list of animals to be displayed.
  void _generateNewRound() {
    // converts the keys (animal names) into a list
    // shuffles the order of the elements in the list randomly
    _correctAnimal = (_animals.keys.toList()..shuffle()).first;
    // retrieves the first 4 elements of the shuffled list.
    _displayedAnimals = (_animals.keys.toList()..shuffle()).take(4).toList();

    // When the correct animal is not in the list of displayed animals,
    // remove the last item in the list of displayed animals
    // and add the correct animal
    if (!_displayedAnimals.contains(_correctAnimal)) {
      _displayedAnimals.removeLast();
      _displayedAnimals.add(_correctAnimal);
    }

    _displayedAnimals.shuffle();
  }
  // Handle the logic of the user clicking on the animal picture.
  // Determine if the correct animal was clicked and update the score based on the result.
  // When the game round ends, jump to the GameOverPage page to display the final score.
  void _handleTap(String animal) {
    setState(() {
      if (animal == _correctAnimal) { // Correct answer then add 100 points
        _score += 100;
        showDialog( // Build a dialog box to show the message
          // when the user clicks on the animal picture,
          // prompting the user if the answer is correct
          context: context,
          builder: (BuildContext context) {
            return AlertDialog( // The message of the correct answer
              title: const Text('Bingo!',
              textAlign: TextAlign.center,),
              content: const Text('Good Job!',
                textAlign: TextAlign.center,),
              actions: [
                TextButton( // Click 'OK' to go back to the game
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text('OK'),
                ),
              ],
            );
          },
        );
      } else { // Wrong answer then deduct 50 points
        _score -= 50;
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog( // The message of the wrong answer
              content: const Text('Wrong!',
                textAlign: TextAlign.center,
              ),
              actions: [
                TextButton( // Click 'OK' to go back to the game
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text('OK'),
                ),
              ],
            );
          },
        );
      }
      // Display the five rounds of the game
      if (_currentRound < _totalRounds) {
        _currentRound++;
        _generateNewRound();
      } else { // When the five rounds are finished, go to the game over page
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => GameOverPage(totalScore: _score),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container( // Set the background image
        decoration: const BoxDecoration( // Set the style of the background image
          image: DecorationImage(
            image: NetworkImage('https://img.599ku.com/ele_banner2/81af0a162b70dd867a344c4daa069f4a.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack( // Stack is used to place components in specific locations
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 40, 10, 10),
                  // Used to set the padding around the header component
                  // Make the home button, current round, score, etc. have certain margins on the page
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton( // Back to home page button
                        icon: const Icon(Icons.home,size: 40, color: Colors.lightBlue),
                        onPressed: () => Navigator.popUntil(context, ModalRoute.withName('/')),
                      ),
                      Column(
                        children: [ // Display which animal the user need to find
                          const SizedBox(height: 50),
                          Text(
                            'Find the $_correctAnimal',
                            style: const TextStyle(fontSize: 25, color: Colors.lightBlue, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 30),
                          Text( // Display which round now
                              'Round $_currentRound / $_totalRounds',
                            style: const TextStyle(fontSize: 22, color: Colors.lightBlue, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Text( // Display the total score
                        'Score: $_score',
                        style: const TextStyle(fontSize: 20, color: Colors.lightBlue, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 80), // Move images down
                Expanded( // Used to fill the remaining space
                  child: GridView.builder( // This is used to grid layout for building animal pictures
                    padding: const EdgeInsets.all(10),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, // Display two images per row
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      childAspectRatio: 1.5, // Adjust the size of the images
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      String animalName = _displayedAnimals[index];
                      return InkWell(
                        //  provide a touch feedback when the user taps on an animal image
                        onTap: () => _handleTap(animalName),
                        child: Image.network(
                          _animals[animalName]!, // Get the image from the _animals map
                          fit: BoxFit.cover,
                        ),
                      );
                    },
                    itemCount: _displayedAnimals.length,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
} // End of the class
// The page displayed at the end of the game,
// containing the total score and a button to return to the home page.
class GameOverPage extends StatefulWidget {
  final int totalScore;

  const GameOverPage({Key? key, required this.totalScore}) : super(key: key);

  @override
  GameOverPageState createState() => GameOverPageState();
}

class GameOverPageState extends State<GameOverPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container( // Set the background image
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: NetworkImage('https://img.599ku.com/ele_banner2/81af0a162b70dd867a344c4daa069f4a.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column( // Text and button alignment
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text( // Congratulation message
                'Congratulations!',
                // Set the text style
                style: TextStyle(fontSize: 30, color: Colors.lightBlue, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              Text( // Display the final score of the game
                'Your total score is: ${widget.totalScore}',
                // Set the text style
                style: const TextStyle(fontSize: 25, color: Colors.lightBlue, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 40),
              ElevatedButton.icon( // Set the button with an icon
                onPressed: () { // Back to the home page
                  Navigator.popUntil(context, ModalRoute.withName('/'));
                },
                icon: const Icon(Icons.home,size: 20, color: Colors.white),
                label: const Text( // The content of the button
                    'Return to Home Page',
                  // Set the style of the text
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
} // End of the class

