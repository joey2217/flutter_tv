import 'package:flutter/material.dart';

class Mine extends StatelessWidget {
  const Mine({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Row(
          children: [
            Icon(
              Icons.perm_identity_outlined,
              size: 32,
            ),
            Expanded(
                child: Text(
              "Hello",
              style: TextStyle(fontSize: 32),
            ))
          ],
        ),
        Divider(),
      ],
    );
  }
}
