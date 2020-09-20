import 'package:flutter/material.dart';

class HarcamalarEkrani extends StatelessWidget {
  const HarcamalarEkrani({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      builder: (context, scrollController) {
        return Container(
          decoration: BoxDecoration(
              color: Color.fromRGBO(243, 245, 248, 1),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15), topRight: Radius.circular(15))),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 24),
                //Container Listview for expenses and incomes
                Container(
                  child: Text(
                    "Harcamalar",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 32),
                ),

                SizedBox(
                  height: 16,
                ),

                ListView.builder(
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 32),
                          padding: EdgeInsets.all(16),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20))),
                          child: Row(
                            children: <Widget>[
                              Container(
                                child: Icon(Icons.date_range,
                                    color: Colors.lightBlue[900]),
                              ),
                              SizedBox(width: 15),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    "Payment",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.grey[900]),
                                  ),
                                  Text(
                                    "Payment from Saad",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.grey[500]),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: <Widget>[
                                  Text(
                                    "+\$500.5",
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.lightGreen),
                                  ),
                                  Text(
                                    "26 Jan",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.grey[500]),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 20)
                      ],
                    );
                  },
                  shrinkWrap: true,
                  itemCount: 15,
                  controller: ScrollController(keepScrollOffset: true),
                ),
              ],
            ),
            controller: scrollController,
          ),
        );
      },
      initialChildSize: 0.60,
      minChildSize: 0.60,
      expand: true,
    );
  }
}
