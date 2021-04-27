import 'dart:async';

import 'package:barberapp/app/data/model/auth_model.dart';
import 'package:barberapp/app/data/model/company_model.dart';
import 'package:barberapp/app/data/model/schedule_model.dart';
import 'package:barberapp/app/data/repository/company_repository.dart';
import 'package:barberapp/app/data/repository/schedule_repository.dart';
import 'package:barberapp/app/global/widgets/navigation_item.dart';
import 'package:barberapp/app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeController extends GetxController with StateMixin{
  // Essential
  final box = GetStorage('barberapp');
  final scheduleRepo = Get.find<ScheduleRepository>();
  final companyRepo = Get.find<CompanyRepository>();

  // Bottom Nav Custom
  RxInt selectedIndex = 0.obs;
  Color backgroundColorNav = Colors.white;

  List<NavigationItem> items = [
    NavigationItem(Icon(Icons.home), Text('Início'), Colors.deepPurpleAccent),
    NavigationItem(Icon(Icons.search), Text('Procurar'), Colors.pinkAccent),
    NavigationItem(Icon(Icons.person_outline), Text('Perfil'), Colors.teal),
  ];

  // Page 1
  RxList<Schedule> listSchedules = <Schedule>[].obs;

  // Page 2
  //-30.034399, -51.212597
  Rx<LatLng> center = LatLng(-30.034399, -51.212597).obs;
  Completer<GoogleMapController> gmapController = Completer();
  LatLng lastMapPosition;
  Position currentLocation;
  Set<Marker> markers = {};

  RxList<Company> listCompanies = <Company>[].obs;

  // Page 3
  Auth auth;

  @override
  void onInit() {
    loadData();
    auth = Auth.fromJson(box.read('auth'));
    getUserLocation();
    super.onInit();
  }

  void loadData() async {
    //listSchedules.assignAll(await scheduleRepo.getAll());
    await scheduleRepo.getAll().then((value){
      listSchedules.assignAll(value);
      if(value.length > 0) change(value, status: RxStatus.success());
      else change(null, status: RxStatus.empty());
    }, onError: (err){
      change(null, status: RxStatus.error('Houve um erro na requisição.'));
    });

    rebuildMarkers();
    print('loadData');
  }

  void onMapCreated(GoogleMapController controller) {
    gmapController.complete(controller);
  }

  void onCameraMove(CameraPosition position) {
    lastMapPosition = position.target;
  }

  getUserLocation() async {
    currentLocation = await locateUser();
    center.value = LatLng(currentLocation.latitude, currentLocation.longitude);
    print('center $center');
  }

  Future<Position> locateUser() async {
    return Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }

  void loadMarkers() {
    print('load');
    if (listCompanies.length > 0) {
      listCompanies.forEach((e) {
        markers.add(
          Marker(
              markerId: MarkerId(e.id.toString()),
              position: LatLng(
                double.tryParse(e.latitude),
                double.tryParse(e.longitude),
              ),
              /* infoWindow: InfoWindow(
                title: e.name,
                snippet: e.phone,
                onTap: () {
                  print('Compania clicada ID ${e.id}');
                },
              ), */
              icon: BitmapDescriptor.defaultMarker,
              onTap: () {
                Get.defaultDialog(
                  title: "${e.name}",
                  content: Text("Telefone: ${e.phone ?? '...'}\nLink: ${e.socialLink ?? '...'}"),
                  actions: [
                    FlatButton(
                      color: Get.theme.primaryColor,
                      onPressed: () {
                        Get.back();
                        openCompany(e);
                      },
                      child: Text("Abrir"),
                    ),
                    FlatButton(
                      color: Colors.red,
                      textColor: Colors.white,
                      onPressed: () {
                        Get.back();
                      },
                      child: Text("Cancelar"),
                    ),
                  ],
                );
              }),
        );
      });
    }
  }

  void rebuildMarkers() async {
    listCompanies.assignAll(await companyRepo.getAll());
    loadMarkers();
  }

  void openCompany(Company company) async {
    var result = await Get.toNamed(Routes.COMPANY, arguments: company);
    if(result != null){
      selectedIndex.value = 0;
      loadData();
    }
  }

  void choiceIndex(int index) {
    selectedIndex.value = index;
  }

  void logout() {
    box.erase();
    Get.offAllNamed(Routes.LOGIN);
  }
}
