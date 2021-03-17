import 'package:Quizzler/Categories/Models/CategoryListModel.dart';
import 'package:Quizzler/Network/CategoryService.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:chopper/chopper.dart';

class CategoryList extends StatefulWidget {
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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.network(
              'https://cdn.motor1.com/images/mgl/mrz1e/s3/coolest-cars-feature.jpg'),
          getCategoryTile(categoryModel: categoryModel),
        ],
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
}
