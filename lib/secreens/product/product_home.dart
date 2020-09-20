import 'package:eticaretapp/model/user.dart';
import 'package:eticaretapp/service/json_user_service.dart';
import 'package:flutter/material.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  List<User> users = new List<User>();
  List<User> filteredUsers = List<User>();
  @override
  void initState() {
    super.initState();
    Service.getUsers().then((usersFromServer) {
      setState(() {
        users = usersFromServer;
        filteredUsers = users;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Column(
        children: [
          TextField(
            decoration: InputDecoration(
              hintText: "Arama Yap",
              prefixIcon: Icon(Icons.search),
              suffixIcon: Icon(Icons.filter_list),
            ),
            onChanged: (string) {
              setState(() {
                filteredUsers = users
                    .where((element) => (element.name
                            .toLowerCase()
                            .contains(string.toLowerCase()) ||
                        element.email
                            .toLowerCase()
                            .contains(string.toLowerCase())))
                    .toList();
              });
            },
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemCount: filteredUsers.length,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: () {
                    debugPrint("OnTapp Çalıştı ${filteredUsers[index].name}");
                  },
                  child: Card(
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 130,
                            width: MediaQuery.of(context).size.width - 255,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage("assets/dress.jpg"),
                              ),
                            ),
                          ),
                          Text(filteredUsers[index].name,
                              style: TextStyle(fontSize: 16)),
                          SizedBox(height: 5),
                          Text(filteredUsers[index].email,
                              style: TextStyle(fontSize: 14)),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
