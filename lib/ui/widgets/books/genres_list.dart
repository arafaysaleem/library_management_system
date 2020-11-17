import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/genres_provider.dart';

import '../../../utils/helper.dart';

class GenresList extends StatelessWidget {

  final PageController genreController;

  const GenresList({
    Key key,
    @required this.genreController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final genres = Provider.of<GenresProvider>(context,listen: false).genresString;
    return Selector<GenresProvider,int>(
      selector: (ctx,genreProvider) => genreProvider.activeIndex,
      builder: (ctx,activeIndex,_) => SizedBox(
        height: 34,
        child: ListView.builder(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: genres.length,

          //TODO: Change item builder to use genre item
          itemBuilder: (ctx, i) => InkWell(
            onTap: () {
              if (activeIndex == i) return;
              activeIndex = i;
              genreController.animateToPage(
                i,
                duration: Duration(milliseconds: 300),
                curve: Curves.linear,
              );
            },
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: Helper.hPadding),
              child: Column(
                children: [
                  //genre name
                  Text(
                    "${genres[i]}",
                    style: TextStyle(
                      fontSize: 18,
                      color: i == activeIndex ? Colors.white : Colors.white54,
                    ),
                  ),

                  SizedBox(height: 3),

                  //Animated underline
                  AnimatedContainer(
                    curve: Curves.easeInOut,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    duration: Duration(milliseconds: 200),
                    height: 2,
                    width: activeIndex == i ? 15 : 0,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
