import 'package:eticaretapp/config/decoration_functions.dart';
import 'package:eticaretapp/config/index.dart';
import 'package:eticaretapp/secreens/home_screen.dart';
import 'package:eticaretapp/widgets/flushbar_message.dart';
import 'package:eticaretapp/widgets/loading_indicator.dart';
import 'package:eticaretapp/widgets/title.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';

class SignIn extends StatefulWidget {
  SignIn({Key key, @required this.onRegisterClicked}) : super(key: key);

  final VoidCallback onRegisterClicked;

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController _emailController;
  TextEditingController _passwordController;
  String email = "test@test.com";
  String sifre = "123456";
  bool isSubmitting;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isSubmitting = false;
    _emailController = new TextEditingController(text: "test@test.com");
    _passwordController = new TextEditingController(text: "123456");
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: Align(
                alignment: Alignment.centerLeft,
                child: LoginTitle(
                  title: "Welcome\nBack",
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: ListView(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    child: TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      controller: _emailController,
                      decoration: signInInputDecoration(hintText: "E-mail"),
                      validator: (value) {
                        if (value.isEmpty) {
                          return "Email Boş olamaz";
                        } else if (!EmailValidator.validate(value)) {
                          return "Geçerli bir email giriniz.";
                        }
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    child: TextFormField(
                      controller: _passwordController,
                      keyboardType: TextInputType.visiblePassword,
                      decoration: signInInputDecoration(hintText: "Password"),
                      validator: (value) {
                        if (value.length < 6)
                          return "En az 6 karakterli olmalıdır.";
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Sign In",
                          style: TextStyle(
                            fontWeight: FontWeight.w800,
                            color: Palette.darkBlue,
                            fontSize: 24,
                          ),
                        ),
                        Expanded(
                          child: Center(
                            child: LoadingIndicator(isLoading: isSubmitting),
                          ),
                        ),
                        FloatingActionButton(
                          onPressed: () {
                            setState(() {
                              isSubmitting = true;
                            });

                            _signIn();
                          },
                          child: Icon(
                            Icons.arrow_right_alt_outlined,
                          ),
                          backgroundColor: Palette.darkBlue,
                        ),
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: InkWell(
                      splashColor: Colors.white,
                      onTap: () {
                        widget.onRegisterClicked?.call();
                        // Alttaki ile üstteki aynı
                        // if (onRegisterClicked != null) {
                        //   onRegisterClicked();
                        // }
                      },
                      child: const Text(
                        'Sign up',
                        style: TextStyle(
                          fontSize: 16,
                          decoration: TextDecoration.underline,
                          color: Palette.darkBlue,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> _signIn() async {
    final formState = _formKey.currentState;
    debugPrint("isSubmitting => $isSubmitting");
    print("Form State Durumu ${formState.validate()}");

    if (formState.validate()) {
      formState.save();

      print("Email Controller : ${_emailController.text}");
      print("Password Controller : ${_passwordController.text}");
      await new Future.delayed(const Duration(seconds: 1));
      if (_emailController.text == email && _passwordController.text == sifre) {
        FlushBarMessage(true);
        await new Future.delayed(const Duration(seconds: 2));
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => HomeScreen()),
            (Route<dynamic> route) => false);
      } else {
        FlushBarMessage(false);
      }
    }
  }

  Widget FlushBarMessage(bool sonuc) {
    if (sonuc) {
      return Flushbar(
        message: "Giriş Başarılı",
        icon: Icon(
          Icons.check_circle_sharp,
          size: 28.0,
          color: Colors.green,
        ),
        duration: Duration(seconds: 3),
      )..show(context);
    } else {
      return Flushbar(
        message: "Giriş Başarısız oldu lütfen tekrar deneyiniz.",
        icon: Icon(
          Icons.info_outline,
          size: 28.0,
          color: Colors.amber,
        ),
        duration: Duration(seconds: 3),
      )..show(context);
    }
  }
}
