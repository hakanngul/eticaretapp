import 'package:eticaretapp/config/index.dart';
import 'package:flutter/material.dart';

class SignUpBar extends StatelessWidget {
  const SignUpBar({
    Key key,
    @required this.label,
    @required this.onPressed,
    @required this.isLoading,
  }) : super(key: key);

  final String label;
  final VoidCallback onPressed;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontWeight: FontWeight.w800,
              color: Palette.darkBlue,
              fontSize: 24,
            ),
          ),
          Expanded(
            child: Center(
              child: _LoadingIndicator(isLoading: isLoading),
            ),
          ),
          _RoundContinueButton(
            onPressed: onPressed,
          )
        ],
      ),
    );
  }
}

class SignInBar extends StatelessWidget {
  const SignInBar({
    Key key,
    @required this.label,
    @required this.onPressed,
    @required this.isLoading,
  }) : super(key: key);

  final String label;
  final VoidCallback onPressed;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontWeight: FontWeight.w800,
              color: Palette.darkBlue,
              fontSize: 24,
            ),
          ),
          Expanded(
            child: Center(
              child: _LoadingIndicator(isLoading: isLoading),
            ),
          ),
          _RoundContinueButton(
            onPressed: onPressed,
          )
        ],
      ),
    );
  }
}

class _LoadingIndicator extends StatelessWidget {
  const _LoadingIndicator({Key key, @required this.isLoading})
      : super(key: key);
  final bool isLoading;
  @override
  Widget build(BuildContext context) {
    // final isSubmitting = context.isSubmitting();

    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 100),
      child: Visibility(
        visible: isLoading,
        child: const LinearProgressIndicator(
          backgroundColor: Palette.darkBlue,
        ),
      ),
    );
  }
}

class _RoundContinueButton extends StatelessWidget {
  const _RoundContinueButton({Key key, @required this.onPressed})
      : super(key: key);
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      elevation: 0,
      fillColor: Palette.darkBlue,
      splashColor: Palette.darkOrange,
      padding: const EdgeInsets.all(22),
      shape: const CircleBorder(),
      child: const Icon(
        Icons.arrow_right_alt_outlined,
        // FontAwesomeIcons.longArrowAltRight,
        color: Colors.white,
        // size: 32,
      ),
    );
  }
}
