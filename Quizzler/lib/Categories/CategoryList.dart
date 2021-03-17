import 'package:flutter/material.dart';

import 'package:Quizzler/Categories/Models/CategoryListModel.dart';
import 'package:Quizzler/Network/CategoryService.dart';

import 'dart:math';
import 'package:provider/provider.dart';
import 'package:chopper/chopper.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:pixabay_picker/pixabay_picker.dart';
import 'package:pixabay_picker/model/pixabay_media.dart';

/// A generic color pallette for the application to use
/// wherever necessary. Identified use cases so far:
/// 1. Display empty colored boxes randomly on network images
/// yet to be loaded
List<int> colorPalette = [
  0xFFB71C1C, // Red
  0xFF880E4F, // Crimson
  0xFF4A148C, // Purple
  0xFF311B92, // Deep Purple
  0xFF1A237E, // Indigo
  0xFF0D47A1, // Blue
  0xFF004D40, // Teal
];

class CategoryList extends StatefulWidget {
  PixabayPicker pixabayPicker = PixabayPicker(
    apiKey: '20729047-b2f81354c2f3c9f1fe5f90076',
    language: "en",
  );

  @override
  State<StatefulWidget> createState() => _CategoryList();
}

class _CategoryList extends State<CategoryList> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: _DelayedUIBuilder(context),
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
        return getSingleCategoryCard(
          categoryModel: categoryList.triviaCategories[index],
        );
      },
    );
  }

  // generates a single category card to be added to the category list
  // This contains two parts to the card: An image section
  // and a category content section
  Card getSingleCategoryCard({CategoryModel categoryModel}) {
    return Card(
      color: Colors.white,
      elevation: 4.0,
      margin: EdgeInsets.only(left: 15, right: 15, top: 7.5, bottom: 7.5),
      borderOnForeground: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          getCategoryImage(categoryName: categoryModel.categoryName),
          getCategoryTile(categoryModel: categoryModel),
        ],
      ),
    );
  }

  /// Communicates with the Pixabay API service and retrieves images
  /// with the keyword categoryName (as retrieved from OpenTrivia)
  /// Uses a CachedNetworkImage plugin to display the images
  Widget getCategoryImage({String categoryName}) {
    String queryString = categoryName.contains(':')
        ? categoryName.split(':')[1].trim()
        : categoryName;
    var pixabayFuture = widget.pixabayPicker.api.requestImagesWithKeyword(
      keyword: queryString,
      resultsPerPage: 35,
    );

    return FutureBuilder(
        future: pixabayFuture,
        builder: (buildContext, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.done:
              PixabayResponse apiResponse = snapshot.data as PixabayResponse;
              if (snapshot.hasData && apiResponse.total >= 1) {
                return CachedNetworkImage(
                  imageUrl: apiResponse.hits[getRandomNumber(
                    upperLimit: apiResponse.hits.length,
                  )]
                      .getDownloadLink(),
                  filterQuality: FilterQuality.medium,
                  fit: BoxFit.fitWidth,
                  height: 180,
                  placeholder: (context, url) {
                    return getEmptyContainer();
                  },
                );
              } else {
                return getEmptyContainer();
              }
              break;

            default:
              return getEmptyContainer();
          }
        });
  }

  /// Returns an empty container with a randomized color
  /// to serve as a placeholder while images are being
  /// updated.
  Container getEmptyContainer() {
    return Container(
      color: Color(getRandomColor()),
      height: 180,
    );
  }

  // This constitutes the second
  Widget getCategoryTile({CategoryModel categoryModel}) {
    return Padding(
      padding: EdgeInsets.all(15),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 15),
              child: Text(
                'Quiz ${categoryModel.categoryId}',
                style: getQuestionTileTextStyle(12),
              ),
            ),
            Text(
              '${categoryModel.categoryName}',
              softWrap: true,
              maxLines: 2,
              textAlign: TextAlign.left,
              style: getQuestionTileTextStyle(18),
            ),
          ]),
    );
  }

  TextStyle getQuestionTileTextStyle(double fontSize) {
    return TextStyle(
      color: Colors.black87,
      fontWeight: FontWeight.bold,
      fontSize: fontSize,
      fontFamily: 'Montserrat',
    );
  }

  // Creates and returns edge insets for the quesion tile with
  // 25 DP margins on the left & right
  EdgeInsets getQuestionTileMargins() {
    return EdgeInsets.only(left: 25, right: 25);
  }

  /// A method that utilises a Random number generator constrained by
  /// the length of the color palette. The random number is used to lookup
  /// a color against the palette defined up above
  int getRandomColor() {
    // Use the random number generator and pick a random color
    int randomColor = colorPalette[Random().nextInt(colorPalette.length)];
    // Return the random color
    return randomColor;
  }

  /// Accepts the upper limit of a random number to be generated
  /// and generates a number between 0 - upper limit
  int getRandomNumber({int upperLimit}) {
    return Random().nextInt(upperLimit);
  }
}
