import 'package:flutter/material.dart';

class Aide extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new AideState();
  }
}

class AideState extends State<Aide> {
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
                      "Comment jouer à Reviz’Go ?",
                      style: new TextStyle(fontSize: 20.0),
                    ),
                    new Padding(padding: EdgeInsets.all(15.0)),
                  ],
                ),
              ),

              //image
              new Padding(padding: EdgeInsets.all(8.0)),

              new Text(
                "Scan & Play",
                style: new TextStyle(fontSize: 22.0,fontWeight: FontWeight.bold),
              ),

              new Padding(padding: EdgeInsets.all(8.0)),
              new Text(
                "Pour jouer à Reviz’Go, déplace toi dans le bâtiment, trouve et scanne des codes QR à l’aide de ton appareil en utilisant la fonction “Scan & Play”. Plusieurs interactions s’offrent à toi en fonction du type de codes que tu scannes.",
                style: new TextStyle(fontSize: 16.0),
              ),

              new Padding(padding: EdgeInsets.all(8.0)),

              new Text(
                "Codes Jaunes",
                style: new TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold),
              ),


              new Padding(padding: EdgeInsets.all(8.0)),

              new Text(
                "Lorsque tu scannes un code QR jaune, tu te retrouves dans un affrontement avec un expert du commerce. Tu dois répondre correctement à une majorité de questions qu’il te pose pour gagner l’affrontement. Si tu gagnes, tu peux recruter l’expert dans ton équipe. Réfléchis bien ! Tu n’as qu’une chance pour recruter un expert ! Tu gagnes un point de classement par bonne réponse.",
                style: new TextStyle(fontSize: 16.0),
              ),

              new Padding(padding: EdgeInsets.all(8.0)),

              new Text(
                "Codes Bleus",
                style: new TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold),
              ),
              new Padding(padding: EdgeInsets.all(8.0)),

              new Text(
                "Lorsque tu scannes un code QR bleu, tu te retrouves dans une salle de classe dans laquelle tu affronteras un formateur. Tu dois poser des questions au formateur. Celui-ci te répond, mais il peut décider de te piéger. Tu dois alors juger si sa réponse est vraie ou fausse. Tu gagnes un certain nombre de points en fonction de ton nombre de bonnes réponses.",
                style: new TextStyle(fontSize: 16.0),
              ),
              new Padding(padding: EdgeInsets.all(4.0)),

              new Text(
                "1 bonne réponse = 1 point",
                style: new TextStyle(fontSize: 16.0),
              ),
              new Text(
                "2 bonnes réponses = 3 points",
                style: new TextStyle(fontSize: 16.0),
              ),
              new Text(
                "3 bonnes réponses = 5 points",
                style: new TextStyle(fontSize: 15.0),
              ),

              new Padding(padding: EdgeInsets.all(8.0)),

              new Text(
                "Codes Rouges",
                style: new TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold),
              ),
              new Padding(padding: EdgeInsets.all(8.0)),
              new Text(
                "Lorsque toi et un de tes amis scannez un code QR rouge, vous vous retrouvez dans une arène. Vous pouvez vous y affronter dans un duel. Les duels ont un déroulement assez particulier : "
                    "Premièrement, toi et ton adversaire devez chacun choisir un domaine de compétences commerciales (Marketing, Administration, Ventes, Achats, Ressources humaines ou Comptabilité). Un troisième domaine est choisi aléatoirement. Ces domaines de compétences commerciales définissent le thème des 5 questions qui te seront posées."
                    "Après avoir pris connaissances des thèmes de question, toi et ton adversaire devez chacun choisir un seul expert de votre équipe. Il est important de bien le choisir car il ne t’aidera que pour les questions de son domaine d’expertise."
                    "Finalement, le duel peut commencer. 5 questions te seront posées, à toi ainsi qu’à ton adversaire."
                    "Celui qui a le plus de bonnes réponses gagne le duel, ainsi que 5 points de classement.",
                style: new TextStyle(fontSize: 16.0),
              ),

              new Padding(padding: EdgeInsets.all(8.0)),

              new Text(
                "Equipe",
                style: new TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold),
              ),
              new Padding(padding: EdgeInsets.all(8.0)),

              new Text(
                "Dans l’onglet équipe, tu pourras trouver et gérer ton équipe d’expert. Tu as un expert par domaine de compétence commerciales. Tu peux le changer et en recruter un nouveau pour avoir une meilleure équipe. Le niveau de l’équipe est défini par la moyenne de puissance des experts de ton équipe.",
                style: new TextStyle(fontSize: 16.0),
              ),
              new Text(
                "Tu peux recruter des experts en scannant des codes QR jaunes.",
                style: new TextStyle(fontSize: 16.0),
              ),
              new Text(
                "Recrute les meilleures experts que tu rencontres pour monter dans le classement d’équipe !",
                style: new TextStyle(fontSize: 16.0),
              ),

              new Padding(padding: EdgeInsets.all(8.0)),

              new Text(
                "Reviz’dex",
                style: new TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold),
              ),
              new Padding(padding: EdgeInsets.all(8.0)),

              new Text(
                "Le Réviz’dex contient un historique des questions auxquelles tu as répondu en fonction des domaines commerciaux. Il te permet également de consulter tous les duels auxquels tu as participé.",
                style: new TextStyle(fontSize: 16.0),
              ),

              new Padding(padding: EdgeInsets.all(8.0)),

              new Text(
                "Classement",
                style: new TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold),
              ),
              new Padding(padding: EdgeInsets.all(8.0)),

              new Text(
                "Le but du jeu est d’être au sommet des deux classements. "
                    "Scanne des codes et réponds correctement au plus de questions possibles pour gagner des points de classement."
                    "Recrute les meilleurs experts possibles pour te créer une équipe au top et monter dans le classement d’équipe !",
                style: new TextStyle(fontSize: 16.0),
              ),
              new Padding(padding: EdgeInsets.all(8.0)),

              new Text(
                "Contact",
                style: new TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold),
              ),
              new Padding(padding: EdgeInsets.all(8.0)),

              new Text(
                "Si tu as d’autres questions concernant le jeu : n’hésite pas à contacter les créateurs du jeu à fake-email@gmail.com.",
                style: new TextStyle(fontSize: 16.0),
              ),
              new Padding(padding: EdgeInsets.all(8.0)),

              new MaterialButton(
                color: Colors.red,
                onPressed: () {
                  Navigator.of(context).pushNamed('/');
                },
                child: new Text(
                  "Retour",
                  style: new TextStyle(fontSize: 20.0, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
