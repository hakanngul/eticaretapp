import 'package:email_validator/email_validator.dart';
import 'package:eticaretapp/config/index.dart';
import 'package:eticaretapp/widgets/loading_indicator.dart';
import 'package:eticaretapp/widgets/sign_in_bar.dart';
import 'package:eticaretapp/widgets/textFormField.dart';
import 'package:eticaretapp/widgets/title.dart';
import 'package:flutter/material.dart';

class Register extends StatelessWidget {
  Register({Key key, this.onSignInPressed}) : super(key: key);

  static MaterialPageRoute get route =>
      MaterialPageRoute(builder: (context) => Register());
  final VoidCallback onSignInPressed;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final isSubmitting = false;
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Expanded(
              flex: 3,
              child: Align(
                alignment: Alignment.centerLeft,
                child: LoginTitle(
                  title: 'Create\nAccount',
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
                      decoration: registerInputDecoration(hintText: "E-mail"),
                      validator: (value) {
                        if (value.isEmpty) {
                          return "Email Boş olamaz";
                        } else if (!EmailValidator.validate(value)) {
                          return "Geçerli bir email giriniz.";
                        }
                      },
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    child: TextFormField(
                      controller: _passwordController,
                      keyboardType: TextInputType.visiblePassword,
                      decoration: registerInputDecoration(hintText: "Password"),
                      validator: (value) {
                        if (value.length < 6)
                          return "En az 6 karakterli olmalıdır.";
                      },
                      style: TextStyle(color: Colors.white),
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
                          onPressed: () {},
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
                        onSignInPressed?.call();
                      },
                      child: const Text(
                        'Sign in',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
