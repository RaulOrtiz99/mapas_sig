import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mapas/app/ui/pages/home/home_controller.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomeController>(
      create: (_) {
        final controller = HomeController();
        controller.OnMarkerTap.listen(
          (String id) {
            print("Go to $id");
          },
        );
        return controller;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Home Page'),
        ),
        body: Consumer<HomeController>(
          builder: (_, controller, __) => GoogleMap(
            markers: controller.markers,
            initialCameraPosition: controller.initialCameraPosition,
            myLocationEnabled: false,
            compassEnabled: false,
            onMapCreated: controller.onMapCreated,
            onTap: controller.onTap,
          ),
        ),
      ),
    );
  }
}
