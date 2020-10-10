import 'package:flutter/material.dart';
import './StoryBrain.dart';

void main() {
  runApp(Destini());
}

class Destini extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(fontFamily: 'Fira Sans'),
      home: Scaffold(
        backgroundColor: Colors.blueGrey.shade800,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: StoryPage(),
          ),
        )
      ),
    );
  }
}
StoryBrain storyBrain = StoryBrain();
class StoryPage extends StatefulWidget {
  @override
  _StoryPageState createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade800,
      body: Container (
        padding: EdgeInsets.symmetric(vertical: 50.0, horizontal: 15.0),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                flex: 12,
                child: Center(
                  child: Text(
                    storyBrain.getStory(),
                    style: TextStyle(
                      fontSize: 25.0,
                      color: Colors.grey.shade100,
                      fontFamily: 'FiraSans'
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: FlatButton(
                  onPressed: () {
                    setState(() {
                      storyBrain.nextStory(1);
                    });
                  },
                  color: Colors.lightBlue,
                  child: Text (
                  storyBrain.getChoiceOne().toString(),
                  // 'Option 1',
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.grey.shade100
                  )
                  )
                )
              ),
              SizedBox(
                height: 20.0,
              ),
              Expanded(
                flex: 2,
                child: Visibility (
                  visible: storyBrain.buttonShouldBeVisible(),
                  child: FlatButton(
                    onPressed: () {
                      setState(() {
                        storyBrain.nextStory(2);
                      });
                    },
                    color: Colors.indigo.shade400,
                    child: Text(
                      // 'Option 2',
                      storyBrain.getChoiceTwo().toString(),
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.grey.shade100,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
