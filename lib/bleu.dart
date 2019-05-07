import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:vip/userData.dart';
import 'package:vip/service/firestore_service.dart';
import 'package:vip/model/player.dart';
import 'package:vip/model/formateur.dart';

import 'dart:async';

var points = 0;
var questionNumber = 0;
var q1 = 0;
var q2 = 0;
var q3 = 0;
var correct = false;
String scoreActuel = "";

var quiz = new Quizz();

class Quizz {
  String scorePlayer = "0";
  String q1 = ";";
  String q2 = ";";
  String q3 = ";";
  String q1a = ";";
  String q1b = ";";
  String q1c = ";";
  String q1d = ";";
  int q1r = 0;
  String q2a = ";";
  String q2b = ";";
  String q2c = ";";
  String q2d = ";";
  int q2r = 0;
  String q3a = ";";
  String q3b = ";";
  String q3c = ";";
  String q3d = ";";
  int q3r = 0;

  var questions = [
    //  "Un animal s’approche de vous...",

    "Pour l’approche marketing de ton entreprise, pourquoi est-il important de poser des questions ouvertes lors de ton premier entretien ?",
    "Cite un type de graphique que tu pourrais utiliser pour représenter les 'départs' en 2008 et en 2009 ?",
    "Une stratégie de marketing différenciée consiste à :",
  ];

  var correct = [
    //answer 1
    [
      "4",
    ],
    [
      "2",
    ],
    [
      "1",
    ],
  ];

  var choices = [
    //answer 1
    [
      "De maximiser les profits",
      "De satisfaire les distributeurs",

    ],

    //answer 2
    [
      "Diagramme en barre ou Histogramme",
      "Diagramme en courbes",

    ],

    //answer 3
    [
      "Exploiter au moins deux segments du marché et à concevoir des produits et plans d'action distincts pour chaque segments",
      "Minimiser les différences entre les segments du marché",
    ],
  ];
}

class Bleu extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new Quiz1State();
  }
}

void updateQuestion(BuildContext context) {
  if (questionNumber == quiz.questions.length - 1) {
    questionNumber++;

    Navigator.push(

        context, new MaterialPageRoute(builder: (context) => new Summary()));
  } else {
    questionNumber++;

    if (correct) {
      Navigator.push(
          context, new MaterialPageRoute(builder: (context) => new ReponseC()));
    } else {
      Navigator.push(
          context, new MaterialPageRoute(builder: (context) => new ReponseF()));
    }
  }
}

Widget testing(List items, BuildContext context, DocumentSnapshot document) {
  quiz.scorePlayer = document['score'];

  quiz.questions[0] = items[numFormateur].q1;
  quiz.questions[1] = items[numFormateur].q2;
  quiz.questions[2] = items[numFormateur].q3;

  quiz.correct[0][0] = (items[numFormateur].q1r);
  quiz.correct[1][0] = (items[numFormateur].q2r);
  quiz.correct[2][0] = (items[numFormateur].q3r);

  quiz.choices[0][0] = items[numFormateur].q1a;
  quiz.choices[0][1] = items[numFormateur].q1b;

  quiz.choices[1][0] = items[numFormateur].q2a;
  quiz.choices[1][1] = items[numFormateur].q2b;

  quiz.choices[2][0] = items[numFormateur].q3a;
  quiz.choices[2][1] = items[numFormateur].q3b;

  void upp(int scor) {
    FirestoreService<Player> db = new FirestoreService<Player>('joueur');
    db.updateManon(Player.onlyS(scor.toString()));
  }

  return new WillPopScope(
    onWillPop: () async => false,
    child: Scaffold(
        body: new Padding(
      padding: const EdgeInsets.all(20),
      child: new SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: new Column(
          children: <Widget>[
            new Padding(padding: EdgeInsets.all(15.0)),
            new Container(
              alignment: Alignment.center,

              //             <--- BoxDecoration here

              child: new Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  new Text(
                    "Question ${questionNumber + 1} sur ${quiz.questions.length}",
                    style: new TextStyle(fontSize: 20.0),
                  ),
                ],
              ),
            ),
            new Padding(padding: EdgeInsets.all(10.10)),
            new Padding(padding: EdgeInsets.all(10.0)),
            new Text(
              "Tu poses cette question  : " + quiz.questions[questionNumber],
              style: new TextStyle(
                  fontSize: 16.0,
                  decorationColor: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
            new Padding(padding: EdgeInsets.all(20.0)),
            new Text("La réponse du formateur : "),
            new Padding(padding: EdgeInsets.all(10.0)),
            new Text(
              quiz.choices[questionNumber][0],
              style: new TextStyle(fontSize: 18.0, color: Colors.black),
            ),
            new Padding(padding: EdgeInsets.all(10.10)),
            new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                //button 1
                new MaterialButton(
                  color: Colors.blueGrey,
                  onPressed: () {
                    if (quiz.correct[questionNumber][0] == "1") {
                      points++;
                      correct = true;
                    } else {
                      correct = false;
                    }
                    updateQuestion(context);
                  },
                  child: new Text(
                    "Réponse correct",
                    style: new TextStyle(fontSize: 12.0, color: Colors.white),
                  ),
                ),

                new Padding(padding: EdgeInsets.all(10.10)),
              ],
            ),
            new Padding(padding: EdgeInsets.all(10.10)),
            new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                //button 1
                new MaterialButton(
                  color: Colors.blueGrey,
                  onPressed: () {
                    if (quiz.correct[questionNumber][0] == "2") {
                      points++;
                      correct = true;
                    } else {
                      correct = false;
                    }

                    updateQuestion(context);
                  },
                  child: new Text(
                    "Réponse fausse",
                    style: new TextStyle(fontSize: 12.0, color: Colors.white),
                  ),
                ),
                new Padding(padding: EdgeInsets.all(10.10)),
              ],
            ),
            new Padding(padding: EdgeInsets.all(10.10)),
          ],
        ),
      ),
    )),
  );
}

