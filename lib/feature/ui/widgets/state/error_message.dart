import 'package:flutter/material.dart';

class DefaultErrorMessage extends StatelessWidget {
  const DefaultErrorMessage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(child: const Text('Ошибка на сервере, попробуйте позже.'));
  }
}
