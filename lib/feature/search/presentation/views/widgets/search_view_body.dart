import 'package:bookly_app/feature/search/presentation/views/widgets/search_result_list_view.dart';
import 'package:flutter/material.dart';
import 'custom_text_field.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const  EdgeInsets.all(30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           CustomTextField(),
          const SizedBox(height: 10,),
          const SizedBox(height: 16,),
         const  Expanded(child: SearchResultListView())
        ],
      ),
    );
  }
}


