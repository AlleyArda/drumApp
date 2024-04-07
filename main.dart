import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    home: DrumPage(),
    );
  }
}

class DrumPage extends StatefulWidget {
  const DrumPage({super.key});

  @override
  State<DrumPage> createState() => _DrumPageState();
}

class _DrumPageState extends State<DrumPage> {
  final oynatici = AudioPlayer();

  void playSound(soundSource){
    var ses = AssetSource('$soundSource');
    oynatici.play(ses);

  }


  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black87,

      child: SafeArea(
        child: Column(
          children: [
            AppBar(backgroundColor: Colors.green, centerTitle: true , title: Text("Drum Machine")),
           Expanded(
             child: Row(
              children: [
                buildDrumButton('bip.wav' , Colors.black , 'bip'),
                buildDrumButton('bongo.wav' , Colors.redAccent , 'bongo'),
              ],
              ),
           ),
            Expanded(
              child: Row(
                children: [
                  buildDrumButton('clap1.wav' , Colors.purpleAccent , 'clap'),
                  buildDrumButton('clap2.wav' , Colors.grey , 'clap2'),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  buildDrumButton('clap3.wav' , Colors.yellowAccent , 'clap3'),
                  buildDrumButton('crash.wav' , Colors.greenAccent , 'crash'),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  buildDrumButton('how.wav' , Colors.blueAccent , 'how'),
                  buildDrumButton('oobah.wav' , Colors.brown , 'oobah'),
                ],
              ),
            ),
          ]
        ),
      ),
    );
  }

  Widget buildDrumButton(String soundName , Color renk , String nameText) {
    return Expanded(
              child: TextButton(
                style: ButtonStyle(padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(15))),
                onPressed: (){playSound(soundName);},//onPressed
                child: Container(padding: EdgeInsets.all(50),
                    color: renk, child: Text('$nameText' ,
                     style: TextStyle(color: Colors.white),
                    softWrap: true,
                     ),
                ),

              ),
            );
  }
}


