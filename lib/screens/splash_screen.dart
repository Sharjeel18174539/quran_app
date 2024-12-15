import 'dart:async';
import 'package:flutter/material.dart';
import 'package:quran/quran.dart' as quran;
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Timer(Duration(seconds: 1), () {
      Navigator.push(context, MaterialPageRoute(builder: (context)=> SurahList()));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Holy Quran"),
      ),
      body: Column(
        children: [
          Image.asset("assets/quran.jpg"),
          Center(child: Text("Holy Quran", style: TextStyle(color: Colors.white),)),
        ],
      ),
      backgroundColor: Colors.brown,
    );
  }
}

class SurahList extends StatefulWidget {
  const SurahList({super.key});

  @override
  State<SurahList> createState() => _SurahListState();
}

class _SurahListState extends State<SurahList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown,
      appBar: AppBar(title: Text("Holy Quran"),),
      body: ListView.builder(
        itemCount: quran.totalSurahCount,
          itemBuilder: (context, index){
          ListTile(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Surah(index+1)));
            },
            title: Text(quran.getSurahNameArabic(index+1)),

            subtitle: Text(quran.getSurahNameEnglish(index+1)),
            leading: CircleAvatar(
              child: Text("${index+1}", style: TextStyle(color: Colors.white),),

            ),
            trailing: Text("${quran.getVerseCount(index+1)}"),
          );
      }
      ),
    );
  }
}
class Surah extends StatefulWidget {
  int indexSurah;
   Surah(this.indexSurah, {super.key});

  @override
  State<Surah> createState() => _SurahState();
}

class _SurahState extends State<Surah> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ListView.builder(
            itemCount: quran.getVerseCount(widget.indexSurah+1),
              itemBuilder: (context, index){
              return ListTile(
                title: Text(quran.getVerse(widget.indexSurah+1, index+1,verseEndSymbol: true ),
                  textAlign: TextAlign.right,
                ),
              );
              })
        ],
      ),
    );
  }
}
