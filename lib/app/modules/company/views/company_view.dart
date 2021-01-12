import 'package:barberapp/app/data/model/service_model.dart';
import 'package:barberapp/app/modules/company/controllers/company_controller.dart';
import 'package:barberapp/app/modules/company/views/widgets/service_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CompanyView extends GetView<CompanyController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    image: DecorationImage(
                      image: NetworkImage( controller.company.image != "" ? controller.company.image : 'https://i.imgur.com/yFdaaEU.jpeg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            icon: Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              Get.back();
                            },
                          ),
                          IconButton(
                            icon: Icon(
                              Icons.search,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              //
                            },
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${controller.company.name}",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 20,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "${controller.company.address}",
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            "Selecione um Serviço",
                            style: TextStyle(
                                fontSize: 22, fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: controller.company.services.length,
                    itemBuilder: (context, index){
                      Service service = controller.company.services[index];
                      return ServiceCard(service);
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}