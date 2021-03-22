import 'package:Quizzler/Categories/CategoryCard.dart';
import 'package:Quizzler/Network/TokenServices/TokenServiceViewModel.dart';
import 'package:flutter/material.dart';

import 'package:Quizzler/Categories/Models/CategoryListModel.dart';
import 'package:Quizzler/Network/CategoryService.dart';

import 'package:provider/provider.dart';
import 'package:chopper/chopper.dart';

import 'package:pixabay_picker/pixabay_picker.dart';

/// A generic color pallette for the application to use
/// wherever necessary. Identified use cases so far:
/// 1. Display empty colored boxes randomly on network images
/// yet to be loaded
const List<int> colorPalette = [
  0xFFB71C1C, // Red
  0xFF880E4F, // Crimson
  0xFF4A148C, // Purple
  0xFF311B92, // Deep Purple
  0xFF1A237E, // Indigo
  0xFF0D47A1, // Blue
  0xFF004D40, // Teal
];

// Pixabay API Key
const PIXABAY_APIKEY = '20729047-b2f81354c2f3c9f1fe5f90076';
const PIXABAY_LANG = 'en';

// class CategoryList extends StatefulWidget {
class CategoryList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    /// A request for an Open Trivia Token is executed at the very
    /// beginning. This is done so that a token is available for use
    /// as and when the user navigates from Category list
    /// to the questions list.
    Provider.of<TokenServiceViewModel>(context, listen: false)
        .updateQuizToken(context);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'Quizzler',
          style: getAppBarHeading(),
          textAlign: TextAlign.center,
        ),
        elevation: 4,
      ),
      body: Provider(
        /// The Pixabay instance through the SDK | It is responsible for
        /// communicating with the Pixabay service and retrieve images
        create: (_) => PixabayPicker(
          apiKey: PIXABAY_APIKEY,
          language: PIXABAY_LANG,
        ),
        child: SafeArea(
          child: _DelayedUIBuilder(context),
        ),
      ),
    );
  }

  FutureBuilder<Response> _DelayedUIBuilder(BuildContext context) {
    return FutureBuilder(
      future: Provider.of<CategoryService>(context).getCategories(),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.done:
            return _buildCategoryList(
              context,
              CategoryListModel.fromJson(snapshot.data.body),
            );

          default:
            return Center(
              child: CircularProgressIndicator(),
            );
        }
      },
    );
  }

  // Generates a ListView for the category list retrieved from the API.
  // Creates a ListView and iteratively builds the SingleCategoryCard
  // for each of the items to be displayed under the list
  Widget _buildCategoryList(
      BuildContext context, CategoryListModel categoryList) {
    return ListView.builder(
      itemCount: categoryList.triviaCategories.length,
      itemBuilder: (context, index) {
        return CategoryCard.withParams(
          categoryModel: categoryList.triviaCategories[index],
        );
      },
    );
  }

  /// Generates a Text style of the Montserrat type font
  /// with a Bold weight and black colors and returns it to be added
  /// to Text Widgets
  TextStyle getAppBarHeading() {
    return TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.bold,
      fontSize: 24,
      fontFamily: 'Pacifico',
    );
  }
}
