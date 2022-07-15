import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:section_8/domain/models/location_model.dart';
import 'package:section_8/injector.dart';
import 'package:section_8/presentation/providers/map_provider.dart';
import 'package:section_8/presentation/widgets/centered_circular_loading.dart';

class MapPage extends StatefulWidget {
  const MapPage({Key? key}) : super(key: key);

  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  late GoogleMapController _mapController;
  DeviceLocation? selectedLocation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Map'),
      ),
      body: FutureBuilder<DeviceLocation>(
          future: get<MapProvider>().getDeviceLocation(),
          builder: (context, snapshot) {
            if (snapshot.connectionState != ConnectionState.done) {
              return CenteredCircularLoading();
            }
            final location = snapshot.data!;
            return GoogleMap(
              initialCameraPosition: CameraPosition(
                target: LatLng(location.latitude, location.longitude),
                zoom: 15,
              ),
              onMapCreated: (GoogleMapController controller) {
                _mapController = controller;
              },
              onTap: (LatLng position) {
                final loc = DeviceLocation(
                    latitude: position.latitude, longitude: position.longitude);
                setState(() => selectedLocation = loc);
              },
              markers: getMarkers(),
            );
          }),
    );
  }

  Set<Marker> getMarkers() {
    if (selectedLocation == null) {
      return {};
    }
    return {
      Marker(
        markerId: MarkerId('selected'),
        position:
            LatLng(selectedLocation!.latitude, selectedLocation!.longitude),
      ),
    };
  }
}
