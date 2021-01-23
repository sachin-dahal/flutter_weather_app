import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextEditingController _cityController = TextEditingController();

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              height: 200.0,
              width: 200.0,
              child: FlareActor("assets/WorldSpin.flr",
                  fit: BoxFit.cover, animation: "roll"),
            ),
          ),
          Container(
            padding: EdgeInsets.all(20.0),
            child: Column(
              children: [
                Text(
                  "Search Weather",
                  style: TextStyle(
                    fontSize: 35.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  "Instantly",
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                SizedBox(height: 20.0),
                TextField(
                  controller: _cityController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    hintText: "City name",
                    hintStyle: TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.w400,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      borderSide: BorderSide(
                        color: Colors.white54,
                      ),
                    ),
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 12.0,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      borderSide: BorderSide(
                        color: Colors.white70,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20.0),
                ButtonTheme(
                  minWidth: double.infinity,
                  height: 50.0,
                  child: RaisedButton(
                    onPressed: () {},
                    child: Text(
                      "Search",
                      style: TextStyle(fontSize: 20.0),
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
