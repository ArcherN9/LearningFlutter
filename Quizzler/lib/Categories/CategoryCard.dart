import 'package:Quizzler/Categories/CategoryList.dart';
import 'package:flutter/material.dart';
import 'dart:math';

import 'package:Quizzler/Categories/Models/CategoryListModel.dart';
import 'package:Quizzler/RouteGenerator.dart';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:pixabay_picker/pixabay_picker.dart';
import 'package:provider/provider.dart';

class CategoryCard extends StatelessWidget {
  /// The CategoryModel against which the current CardView
  /// is generated
  /// This is retrieved from CategoryList class through the ListView
  /// Generator.
  final CategoryModel categoryModel;

  CategoryCard.withParams({this.categoryModel});

  // generates a single category card to be added to the category list
  // This contains two parts to the card: An image section
  // and a category content section
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 4.0,
      margin: EdgeInsets.only(left: 15, right: 15, top: 7.5, bottom: 7.5),
      borderOnForeground: true,
      shape: getRoundedRectangle(radius: 15),
      child: FlatButton(
        padding: EdgeInsets.zero,
        onPressed: () {
          Navigator.of(context).pushNamed(ROUTE_QUESTIONS);
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            getCategoryImage(
              pixabay: Provider.of<PixabayPicker>(context),
              categoryModel: categoryModel,
            ),
            getCategoryTile(categoryModel: categoryModel),
          ],
        ),
      ),
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

  /// Communicates with the Pixabay API service and retrieves images
  /// with the keyword categoryName (as retrieved from OpenTrivia)
  /// Uses a CachedNetworkImage plugin to display the images
  Widget getCategoryImage(
      {PixabayPicker pixabay, CategoryModel categoryModel}) {
    if (categoryModel.categoryImageUrl.isEmpty) {
      String queryString = categoryModel.categoryName.contains(':')
          ? categoryModel.categoryName.split(':')[1].trim()
          : categoryModel.categoryName;
      return FutureBuilder(
        future: pixabay.api.requestImagesWithKeyword(
          keyword: queryString,
          resultsPerPage: 35,
        ),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.done:
              var response = snapshot.data;
              categoryModel.categoryImageUrl = response
                  .hits[getRandomNumber(upperLimit: response.hits.length)]
                  .getDownloadLink();

              return getCachedNetworkImage(categoryModel: categoryModel);
              break;

            case ConnectionState.waiting:
              return getEmptyContainer();
              break;

            default:
              return getEmptyContainer();
              break;
          }
        },
      );
    } else {
      return getCachedNetworkImage(categoryModel: categoryModel);
    }
  }

  /// A Canched Network Image builder that accepts a Category Model,
  /// checks for the imageUrl saved and attempts to download the image.
  /// In case the image is unavailable or while the image is loading,
  /// Displays a standard solid color box
  CachedNetworkImage getCachedNetworkImage({CategoryModel categoryModel}) {
    return CachedNetworkImage(
      imageUrl: categoryModel.categoryImageUrl,
      filterQuality: FilterQuality.medium,
      fit: BoxFit.fitWidth,
      height: 180,
      placeholder: (context, url) {
        return getEmptyContainer();
      },
      errorWidget: (context, url, error) => getEmptyContainer(),
    );
  }

  /// to serve as a placeholder while images are being
  /// Returns an empty container with a randomized color
  /// updated.
  Container getEmptyContainer() {
    return Container(
      color: Color(getRandomColor()),
      height: 180,
    );
  }

  /// Generates a Text style of the Montserrat type font
  /// with a Bold weight and black colors and returns it to be added
  /// to Text Widgets
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

  /// Generates a Rounded Rectangle with a defined radius
  /// and returns to the caller
  RoundedRectangleBorder getRoundedRectangle({double radius}) {
    return RoundedRectangleBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(radius),
      ),
    );
  }
}
