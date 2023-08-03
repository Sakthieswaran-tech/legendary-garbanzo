import 'package:flutter/material.dart';

class DealOfTheDay extends StatelessWidget {
  const DealOfTheDay({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.topLeft,
          padding: const EdgeInsets.only(left: 10, top: 15),
          child: const Text(
            'Deal of the day',
            style: TextStyle(fontSize: 20),
          ),
        ),
        Image.network(
          'https://plus.unsplash.com/premium_photo-1690487695956-ecef603b4249?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=464&q=80',
          height: 235,
          fit: BoxFit.fitHeight,
        ),
        Container(
          padding: const EdgeInsets.only(left: 10),
          alignment: Alignment.topLeft,
          child: const Text(
            '\$100',
            style: TextStyle(fontSize: 18),
          ),
        ),
        Container(
          alignment: Alignment.topLeft,
          padding: const EdgeInsets.only(left: 10, top: 5, right: 40),
          child: const Text(
            'Product name',
            overflow: TextOverflow.ellipsis,
          ),
        ),
        SingleChildScrollView(
          padding: const EdgeInsets.only(top: 5),
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.network(
                  'https://images.unsplash.com/photo-1682687219570-4c596363fd96?ixlib=rb-4.0.3&ixid=M3wxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1075&q=80',
                  fit: BoxFit.fitHeight,
                  height: 100,
                  width: 100),
              Image.network(
                  'https://images.unsplash.com/photo-1682687219570-4c596363fd96?ixlib=rb-4.0.3&ixid=M3wxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1075&q=80',
                  fit: BoxFit.fitHeight,
                  height: 100,
                  width: 100),
              Image.network(
                  'https://images.unsplash.com/photo-1682687219570-4c596363fd96?ixlib=rb-4.0.3&ixid=M3wxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1075&q=80',
                  fit: BoxFit.fitHeight,
                  height: 100,
                  width: 100),
              Image.network(
                  'https://images.unsplash.com/photo-1682687219570-4c596363fd96?ixlib=rb-4.0.3&ixid=M3wxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1075&q=80',
                  fit: BoxFit.fitHeight,
                  height: 100,
                  width: 100),
            ],
          ),
        ),
        Container(
          alignment: Alignment.topLeft,
          padding: const EdgeInsets.symmetric(vertical: 15).copyWith(left: 15),
          child: const Text(
            'See all deals',
            style: TextStyle(color: Colors.cyan),
          ),
        )
      ],
    );
  }
}
