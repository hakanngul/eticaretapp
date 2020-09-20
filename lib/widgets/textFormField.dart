import 'package:flutter/material.dart';

final border = OutlineInputBorder(
  borderRadius: BorderRadius.circular(7),
);

class PasswordTextFormField extends StatelessWidget {
  const PasswordTextFormField({
    Key key,
    this.style,
    this.decoration,
    @required this.controller,
    // this.initialValue,
  }) : super(key: key);

  final TextStyle style;
  final InputDecoration decoration;
  final TextEditingController controller;
  // final String initialValue;

  @override
  Widget build(BuildContext context) {
    final password = "123456";
    return TextFormField(
        style: style,
        initialValue: "123456",
        controller: controller,
        decoration: decoration ??
            InputDecoration(
              prefixIcon: const Icon(Icons.vpn_key),
              labelText: 'Password',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(7),
              ),
            ),
        autocorrect: false,
        obscureText: true,
        onChanged: (value) {
          debugPrint("Password TextFormField");
        },
        validator: (value) {});
  }
}

class EmailTextFormField extends StatelessWidget {
  const EmailTextFormField({
    Key key,
    this.style,
    this.decoration,
    @required this.controller,
    // this.initValue,
  }) : super(key: key);
  // final String initValue;
  final TextStyle style;
  final InputDecoration decoration;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      style: style,
      // controller: controller,
      initialValue: "test@test.com",
      decoration: decoration ??
          InputDecoration(
            prefixIcon: const Icon(Icons.email),
            border: border,
            labelText: 'Email',
          ),
      autocorrect: false,
      onChanged: (value) => debugPrint("OnChanged Email"),
      validator: (_) {},
    );
  }
}
