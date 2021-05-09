import 'package:flutter/material.dart';
import 'package:app/constants.dart';
import 'package:app/models/lyrics.dart';
import 'package:app/pages/home_page/body1.dart';
import 'package:app/pages/lyrics_page/arrow.dart';
import 'package:app/pages/lyrics_page/logo.dart';
import 'package:app/services/api-manager.dart';

class Lyricsresult extends StatefulWidget {
  final int lyricsID;

  Lyricsresult({
    Key key,
    this.lyricsID,
  }) : super(key: key);

  @override
  _LyricsresultState createState() => _LyricsresultState(lyricsID);
}

class _LyricsresultState extends State<Lyricsresult> {
  Future<Lyrics> _lyricss;

  final int lyricsID;

  _LyricsresultState(this.lyricsID);

  @override
  void initState() {
    _lyricss = API_Manager().getLyrics(this.lyricsID);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          Container(
            child: Row(
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Body1(),
                      ),
                    );
                  },
                  child: SizedBox(
                    child: Arrow(),
                  ),
                ),
                Container(
                  width: size.width * 0.90,
                  child: Logo(),
                  alignment: Alignment.center,
                ),
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(color: kSecondaryColor, width: 2.0),
              ),
            ),
            height: size.height * 0.89,
            child: FutureBuilder<Lyrics>(
              future: _lyricss,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Container(
                    margin: EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 15.0),
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: kPrimaryColor.withOpacity(0.25),
                          spreadRadius: 5,
                          blurRadius: 5,
                          offset: Offset(7, 7),
                        ),
                      ],
                      color: kPrimaryColor,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        width: 2,
                        color: kBorderColor,
                      ),
                    ),
                    child: Column(
                      children: <Widget>[
                        Flexible(
                            child: SingleChildScrollView(
                          child: Text(
                            snapshot.data.message.body.lyrics.lyricsBody +
                                "\n" +
                                snapshot
                                    .data.message.body.lyrics.lyricsCopyright,
                            style: TextStyle(
                              color: Colors.white.withOpacity(1),
                              fontSize: 16,
                              fontFamily: 'Poppins',
                            ),
                            textAlign: TextAlign.center,
                          ),
                        )),
                      ],
                    ),
                  );
                } else
                  return Container(
                    child: Center(child: CircularProgressIndicator()),
                  );
              },
            ),
          ),
        ],
      ),
    );
  }
}
