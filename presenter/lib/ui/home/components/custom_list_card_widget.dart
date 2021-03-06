import 'package:flutter/material.dart';
import 'package:presenter/ui/home/stores/favorite_controller.dart';
import 'package:presenter/ui/home/stores/movie_controller.dart';
import '../../../dependencies/dependencies.dart';
import '../../details/screens/details_page.dart';

class CustomListCardWidget extends StatefulWidget {
  final MovieDetailDto movie;
  final FavoriteController controller;

  const CustomListCardWidget({
    Key? key,
    required this.movie,
    required this.controller,
  }) : super(key: key);

  @override
  State<CustomListCardWidget> createState() => _CustomListCardWidgetState();
}

class _CustomListCardWidgetState extends State<CustomListCardWidget> {

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (__) => DetailsPage(
                        movie: widget.movie,
                      ),
                  fullscreenDialog: true));
        },
        child: Container(
          height: 200,
          decoration: BoxDecoration(
              color: Colors.black54, borderRadius: BorderRadius.circular(8)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    bottomLeft: Radius.circular(15)),
                child: Hero(
                  tag: widget.movie.id,
                  child: Image.network(API.REQUEST_IMG(widget.movie.posterPath),
                      loadingBuilder: (__, child, progress) {
                    if (progress == null) return child;
                    return const CircularProgressIndicator.adaptive();
                  }),
                ),
              ),
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.movie.title,
                        style: Theme.of(context).textTheme.headline6,
                        softWrap: true,
                        overflow: TextOverflow.visible,
                      ),
                      const Spacer(),
                      Text('Popularidade:${widget.movie.popularity}'),
                      const SizedBox(height: 10),
                      Text('Votos:${widget.movie.voteAverage}'),
                    ]),
              )),
              Align(
                alignment: Alignment.bottomCenter,
                child: ValueListenableBuilder<bool>(
                  valueListenable: widget.controller.isFavorite$,
                  builder: (_, isFavorite, __) {
                    return IconButton(
                        onPressed: widget.controller.toggleFavorite,
                        icon: Icon(
                          widget.controller.isFavorite
                              ? Icons.favorite
                              : Icons.favorite_border,
                          color: Colors.red,
                        ));
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
