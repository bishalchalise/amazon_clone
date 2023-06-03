import 'package:flutter/material.dart';

class DealOfDay extends StatefulWidget {
  const DealOfDay({super.key});

  @override
  State<DealOfDay> createState() => _DealOfDayState();
}

class _DealOfDayState extends State<DealOfDay> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.topLeft,
          padding: const EdgeInsets.only(
            left: 15,
          ),
          child: const Text(
            'Deal of the Day',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        ),
        Image.network(
          'https://images.unsplash.com/photo-1593078166039-c9878df5c520?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OHx8cmFkaW98ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=800&q=60',
          height: 235,
          fit: BoxFit.fitHeight,
        ),
        Container(
          padding: const EdgeInsets.only(left: 15),
          alignment: Alignment.topLeft,
          child: const Text(
            '\$100',
            style: TextStyle(fontSize: 18),
          ),
        ),
        Container(
          alignment: Alignment.topLeft,
          padding: const EdgeInsets.only(left: 15, top: 5, right: 40),
          child: const Text(
            'Radio',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.network(
                "https://images.unsplash.com/photo-1485579149621-3123dd979885?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OXx8cmFkaW98ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=800&q=60",
                fit: BoxFit.fitWidth,
                width: 100,
                height: 100,
              ),
              Image.network(
                "https://images.unsplash.com/photo-1485579149621-3123dd979885?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OXx8cmFkaW98ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=800&q=60",
                fit: BoxFit.fitWidth,
                width: 100,
                height: 100,
              ),
              Image.network(
                "https://images.unsplash.com/photo-1485579149621-3123dd979885?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OXx8cmFkaW98ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=800&q=60",
                fit: BoxFit.fitWidth,
                width: 100,
                height: 100,
              ),
              Image.network(
                "https://images.unsplash.com/photo-1485579149621-3123dd979885?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OXx8cmFkaW98ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=800&q=60",
                fit: BoxFit.fitWidth,
                width: 100,
                height: 100,
              ),
              Image.network(
                "https://images.unsplash.com/photo-1485579149621-3123dd979885?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OXx8cmFkaW98ZW58MHx8MHx8fDA%3D&auto=format&fit=crop&w=800&q=60",
                fit: BoxFit.fitWidth,
                width: 100,
                height: 100,
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 15).copyWith(left: 15),
          alignment: Alignment.topLeft,
          child: Text(
            "See all deals",
            style: TextStyle(
              color: Colors.cyan[800],
            ),
          ),
        )
      ],
    );
  }
}
