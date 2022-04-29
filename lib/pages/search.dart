import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          // The search area here
          title: Container(
        width: double.infinity,
        height: 40,
        decoration: BoxDecoration(
            color: Colors.grey, borderRadius: BorderRadius.circular(5)),
        child: Center(
          child: TextField(
            cursorColor: Colors.red,
            decoration: InputDecoration(
                suffixIcon: IconButton(
                  icon: const Icon(
                    Icons.search,
                    color: Colors.redAccent,
                  ),
                  onPressed: () {
                    /* Clear the search field */
                  },
                ),
                hintText: 'Search...',
                border: InputBorder.none),
          ),
        ),
      )),
    );
  }
}
