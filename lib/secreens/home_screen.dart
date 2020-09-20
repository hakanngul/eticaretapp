import 'package:eticaretapp/secreens/siparisler/siparisler.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'balance/balance_screen.dart';
import 'product/product_home.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  static const List<Widget> _screens = <Widget>[
    BalanceScreen(),
    ProductScreen(),
    SiparislerScreen(),
  ];
  var keyProduct = PageStorageKey("key_product");
  var keyOrder = PageStorageKey("key_order");
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 2,
        iconTheme: new IconThemeData(color: Colors.black),
        // leading: Icon(Icons.menu, color: Colors.black),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(Icons.shopping_cart_outlined, color: Colors.black),
              SizedBox(width: 20),
            ],
          ),
        ],
      ),
      drawer: Drawer(
        child: Column(children: [
          UserAccountsDrawerHeader(
            accountName: Text("Hakan GÜL"),
            accountEmail: Text("test@test.com"),
          )
        ]),
      ),
      body: Center(
        child: _screens[_selectedIndex],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(color: Colors.white, boxShadow: [
          BoxShadow(blurRadius: 20, color: Colors.black.withOpacity(.1))
        ]),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
            child: GNav(
                gap: 10,
                activeColor: Colors.white,
                iconSize: 24,
                padding: EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 5,
                ),
                duration: Duration(milliseconds: 400),
                tabBackgroundColor: Colors.grey[800],
                tabs: [
                  GButton(icon: LineIcons.home, text: 'Home'),
                  GButton(icon: Icons.shopping_bag_outlined, text: 'Products'),
                  GButton(icon: LineIcons.shopping_cart, text: 'Orders'),
                ],
                selectedIndex: _selectedIndex,
                onTabChange: (index) {
                  setState(() {
                    _selectedIndex = index;
                  });
                }),
          ),
        ),
      ),
    );
  }

  bottomNavMenu() {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.account_balance),
          title: Text("Bakiye"),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.inventory),
          title: Text("Ürünler"),
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_basket),
          title: Text("Siparişler"),
        )
      ],
      type: BottomNavigationBarType.fixed,
      currentIndex: _selectedIndex,
      onTap: (index) => setState(() {
        _selectedIndex = index;
      }),
    );
  }
}
