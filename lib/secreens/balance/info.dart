import 'package:eticaretapp/widgets/indicator.dart';
import 'package:flutter/material.dart';

Widget Bilgilendirme(var harcamalar, var odemeler, var alinacaklar) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Indicator(text: "Harcamalar", isSquare: true, color: Colors.red),
      Text("$harcamalar TL", style: textStyle()),
      Indicator(text: "Ödemeler", isSquare: true, color: Colors.amber),
      Text("$odemeler TL", style: textStyle()),
      Indicator(text: "Alınacaklar", isSquare: true, color: Colors.green),
      Text("$alinacaklar TL", style: textStyle()),
    ],
  );
}

TextStyle textStyle() => TextStyle(fontSize: 18, color: Colors.white);
