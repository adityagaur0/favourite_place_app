import 'package:favourite_place_app/modal/favourite_place_modal.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserPlacesNotifier extends StateNotifier<List<Place>> {
  UserPlacesNotifier() : super(const[]);

  void addPlace(String title) {
    final newPlace=Place(title:title);
    state = [newPlace,...state];
  }

  // void removeFavouritePlaceStatus(Place place) {
  //   state = state.where((element) => element.id != place.id).toList();
  // }
}

final userPlacesProvider =
    StateNotifierProvider<UserPlacesNotifier, List<Place>>((ref) {
  return UserPlacesNotifier();
});
