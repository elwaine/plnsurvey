import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class MapPickerScreen extends StatefulWidget {
  @override
  _MapPickerScreenState createState() => _MapPickerScreenState();
}

class _MapPickerScreenState extends State<MapPickerScreen> {
  late GoogleMapController mapController;
  LatLng? selectedLocation;
  String selectedAddress = "Select a location";

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  Future<void> _getCurrentLocation() async {
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    setState(() {
      selectedLocation = LatLng(position.latitude, position.longitude);
    });

    _updateAddress(position.latitude, position.longitude);
  }

  Future<void> _updateAddress(double lat, double lng) async {
    List<Placemark> placemarks = await placemarkFromCoordinates(lat, lng);
    if (placemarks.isNotEmpty) {
      setState(() {
        selectedAddress =
            "${placemarks.first.street}, ${placemarks.first.locality}, ${placemarks.first.country}";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Pick Location")),
      body: selectedLocation == null
          ? Center(child: CircularProgressIndicator())
          : Column(
              children: [
                Expanded(
                  child: GoogleMap(
                    initialCameraPosition: CameraPosition(
                      target: selectedLocation!,
                      zoom: 15,
                    ),
                    onMapCreated: (GoogleMapController controller) {
                      mapController = controller;
                    },
                    onTap: (LatLng position) {
                      setState(() {
                        selectedLocation = position;
                      });
                      _updateAddress(position.latitude, position.longitude);
                    },
                    markers: {
                      Marker(
                        markerId: MarkerId("selected"),
                        position: selectedLocation!,
                      ),
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Text(selectedAddress, style: TextStyle(fontSize: 16)),
                      SizedBox(height: 10),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context, {
                            "lat": selectedLocation!.latitude,
                            "lng": selectedLocation!.longitude,
                            "address": selectedAddress,
                          });
                        },
                        child: Text("Confirm Location"),
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
