import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:screenshot/screenshot.dart';
import 'package:section_8/domain/models/location_model.dart';
import 'package:section_8/injector.dart';
import 'package:section_8/presentation/providers/chat_provider.dart';
import 'package:section_8/presentation/providers/map_provider.dart';
import 'package:section_8/presentation/widgets/centered_circular_loading.dart';

class MapPage extends StatefulWidget {
  const MapPage({Key? key}) : super(key: key);

  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  ScreenshotController _screenshotController = ScreenshotController();
  GoogleMapController? _mapController;
  DeviceLocation? currentLocation;
  DeviceLocation? selectedLocation;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, getLocation);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Map'),
          actions: [
            if (!isLoading)
              IconButton(
                icon: const Icon(Icons.send),
                onPressed: () {
                  sendLocation();
                },
              ),
            if (isLoading)
              CenteredCircularLoading(
                inverted: true,
              ),
          ],
        ),
        body: Screenshot(
          controller: _screenshotController,
          child: GoogleMap(
            initialCameraPosition: CameraPosition(
              target: LatLng(
                currentLocation?.latitude ?? 0,
                currentLocation?.longitude ?? 0,
              ),
              zoom: 15,
            ),
            onMapCreated: (GoogleMapController controller) {
              _mapController = controller;
            },
            myLocationEnabled: true,
            onTap: (LatLng position) {
              final loc = DeviceLocation(
                  latitude: position.latitude, longitude: position.longitude);
              setState(() => selectedLocation = loc);
              get<MapProvider>().setSelectedLocation(loc);
            },
            markers: getMarkers(),
          ),
        ));
  }

  void getLocation() async {
    final location = await get<MapProvider>().getDeviceLocation();
    setState(() => currentLocation = location);
    _mapController?.moveCamera(CameraUpdate.newCameraPosition(CameraPosition(
      target: LatLng(
        location.latitude,
        location.longitude,
      ),
      zoom: 15,
    )));
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

  void sendLocation() async {
    if (selectedLocation == null) {
      return;
    }

    setState(() => isLoading = true);
    final image = await _screenshotController.capture();

    if (image == null) {
      setState(() => isLoading = false);
      return;
    }

    final mapProvider = get<MapProvider>();

    final imagePath = await mapProvider.saveMapImage(image);

    final chatProvider = get<ChatProvider>();
    await chatProvider.sendLocation(imagePath, selectedLocation!);

    setState(() => isLoading = false);
    Navigator.pop(context);
  }
}
