import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class Intro extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new IState();
  }
}

class IState extends State<Intro> {
  VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(
        'http://www.ruvy.ch/revizgo.mp4')
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return new WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          appBar: new AppBar(
            title: new Text("Go'Reviz"),
            backgroundColor: Colors.cyan,
            automaticallyImplyLeading: false,

          ),
          body: new Padding(
            padding: const EdgeInsets.all(20),
            child: new SingleChildScrollView(
              child: new Column(
                children: <Widget>[
                  new Padding(padding: EdgeInsets.all(15.0)),

                  new Container(
                    alignment: Alignment.center,
                    child: new Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        new Text(
                          "Introduction",
                          style: new TextStyle(fontSize: 22.0),
                        ),
                      ],
                    ),
                  ),

                  //image
                  new Padding(padding: EdgeInsets.all(15.0)),
                  new Text(
                      "Salut futur(e) diplomé(e) en commerce ! Comme tu le sais, tu as bientôt tes examens… et je le sais, tu n'es pas encore prêt! Ce jeu te permettra de réviser les notions dont tu as besoin. Réussis le plus de défis pour obtenir le meilleur score !"),
                  new Padding(padding: EdgeInsets.all(15.0)),
                  new Text("Regarde la vidéo-tuto en appuyant sur le bouton play au fond à droite. "),
                  new Padding(padding: EdgeInsets.all(15.0)),
                  new Text("Les boutons pour changer de page se trouvent toujours en fond de page sauf pour les classements et les pages du Reviz'Dex où le bouton se trouve en haut à gauche"),
                  new Padding(padding: EdgeInsets.all(15.0)),

                  new Padding(padding: EdgeInsets.all(.0)),
                  new Center(
                    child: _controller.
                    value.initialized
                        ? AspectRatio(
                      aspectRatio: _controller.value.aspectRatio,
                      child: VideoPlayer(_controller),
                    )
                        : Container(),
                  ),
                  new Padding(padding: EdgeInsets.all(8.0)),

                  new MaterialButton(
                    color: Colors.red,
                    onPressed: () {
                      Navigator.of(context).pushNamed('/');
                    },
                    child: new Text(
                      "Commencer le jeu",
                      style: new TextStyle(fontSize: 20.0, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              setState(() {
                _controller.value.isPlaying
                    ? _controller.pause()
                    : _controller.play();
              });
            },
            child: Icon(
              _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
            ),
          ),
        ));
  }
}
