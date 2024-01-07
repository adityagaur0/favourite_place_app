import 'package:favourite_place_app/provider/user_places_provider.dart';
import 'package:favourite_place_app/widgets/input_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddPlaceScreen extends ConsumerStatefulWidget {
  AddPlaceScreen({super.key});

  @override
  ConsumerState<AddPlaceScreen> createState() => _AddPlaceScreenState();
}

class _AddPlaceScreenState extends ConsumerState<AddPlaceScreen> {
  final _formkey = GlobalKey<FormState>();

  var eneteredplace = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add new Place"),
      ),
      body: Form(
          key: _formkey,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                TextFormField(
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Must enter some value';
                    }
                    return null;
                  },
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.onBackground),
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    label: Text("Title"),
                  ),
                  onSaved: (value) {
                    eneteredplace = value!;
                  },
                ),
                //INPUT IMAGE
                const SizedBox(
                  height: 10,
                ),
                ImageInput(),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton.icon(
                  onPressed: _savePalce,
                  icon: const Icon(Icons.add),
                  label: const Text("Add place"),
                ),
              ],
            ),
          )),
    );
  }

  void _savePalce() {
    _formkey.currentState!.validate();
    _formkey.currentState!.save();
    if (eneteredplace == null) {
      return;
    }
    ref.read(userPlacesProvider.notifier).addPlace(eneteredplace);
    Navigator.of(context).pop();
  }
}
