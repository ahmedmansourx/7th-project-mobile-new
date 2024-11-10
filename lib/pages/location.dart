import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:flutter/services.dart'; // For clipboard

class MapPage extends StatefulWidget {
  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  GoogleMapController? _mapController;
  Location _location = Location();
  LatLng _currentLatLng = LatLng(0, 0);
  LatLng? _savedLocation; // Variable to store saved location
  Set<Marker> _markers = {};

  @override
  void initState() {
    super.initState();
    _initializeLocation();
  }

  Future<void> _initializeLocation() async {
    // Request location permissions
    bool _serviceEnabled = await _location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await _location.requestService();
      if (!_serviceEnabled) return;
    }

    PermissionStatus _permissionGranted = await _location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await _location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) return;
    }

    // Get the current location and update map
    LocationData _currentLocation = await _location.getLocation();
    _updateMapLocation(_currentLocation);
  }

  void _updateMapLocation(LocationData currentLocation) {
    _currentLatLng = LatLng(currentLocation.latitude!, currentLocation.longitude!);

    setState(() {
      _markers.clear();
      _markers.add(Marker(
        markerId: MarkerId('current_location'),
        position: _currentLatLng,
        infoWindow: InfoWindow(title: 'You are here'),
      ));
    });

    _mapController?.animateCamera(CameraUpdate.newLatLngZoom(_currentLatLng, 14));
  }

  // Function to save the current location
  void _saveLocation() {
    setState(() {
      _savedLocation = _currentLatLng;
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Location saved: $_savedLocation')),
    );
  }

  // Function to copy location as a link
  void _copyLocationLink() {
    if (_currentLatLng != null) {
      final String locationUrl = 'https://www.google.com/maps?q=${_currentLatLng.latitude},${_currentLatLng.longitude}';
      Clipboard.setData(ClipboardData(text: locationUrl));
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Location link copied to clipboard!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Current Location')),
      body: GoogleMap(
        initialCameraPosition: CameraPosition(target: _currentLatLng, zoom: 14.0),
        onMapCreated: (controller) => _mapController = controller,
        markers: _markers,
        myLocationEnabled: true,
        myLocationButtonEnabled: true,
      ),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            onPressed: () async {
              LocationData currentLocation = await _location.getLocation();
              _updateMapLocation(currentLocation);
            },
            child: Icon(Icons.my_location),
            tooltip: 'Get Current Location',
          ),
          SizedBox(height: 10),
          FloatingActionButton(
            onPressed: _saveLocation,
            child: Icon(Icons.save),
            tooltip: 'Save Current Location',
          ),
          SizedBox(height: 10),
          FloatingActionButton(
            onPressed: _copyLocationLink,
            child: Icon(Icons.copy),
            tooltip: 'Copy Location Link',
          ),
        ],
      ),
    );
  }
}
