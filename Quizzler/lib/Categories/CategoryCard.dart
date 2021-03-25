import 'package:Quizzler/Categories/CategoryCardViewModel.dart';
import 'package:Quizzler/RouteGenerator.dart';
import 'package:flutter/material.dart';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:provider/provider.dart';

class CategoryCard extends StatelessWidget {
  /// The view model for this widget
  CategoryCardViewModel viewModel;

  // generates a single category card to be added to the category list
  // This contains two parts to the card: An image section:FZF
  // and a category content section
  @override
  Widget build(BuildContext context) {
    viewModel = Provider.of<CategoryCardViewModel>(context, listen: false);

    return Card(
      color: Colors.white,
      elevation: 4.0,
      margin: EdgeInsets.only(left: 15, right: 15, top: 7.5, bottom: 7.5),
      borderOnForeground: true,
      shape: getRoundedRectangle(radius: 15),
      child: FlatButton(
        shape: getRoundedRectangle(radius: 15),
        padding: EdgeInsets.zero,
        onPressed: () async {
          viewModel.onCardPressed().then((questions) {
            Navigator.of(context).pushNamed(
              ROUTE_QUESTIONS,
              arguments: questions,
            );
          });
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            getCategoryImage(),
            getCategoryTile(),
          ],
        ),
      ),
    );
  }

  // This constitutes the second
  Widget getCategoryTile() {
    return Padding(
      padding: EdgeInsets.all(15),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 15),
              child: Text(
                viewModel.CategoryIdToQuizId(),
                style: getQuestionTileTextStyle(12),
              ),
            ),
            Text(
              viewModel.getCategoryName(),
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
  Widget getCategoryImage() {
    if (viewModel.categoryModel.categoryImageUrl.isEmpty) {
      return FutureBuilder(
        future: viewModel.retrieveCategoryImage(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.done:
              var response = snapshot.data;
              viewModel.categoryModel.categoryImageUrl =
                  response.hits[viewModel.getRandomNumber(
                upperLimit: response.hits.length,
              )]
                      .getDownloadLink();

              return getCachedNetworkImage();
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
      return getCachedNetworkImage();
    }
  }

  /// A Canched Network Image builder that accepts a Category Model,
  /// checks for the imageUrl saved and attempts to download the image.
  /// In case the image is unavailable or while the image is loading,
  /// Displays a standard solid color box
  CachedNetworkImage getCachedNetworkImage() {
    return CachedNetworkImage(
      imageUrl: viewModel.categoryModel.categoryImageUrl,
      imageBuilder: (context, imageProvider) => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15), topRight: Radius.circular(15)),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: imageProvider,
          ),
        ),
      ),
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
      decoration: BoxDecoration(
        color: Color(viewModel.getRandomColor()),
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15), topRight: Radius.circular(15)),
      ),
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
