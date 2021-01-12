import 'package:barberapp/app/modules/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Page2 extends StatelessWidget {
  final controller = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Stack(
        children: [
          Obx(
            () => Visibility(
              visible: controller.listCompanies.length > 0,
              child: GoogleMap(
                markers: Set.of(controller.markers),
                initialCameraPosition: CameraPosition(
                  target: controller.center.value,
                  zoom: 14.0,
                ),
                onMapCreated: controller.onMapCreated,
                zoomGesturesEnabled: true,
                onCameraMove: controller.onCameraMove,
                myLocationEnabled: true,
                compassEnabled: false,
                myLocationButtonEnabled: true,
                mapToolbarEnabled: false,
                //onTap: ,
              ),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 50.0),
            child: Align(
              alignment: Alignment.topRight,
              child: Column(
                children: <Widget>[
                  SizedBox(height: 16.0),
                  FloatingActionButton(
                    onPressed: () {
                      controller.rebuildMarkers();
                    },
                    materialTapTargetSize: MaterialTapTargetSize.padded,
                    child: const Icon(Icons.refresh, size: 36.0),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