class Quiz1State extends State<Bleu> {
  List<Formateur> items;
  List<Player> joueurs;
  FirestoreService<Formateur> db = new FirestoreService<Formateur>('formateur');
  FirestoreService<Formateur> dbj = new FirestoreService<Formateur>('joueur');

  StreamSubscription<QuerySnapshot> noteSub;
  StreamSubscription<QuerySnapshot> jouerSub;
  int index = 0;

  @override
  void initState() {
    super.initState();

    items = new List();
    joueurs = new List();

    noteSub?.cancel();
    noteSub = db.getList().listen((QuerySnapshot snapshot) {
      final List<Formateur> notes = snapshot.documents
          .map((documentSnapshot) => Formateur.fromMap(documentSnapshot.data))
          .toList();

      setState(() {
        this.items = notes;
      });
    });

    print("SIZE" + items.length.toString());

    joueurs = new List();

    jouerSub?.cancel();
    jouerSub = dbj.getList().listen((QuerySnapshot snapshot) {
      final List<Player> pl = snapshot.documents
          .map((documentSnapshot) => Player.fromMap(documentSnapshot.data))
          .toList();

      setState(() {
        this.joueurs = pl;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Go'Reviz"),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.cyan,
      ),
      body: StreamBuilder(
          stream: Firestore.instance
              .collection('joueur')
              .where("name", isEqualTo: username)
              .snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) return const Text('Loading...');
            return testing(items, context, snapshot.data.documents[0]);
          }),
    );
  }

  BoxDecoration myBoxDecoration() {
    return BoxDecoration(
      border: Border.all(),
    );
  }

  void resetQuiz() {
    points = 0;
    questionNumber = 0;

    setState(() {
      Navigator.of(context).pushNamed('/');
    });
  }

  void updateQuestion(BuildContext context) {
    setState(() {
      if (questionNumber == quiz.questions.length - 1) {
        Navigator.push(context,
            new MaterialPageRoute(builder: (context) => new Summary()));
      } else {
        questionNumber++;

        if (correct) {
          Navigator.push(context,
              new MaterialPageRoute(builder: (context) => new ReponseC()));
        } else {
          Navigator.push(context,
              new MaterialPageRoute(builder: (context) => new ReponseF()));
        }
      }
    });
  }
}

class Summary extends StatelessWidget {
  final int score;

