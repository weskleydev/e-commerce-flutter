import 'package:flutter/material.dart';

class EmptyCard extends StatelessWidget {
  const EmptyCard({required this.title, required this.iconData, this.size});

  final String title;
  final IconData iconData;
  final double? size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            iconData,
            size: size ?? 50.0,
            color: Colors.white,
          ),
          const SizedBox(
            height: 8.0,
          ),
          Text(
            title,
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
