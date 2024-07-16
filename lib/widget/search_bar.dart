// lib/widgets/search_bar.dart

import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  final ValueChanged<String> onChanged;

  const SearchBar({required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search vehicles...',
          prefixIcon: Icon(Icons.search),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          filled: true,
          contentPadding: EdgeInsets.symmetric(vertical: 10),
        ),
        onChanged: onChanged,
      ),
    );
  }
}
