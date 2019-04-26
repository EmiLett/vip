import 'package:flutter/material.dart';


class Reviz extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return new RevizState();
  }
}

class RevizState extends State<Reviz> {
  @override
  Widget build(BuildContext context) {
    return new WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(

          body: new Container(
            margin: const EdgeInsets.all(10.0),
            alignment: Alignment.topRight,
            child: new Column(
              children: <Widget>[
                new Padding(padding: EdgeInsets.all(15.0)),

                new Container (
                  alignment: Alignment.center,

                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[

                      new Text("Reviz'Dex",
                        style: new TextStyle(
                            fontSize: 22.0
                        ),),

                    ],
                  ),
                ),

                //image
                new Padding(padding: EdgeInsets.all(.0)),



                new MaterialButton(
                  color: Colors.red,
                  onPressed: () {

                    Navigator.of(context).pushNamed('/');
                  },                child: new Text(
                  "Retour",

                  style: new TextStyle(fontSize: 20.0, color: Colors.white),

                ),
                ),

              ],
            ),
          ),

        )
      );
    }

}