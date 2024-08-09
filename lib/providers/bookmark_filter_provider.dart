import 'package:flutter/material.dart';
import '../widgets/destination_view.dart';

class BookmarkProvider extends ChangeNotifier {
  final TextEditingController searchController = TextEditingController();
  List<OneDestination> bookmarks = [];

  List<OneDestination> getFilteredBookmarks() {
    final searchQuery = searchController.text.trim().toLowerCase();
    if (searchQuery.isEmpty) {
      return bookmarks;
    } else {
      return bookmarks.where((item) {
        final itemTitle = item.title.trim().toLowerCase();
        return itemTitle.contains(searchQuery);
      }).toList();
    }
  }

  bool isBookmark(OneDestination bookmark) {
    return bookmarks.any((b) =>
        b.title == bookmark.title &&
        b.imageUrl == bookmark.imageUrl &&
        b.location == bookmark.location &&
        b.rating == bookmark.rating);
  }

  void toggleBookmark(OneDestination bookmark) {
    if (isBookmark(bookmark)) {
      bookmarks.removeWhere((b) =>
          b.title == bookmark.title &&
          b.imageUrl == bookmark.imageUrl &&
          b.location == bookmark.location &&
          b.rating == bookmark.rating);
    } else {
      bookmarks.add(bookmark);
    }
    notifyListeners();
  }
}
