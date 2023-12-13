import 'package:flutter/material.dart';

mixin NestedNavigationFunctionsMixin {
  Future<bool?> closeConfirmationDialogBuilders(BuildContext context,
      {required String title,
      required String description,
      required String confirmationButtonTitle,
      required String denyButtonTitle}) {
    return showDialog<bool>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(description),
          actions: [
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: Text(confirmationButtonTitle),
              onPressed: () {
                Navigator.of(context).pop(true);
              },
            ),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: Text(denyButtonTitle),
              onPressed: () {
                Navigator.of(context).pop(false);
              },
            ),
          ],
        );
      },
    );
  }
}
