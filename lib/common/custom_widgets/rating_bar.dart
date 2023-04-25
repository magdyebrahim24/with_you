import 'package:flutter/material.dart';

class RatingBar extends StatelessWidget {
  const RatingBar({Key? key, required this.rate}) : super(key: key);

  final int rate ;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      child: ListView.builder(
        itemBuilder: (context, index) {
          if(index < rate){
            return const Icon(
              Icons.star,
              color: Colors.amber,
              size: 16,
            );
          }
          return const Icon(
            Icons.star_border,
            color: Colors.amber,
            size: 17,
          );
        },
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: 5,
      ),
    );
  }
}
