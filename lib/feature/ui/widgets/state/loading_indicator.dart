import 'package:flutter/material.dart';

class DefaultLoadingIndicator extends StatelessWidget {
  const DefaultLoadingIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RepaintBoundary(
        child: CircularProgressIndicator(
          backgroundColor: Colors.blue[200],
        ),
      ),
    );
  }
}
