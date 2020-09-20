import 'package:eticaretapp/config/palette.dart';
import 'package:flutter/material.dart';

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({Key key, @required this.isLoading}) : super(key: key);
  final bool isLoading;
  @override
  Widget build(BuildContext context) {
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
