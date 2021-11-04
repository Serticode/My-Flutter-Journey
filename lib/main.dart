import 'package:concentric_transition/concentric_transition.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ConcentricTransitions(),
    );
  }
}

class ConcentricTransitions extends StatefulWidget {
  const ConcentricTransitions({Key? key}) : super(key: key);

  @override
  _ConcentricTransitionsState createState() => _ConcentricTransitionsState();
}

class _ConcentricTransitionsState extends State<ConcentricTransitions> {
  List _pages = [
    {
      "images":
          "https://ouch-cdn2.icons8.com/HDChja2fl_Nzw5kbtwQalSOjQWdHSq17qV5t-s_pqe0/rs:fit:392:294/czM6Ly9pY29uczgu/b3VjaC1wcm9kLmFz/c2V0cy9zdmcvODYz/L2JlMTgyOTQ2LWQ2/NjMtNGNlNS1iOTVk/LWVhZDk1YmQ3ODc3/Yy5zdmc.png"
    },
    {
      "images":
          "https://ouch-cdn2.icons8.com/rMfcDb1EhMf0WwFtNtZ6GM81v7sBJCIqUWC4KfNi2dQ/rs:fit:392:392/czM6Ly9pY29uczgu/b3VjaC1wcm9kLmFz/c2V0cy9zdmcvODY0/LzZjYzRjYzI5LWZm/YWEtNDRkNi1iYmZm/LTUzODQwNGExNzVj/Yi5zdmc.png"
    },
    {
      "images":
          "https://ouch-cdn2.icons8.com/exdnnjkCpsAtizrOzOWgEWrmRghS_bS42VnJgW4eIcM/rs:fit:392:294/czM6Ly9pY29uczgu/b3VjaC1wcm9kLmFz/c2V0cy9zdmcvOTIz/LzVhNjgzNTVhLTg1/MWMtNGM0NC1iNjBm/LTdiOTBiNjRjZWI0/MC5zdmc.png"
    },
    {
      "images":
          "https://ouch-cdn2.icons8.com/sh0sF1Pg05qm5-UT3KKh2bmjVgaIFJ7llQiPOdmy9V8/rs:fit:392:248/czM6Ly9pY29uczgu/b3VjaC1wcm9kLmFz/c2V0cy9zdmcvNjQv/Yzk4MTRjNWQtM2Uw/YS00NWM5LTkxM2It/ZjkxOTkyNmZhY2M5/LnN2Zw.png"
    }
  ];
  @override
  Widget build(BuildContext context) {
    return ConcentricPageView(
      colors: <Color>[
        Colors.white,
        Colors.red,
        Colors.green,
        Colors.orange,
      ],
      radius: 30.0,
      verticalPosition: 0.85,
      itemCount: 4,
      itemBuilder: (index, value) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.network(
              _pages[index]["images"],
              width: 300,
            )
          ],
        );
      },
    );
  }
}
