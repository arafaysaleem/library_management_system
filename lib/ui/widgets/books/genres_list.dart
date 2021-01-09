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
    final genreProvider = Provider.of<GenresProvider>(context,listen: false);
    return SizedBox(
      height: 34,
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: genreProvider.genres.length,
        itemBuilder: (ctx, i) {
          return GenreListItem(
            onTap: () {
              if (genreProvider.isActiveIndex(i)) return;
              genreProvider.setActiveIndex(i);
              genreController.animateToPage(
                i,
                duration: Duration(milliseconds: 300),
                curve: Curves.linear,
              );
            },
            genreName: genreProvider.genres[i].name,
            active: genreProvider.isActiveIndex(i),
          );
        },
      ),
    );
  }
}

class GenreListItem extends StatelessWidget {
  const GenreListItem({
    Key key,
    @required this.genreName,
    @required this.onTap,
    @required this.active,
  }) : super(key: key);

  final VoidCallback onTap;
  final bool active;
  final String genreName;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: Helper.hPadding),
        child: Column(
          children: [
            //genre name
            Text(
              genreName,
              style: TextStyle(
                fontSize: 18,
                color: active ? Colors.white : Colors.white54,
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
              width: active ? 15 : 0,
            )
          ],
        ),
      ),
    );
  }
}
