import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../core/utils/styles.dart';

class BookRating  extends StatelessWidget {
  const BookRating({Key? key,this.mainAxisAlignment= MainAxisAlignment.start, required this.rate, required this.count}) : super(key: key);
  final MainAxisAlignment mainAxisAlignment ;
  final num rate;
  final num count;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      children:  [
        const Icon(FontAwesomeIcons.solidStar,color: Color(0xffFFDD4F),size: 14,),
        const SizedBox(width: 6.3,),
         Text(rate.toString(),style: Styles.textStyle16,),
        const  SizedBox(width: 5,),
        Opacity(
          opacity: .5,
          child: Text("(${count.toString()})",style: Styles.textStyle14.
          copyWith(fontWeight: FontWeight.w600),),
        )
      ],
    );
  }
}
