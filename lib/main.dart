import 'package:flutter/material.dart';

import 'package:flutter/services.dart';
import 'package:hive_flutter/adapters.dart';

import 'package:library_app/data/vos/favorite_page_vos/favorite_book_list.dart';

import 'package:library_app/data/vos/home_screen_vos/books_vo.dart';
import 'package:library_app/data/vos/home_screen_vos/buy_links_vo.dart';
import 'package:library_app/data/vos/shelf_page_vos/shelf_list_vo.dart';

import 'package:library_app/pages/navigator_page.dart';

import 'package:library_app/persistent/hive_constant.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await Hive.initFlutter();
  Hive.registerAdapter(BooksVOAdapter());
  Hive.registerAdapter(BuyLinksVOAdapter());
  Hive.registerAdapter(ShelfListVOAdapter());
  Hive.registerAdapter(FavoriteBookListAdapter());
  await Hive.openBox<List>(kHiveRecentlyViewedBookBox);
  await Hive.openBox<String>(kHiveSearchBookQueryBox);
  await Hive.openBox<List>(kHiveShelfBox);
  await Hive.openBox<BooksVO>(kHiveSavingBookBox);
  await Hive.openBox<List>(kHiveFavoriteBooksListBox);
  await Hive.openBox<List>(kHiveSearchHistoryBox);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: NavigatorPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
