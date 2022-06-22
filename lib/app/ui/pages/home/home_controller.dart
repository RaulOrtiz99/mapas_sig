import 'dart:async';

import 'package:flutter/widgets.dart' show ChangeNotifier, ImageConfiguration;
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mapas/app/helpers/asset_to_bytes.dart';

import '../../utils/map_style.dart';

class HomeController extends ChangeNotifier {
  Map<MarkerId, Marker> _markers = {}; 

  Set<Marker> get markers => _markers.values.toSet(); 

  final _markersController = StreamController<String>.broadcast();

  Stream<String> get OnMarkerTap => _markersController.stream;

  final initialCameraPosition = const CameraPosition(
    target: LatLng(-17.77522670665063, -63.19587783875323),
    zoom: 15,
  );

  final _homerIcon= Completer<BitmapDescriptor>(); 

  HomeController(){
    assetToBytes('assets/homer.jpg',width:120).then((value){
      final bitmap = BitmapDescriptor.fromBytes(value);
      _homerIcon.complete(bitmap);
    });
  }





  void onMapCreated(GoogleMapController controller) {
    controller.setMapStyle(mapStyle);
  }

  void onTap(LatLng position) async{
    final id = _markers.length.toString();
    final markerId = MarkerId(id);
   final icon = await _homerIcon.future;
 
    final marker = Marker(
        markerId: markerId,
        position: position,
      
        draggable: true,
        icon: icon,
        onTap: () {
          _markersController.sink.add(id);
        },
        onDragEnd: (newPosition) {
          print("NEW POSITION: $newPosition");
        });
    _markers[markerId] = marker;
    notifyListeners();
  }

  @override
  void dispose() {
    _markersController.close();
    super.dispose();
  }
}


