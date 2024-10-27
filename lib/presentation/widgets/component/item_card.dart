import 'package:flutter/material.dart';

Widget itemCard(String itemName, String itemValue) {
  return Padding(
    padding: const EdgeInsets.only(top: 8.0, left: 15, right: 15),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          margin: const EdgeInsets.only(left: 5.0),
          child: Text(
            itemName,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
            child: Text(
          itemValue,
          style: const TextStyle(fontSize: 18),
        )),
      ],
    ),
  );
}
