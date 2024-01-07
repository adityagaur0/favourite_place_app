import 'package:favourite_place_app/modal/favourite_place_modal.dart';
import 'package:favourite_place_app/provider/user_places_provider.dart';
import 'package:favourite_place_app/screens/add_place.dart';
import 'package:favourite_place_app/widgets/place_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PlacesScreen extends ConsumerWidget {
  PlacesScreen({super.key});

  final List<Place> _favouriteplaceslist = [];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userPlaces = ref.watch(userPlacesProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Places"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (ctx) => AddPlaceScreen()),
              );
            },
            icon: const Icon(Icons.add),
          )
        ],
      ),
      body: PlacesList(places: userPlaces),
    );
  }

  // void onAdd() async {
  //   final newPlace = await Navigator.of(context).push(
  //     MaterialPageRoute(builder: (ctx) => AddPlaceScreen()),
  //   );
  //   if (newPlace == null) {
  //     return; //if the new item is empty return null
  //   }
  //   // setState(() {
  //   //   _favouriteplaceslist.add(newPlace);
  //   // });
  // }
}
