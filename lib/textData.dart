import 'package:flutter/material.dart';
class TitleData {
  get titles => _theTitles;
  List _theTitles = [
    {"titles": "Hey, Baby !"},
    {"titles": "Will You ?"},
    {"titles": "Accept ..."},
    {"titles": "Me ?"},
  ];
}


class TitleColours {
  get colours => _theTitleColours;
  List _theTitleColours = [
    {
      "colours": Colors.red,
    },
    {
      "colours": Colors.white,
    },
    {
      "colours": Colors.blue.shade900,
    },
    {
      "colours": Colors.black,
    },
  ];
}


class SubtitleData {
  get subtitles => _theSubtitles;
  List _theSubtitles = [
    {"subtitles": "For all that I am and all that I can be ..."},
    {
      "subtitles":
          "... give me your heart to cherish, Your hand to hold, Your body to care for and Your future to build along sides mine?"
    },
    {
      "subtitles":
          "Knowing that you'll have mine in return, the promise of a loving, sound mind ..."
    },
    {"subtitles": "... as your partner, waltzing through life's beating. "},
  ];
}

class SubtitleColours {
  get colours => _theSubtitleColours;
  List _theSubtitleColours = [
    {
      "colours" : Colors.blue.shade900,
    },{
      "colours": Colors.white,
    },{
      "colours": Colors.white,
    },{
      "colours": Colors.black87,
    },
  ];
}
