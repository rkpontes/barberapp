import 'package:barberapp/app/data/model/schedule_model.dart';
import 'package:barberapp/app/global/constants.dart';
import 'package:barberapp/app/modules/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class Page1 extends StatelessWidget {
  final controller = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    return controller.obx(
      (list) => Expanded(
        child: ListView.builder(
          itemCount: list.length,
          itemBuilder: (context, index) {
            Schedule schedule = list[index];
            /* return ListTile(
                title: Text("${schedule.service.name}"),
                subtitle: Text("${schedule.schedulingDate}"),
              ); */
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    padding: EdgeInsets.all(20),
                    color: Color(0xffdfdeff),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${schedule.service.name}",
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.w700),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Horario do Agendamento',
                          style: TextStyle(
                              color: Colors.grey, fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.timer,
                              color: Colors.black,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              "${DateFormat('dd/MM/yyyy').format(DateTime.parse(schedule.schedulingDate))} - Previsão: ${schedule.hourStart}h ~ ${schedule.hourEnd}h",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          height: 0.5,
                          color: Colors.grey,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.call,
                              color: Colors.black,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Icon(
                              Icons.mail_outline,
                              color: Colors.black,
                            ),
                            Expanded(
                              child: Container(),
                            ),
                            Text(
                              "R\$ ${formatcurrency.format(schedule.service.cost)}",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            );
          },
        ),
      ),
      onError: (err) => Expanded(child: Center(child: Text('$err'))),
      onEmpty: Expanded(child: Center(child: Text('Nenhum agendamento realizado.'))),
    );
  }
}
