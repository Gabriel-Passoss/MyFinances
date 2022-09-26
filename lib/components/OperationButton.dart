import 'package:flutter/material.dart';

class OperationButton extends StatelessWidget {
  const OperationButton({
    super.key,
    required this.icon,
    required this.color,
    required this.title,
  });

  final IconData icon;
  final Color color;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(bottom: 5),
          width: 55,
          height: 55,
          decoration: BoxDecoration(
              color: Colors.grey[700]!.withOpacity(0.4),
              borderRadius: BorderRadius.circular(18)),
          child: IconButton(
            onPressed: () {},
            icon: Icon(
              icon,
              color: color,
              size: 27,
            ),
          ),
        ),
        Text(
          title,
          style: TextStyle(
            color: Colors.white.withOpacity(0.8),
          ),
        )
      ],
    );
  }
}
