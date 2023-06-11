import 'package:bookly_app/feature/search/presentation/cubit/search_cubit/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({Key? key}) : super(key: key);

  final formKey = GlobalKey<FormState>();
  final searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        return Form(
          key: formKey,
          child: TextFormField(
            controller: searchController,
            decoration: InputDecoration(
                enabledBorder: buildOutlineInputBorder(),
                focusedBorder: buildOutlineInputBorder(),
                suffixIcon: const Icon(
                  FontAwesomeIcons.magnifyingGlass,
                  size: 24,
                ),
                hintText: "Search"),
            validator: (v) {
              if (v!.isEmpty) {
                return 'Search Can\'t be Empty';
              }
              return null;
            },
            onFieldSubmitted: (value) {
              if (formKey.currentState!.validate()) {
                SearchCubit.get(context)
                    ?.fetchSearchBooks(name: searchController.text);
              }
            },
          ),
        );
      },
    );
  }

  OutlineInputBorder buildOutlineInputBorder() {
    return OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.white),
        borderRadius: BorderRadius.circular(16));
  }
}
