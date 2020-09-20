import 'package:animations/animations.dart';
import 'package:eticaretapp/config/index.dart';
import 'package:eticaretapp/secreens/auth/register.dart';
import 'package:eticaretapp/secreens/auth/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:flushbar/flushbar.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key key}) : super(key: key);

  static MaterialPageRoute get route =>
      MaterialPageRoute(builder: (context) => const AuthScreen());

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  ValueNotifier<bool> showSignInPage = new ValueNotifier<bool>(true);
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      // vsync: this, // the SingleTickerProviderStateMixin
      vsync: this,
      duration: Duration(seconds: 2),
    );
    debugPrint("initState Tamamlandı.");
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox.expand(
            child: CustomPaint(
              painter: BackgroundPainter(
                animation: _controller.view,
              ),
            ),
          ),
          Center(
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 800),
              child: ValueListenableBuilder(
                valueListenable: showSignInPage,
                builder: (context, value, child) {
                  return PageTransitionSwitcher(
                    reverse: !value,
                    duration: Duration(milliseconds: 800),
                    transitionBuilder: (child, animation, secondaryAnimation) {
                      return SharedAxisTransition(
                        animation: animation,
                        secondaryAnimation: secondaryAnimation,
                        transitionType: SharedAxisTransitionType.vertical,
                        fillColor: Colors.transparent,
                        child: child,
                      );
                    },
                    child: value
                        ? SignIn(
                            key: ValueKey('SignIn'),
                            onRegisterClicked: () {
                              showSignInPage.value = false;
                              _controller.forward();
                            },
                          )
                        : Register(
                            key: ValueKey('Register'),
                            onSignInPressed: () {
                              showSignInPage.value = true;
                              _controller.reverse();
                            },
                          ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