  Summary({Key key, @required this.score}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String text;
    String resu;
    void resetQuiz() {
      points = 0;
      questionNumber = 0;
    }

    if (correct) {
      text = "Tu as répondu correctement à la dernière question";
    } else {
      text = "Tu as donné une mauvaise réponse à la dernière question.  La bonne réponse était : " +
          quiz.choices[questionNumber-1][int.parse(quiz.correct[questionNumber - 1][0])-1];
    }


    FirestoreService<Player> db = new FirestoreService<Player>('joueur');
    int scoreN = int.parse(quiz.scorePlayer);

    if (points == 3) {
      resu = "Tu gagnes 5 pts";
      scoreN = scoreN + 5;
    }

    if (points == 2) {
      print("3 pts");
      resu = "Tu gagnes 2 pts";
      scoreN = scoreN + 3;
    }
    if (points == 1) {
      resu = "Tu gagnes 1 pts";
      scoreN = scoreN + 1;
    }

    if (points == 0) {
      resu = "Tu gagnes aucun points";
    }

    if (numFormateur == 0) {
      db.updateMuffin(Player.onlyMuffin("1", scoreN.toString()));
    }
    if (numFormateur == 1) {
      db.updateTune(Player.onlyTune("1", scoreN.toString()));
    }
    if (numFormateur == 2) {
      db.updateSwag(Player.onlySwag("1", scoreN.toString()));
    }
    if (numFormateur == 3) {
      db.updateFlouze(Player.onlyFlouze("1", scoreN.toString()));
    }
    if (numFormateur == 4) {
      db.updateGrailler(Player.onlyGrailler("1", scoreN.toString()));
    }
    if (numFormateur == 5) {
      db.updateBeurre(Player.onlyBeurre("1", scoreN.toString()));
    }

    return new WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(

        resizeToAvoidBottomInset: false,
        appBar: new AppBar(
          title: new Text("Go'Reviz"),
          backgroundColor: Colors.cyan,
          automaticallyImplyLeading: false,

        ),
        body: new Padding(
          padding: const EdgeInsets.all(20),
          child: new Container(
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Text(
                  text,
                  style: new TextStyle(fontSize: 20.0),
                  textAlign: TextAlign.center,
                ),
                new Padding(padding: EdgeInsets.all(30.0)),

                new Text(
                  resu,
                  style: new TextStyle(fontSize: 25.0),
                ),
                new Padding(padding: EdgeInsets.all(30.0)),
                new MaterialButton(
                  color: Colors.orange,
                  onPressed: () {
                    questionNumber = 0;
                    points = 0;

                    Navigator.of(context).pushNamed('/classement');
                  },
                  child: new Text(
                    "Consulte le classement",
                    style: new TextStyle(fontSize: 20.0, color: Colors.white),
                  ),
                ),
                new MaterialButton(
                  color: Colors.red,
                  onPressed: () {
                    questionNumber = 0;
                    points = 0;
                    Navigator.of(context).pushNamed('/');
                  },
                  child: new Text(
                    "Retour à l'accueil",
                    style: new TextStyle(fontSize: 20.0, color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ReponseC extends StatelessWidget {
  final int score;

  ReponseC({Key key, @required this.score}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void resetQuiz() {
      points = 0;
      questionNumber = 0;
    }

    return new WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Go'Reviz"),
          automaticallyImplyLeading: false,
          backgroundColor: Colors.cyan,
        ),
        resizeToAvoidBottomInset: false,
        body: new Container(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Text(
                "Tu as répondu correctement !",
                style: new TextStyle(fontSize: 35.0),
              ),

              new Padding(padding: EdgeInsets.all(30.0)),
              new MaterialButton(
                color: Colors.red,
                onPressed: () {
                  Navigator.pop(context);
                },
                child: new Text(
                  "Prochaine question",
                  style: new TextStyle(fontSize: 20.0, color: Colors.white),
                ),
              ), //ResetQuizz
            ],
          ),
        ),
      ),
    );
  }
}

class ReponseF extends StatelessWidget {
  final int score;

  ReponseF({Key key, @required this.score}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void resetQuiz() {
      points = 0;
      questionNumber = 0;
    }

    return new WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: new AppBar(
          title: new Text("Go'Reviz"),
          backgroundColor: Colors.cyan,
          automaticallyImplyLeading: false,
        ),
        resizeToAvoidBottomInset: false,
        body: new Padding(
          padding: const EdgeInsets.all(20),
          child: new Container(
            child: new Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Text(
                  "Tu as donné une mauvais réponse !",
                  style: new TextStyle(fontSize: 27.0),
                ),
                new Padding(padding: EdgeInsets.all(30.0)),

                new Text("La bonne réponse était : "),
                new Padding(padding: EdgeInsets.all(15.0)),

                new Text(
                  quiz.choices[questionNumber - 1]
                      [int.parse(quiz.correct[questionNumber - 1][0]) - 1],
                  style: new TextStyle(fontSize: 27.0),
                ),
                new Padding(padding: EdgeInsets.all(30.0)),
                new MaterialButton(
                  color: Colors.red,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: new Text(
                    "Prochaine question",
                    style: new TextStyle(fontSize: 20.0, color: Colors.white),
                  ),
                ), //ResetQuizz
              ],
            ),
          ),
        ),
      ),
    );
  }
}
