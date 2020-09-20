import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import 'harcamalar.dart';
import 'info.dart';

class BalanceScreen extends StatefulWidget {
  const BalanceScreen({Key key}) : super(key: key);
  static MaterialPageRoute get route =>
      MaterialPageRoute(builder: (context) => BalanceScreen());
  @override
  _BalanceScreenState createState() => _BalanceScreenState();
}

class _BalanceScreenState extends State<BalanceScreen> {
  List<PieChartSectionData> _sections = new List<PieChartSectionData>();

  @override
  void initState() {
    super.initState();
    _yukle(10, 20, 70);
    debugPrint("initState Tamamlandı.");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.blue),
      height: MediaQuery.of(context).size.height,
      width: double.infinity,
      child: Stack(
        children: <Widget>[
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                buildChart(),
                // RaisedButton(
                //   onPressed: () {
                //     // context.signOut();
                //     // Navigator.push(context, AuthScreen.route);
                //   },
                //   child: Text("Çıkış yap"),
                // )
              ],
            ),
          ),
          // HarcamaListesi DraggableSheet
          HarcamalarEkrani(),
        ],
      ),
    );
  }

  Widget buildChart() {
    return Container(
      child: AspectRatio(
        aspectRatio: 2.1,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            PieChart(
              PieChartData(
                borderData: FlBorderData(show: false),
                sections: _sections,
                centerSpaceRadius: 45,
                sectionsSpace: 0,
                centerSpaceColor: Colors.transparent,
                startDegreeOffset: 0,
              ),
            ),
            Bilgilendirme(321, 4352, 123),
          ],
        ),
      ),
    );
  }

  void _yukle(double harcamalar, double odemeler, double alinacaklar) {
    PieChartSectionData _item1 = PieChartSectionData(
      color: Colors.amber,
      value: harcamalar,
      title: "%$harcamalar",
      radius: 40,
      titleStyle: TextStyle(color: Colors.white, fontSize: 18),
    );
    PieChartSectionData _item2 = PieChartSectionData(
      color: Colors.red,
      value: odemeler,
      title: "%$odemeler",
      radius: 40,
      titleStyle: TextStyle(color: Colors.white, fontSize: 18),
    );
    PieChartSectionData _item3 = PieChartSectionData(
      color: Colors.green,
      value: alinacaklar,
      title: "%$alinacaklar",
      radius: 40,
      titleStyle: TextStyle(color: Colors.white, fontSize: 18),
    );
    _sections = [_item1, _item2, _item3];
  }
}
