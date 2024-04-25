import 'package:flutter/material.dart';
import 'package:food_recipes/features/favourites/presentation/view/widgets/favourites_view_body.dart';

class FavouritesView extends StatelessWidget {
  const FavouritesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favourites'),
      ),
      body: const FavouritesViewBody(),
    );
  }
}
