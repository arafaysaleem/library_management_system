import 'package:flutter/material.dart';

import '../../utils/helper.dart';

class GenresList extends StatefulWidget {
  //TODO: use this when Genre complete
  // final List<Genre> genres;

  final List<String> genres;
  final PageController controller;

  const GenresList({
    Key key,
    @required this.genres,
    @required this.controller,
  }) : super(key: key);

  @override
  _GenresListState createState() => _GenresListState();
}

class _GenresListState extends State<GenresList> {
  int _activeIndex;

  @override
  void initState() {
    super.initState();
    _activeIndex = 0;
  }

  @override
  Widget build(BuildContext context) {
    final genres = widget.genres;
    return SizedBox(
      height: 34,
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: genres.length,

        //TODO: Change item builder to use genre item
        itemBuilder: (ctx, i) => InkWell(
          onTap: () {
            if (_activeIndex == i) return;

            setState(() {
              _activeIndex = i;
              widget.controller.animateToPage(
                i,
                duration: Duration(milliseconds: 300),
                curve: Curves.linear,
              );
            });
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
                    color: i == _activeIndex ? Colors.white : Colors.white54,
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
                  width: _activeIndex == i ? 15 : 0,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
