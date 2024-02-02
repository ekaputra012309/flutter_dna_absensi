import 'package:flutter/material.dart';
import 'package:location_picker_flutter_map/location_picker_flutter_map.dart';

import '../../services/constants.dart';

class CurrentLocationPage extends StatelessWidget {
  final TextEditingController alamatVal;

  const CurrentLocationPage({super.key, required this.alamatVal});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: MapsWidget(
          onPickedCallback: (address) {
            alamatVal.text = address;
          },
        ),
      ),
    );
  }
}

class MapsWidget extends StatelessWidget {
  final Function(String) onPickedCallback;

  const MapsWidget({required this.onPickedCallback, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlutterLocationPicker(
      initZoom: 5,
      minZoomLevel: 4,
      maxZoomLevel: 24,
      markerIcon: const Icon(
        Icons.location_on,
        color: Colors.redAccent,
        size: 50.0,
      ),
      trackMyPosition: true,
      searchBarBackgroundColor: CustomColors.colorBackground,
      selectedLocationButtonTextstyle: const TextStyle(fontSize: 18),
      mapLanguage: 'en',
      // onError: (e) => print(e),
      selectLocationButtonLeadingIcon: const Icon(Icons.check),
      onPicked: (pickedData) {
        onPickedCallback(pickedData.address);
        Navigator.pop(context, {
          'address': pickedData.address,
          'latitude': pickedData.latLong.latitude,
          'longitude': pickedData.latLong.longitude
        });
        // print(pickedData.address);
      },
      // onChanged: (pickedData) {
      //   print(pickedData.address);
      // },
      showContributorBadgeForOSM: true,
    );
  }
}
