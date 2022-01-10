import 'package:flutter/material.dart';

class CardButton extends StatelessWidget {

  final String name;
  final IconData icon;
  final Function()? onPress;

  const CardButton({
    Key? key,
    required this.name,
    required this.icon,
    this.onPress
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: const EdgeInsets.all(40),
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(13),
        boxShadow: const [
          BoxShadow(
            offset: Offset(0, 17),
            blurRadius: 17,
            spreadRadius: -23,
          )
        ]
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onPress ?? () {},
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                const Spacer(),
                Icon(icon, color: Colors.black,),
                const Spacer(),
                Text(name, style: const TextStyle(color: Colors.lightBlue),)
              ],
            ),
          ),
        ),
      ),
    );
  }
}