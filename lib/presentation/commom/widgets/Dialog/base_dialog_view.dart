import 'package:flutter/material.dart';

import '../Button/button_primary.dart';

class BaseDialogView extends StatelessWidget {
  final String titleDialog;
  final String imageDialog;
  final VoidCallback onPressed;

  const BaseDialogView(
      {super.key, required this.titleDialog, required this.imageDialog, required this.onPressed});

  void showBaseDialog(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true, // allow the bottom sheet to take full height
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        return SizedBox(
          height: 350,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 64, bottom: 24),
                child: Image.asset(imageDialog),
              ),
              Center(
                child: Text(
                  titleDialog,
                  style: const TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                  softWrap: true,
                  overflow: TextOverflow.visible,
                ),
              ),
              const SizedBox(
                height: 34,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ButtonPrimary(
                  text: "Done",
                  onPressed: () {
                    Navigator.of(context).pop();
                    onPressed();
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      showBaseDialog(context);
    });
    return const SizedBox();
  }
}
