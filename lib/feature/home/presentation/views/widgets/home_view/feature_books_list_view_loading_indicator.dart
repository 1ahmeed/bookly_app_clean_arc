import 'package:bookly_app/core/widgets/custom_fading_widget.dart';
import 'package:flutter/material.dart';

import 'custom_book_image_loading_indicator.dart';

class FeatureBooksListViewLoadingIndicator extends  StatelessWidget {
  const FeatureBooksListViewLoadingIndicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomFadingWidget(
      child: SizedBox(
        height: MediaQuery.of(context).size.height * .3,
        child: ListView.builder(
          itemCount:10,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: GestureDetector(
                onTap: (){
                },
                child:const CustomBookImageLoadingIndicator(),
              ),
            );
          },
        ),
      ),
    );
  }
}
