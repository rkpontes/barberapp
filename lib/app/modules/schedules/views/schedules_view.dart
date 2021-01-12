import 'package:barberapp/app/global/constants.dart';
import 'package:barberapp/app/modules/schedules/controllers/schedules_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SchedulesView extends GetView<SchedulesController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Agendar Atendimento'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.check),
            onPressed: controller.onsave,
          ),
        ],
      ),
      body: Form(
        key: controller.formKey,
        child: ListView(
          padding: EdgeInsets.all(10),
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Card(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    ListTile(
                      title: Text('${controller.service.name}',
                          style: TextStyle(fontSize: 20)),
                      subtitle: Text('${controller.service.description}'),
                    ),
                    Divider(color: Colors.black),
                    ListTile(
                      title: Text('Preço'),
                      trailing: Text(
                        "R\$ ${formatcurrency.format(controller.service.cost)}",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.red),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: TextFormField(
                controller: controller.dateController,
                showCursor: true,
                readOnly: true,
                decoration: InputDecoration(
                  labelText: 'Data Prevista',
                  icon: Icon(Icons.today),
                ),
                onTap: controller.openCalendar,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Campo requerido.';
                  }
                  return null;
                },
              ),
            ),
            /* Padding(
              padding: EdgeInsets.all(8.0),
              child: TextFormField(
                controller: controller.timeController,
                showCursor: true,
                readOnly: true,
                decoration: InputDecoration(
                  labelText: 'Hora Prevista',
                  icon: Icon(Icons.access_time),
                ),
                onTap: controller.openClock,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Campo requerido.';
                  }
                  return null;
                },
              ),
            ), */
            Container(
              padding: EdgeInsets.symmetric(vertical: 15),
              child: Center(
                child: Obx(() => Text(
                      'Escolha o intervalo que deseja ser atendido. \n\nInício: ${controller.start.value.toStringAsFixed(0)}h    Término: ${controller.end.value.toStringAsFixed(0)}h',
                      textAlign: TextAlign.center,
                    )),
              ),
            ),
            Obx(
              () => RangeSlider(
                divisions: 13,
                activeColor: Colors.red[700],
                inactiveColor: Colors.red[300],
                min: 7,
                max: 20,
                values:
                    RangeValues(controller.start.value, controller.end.value),
                labels: RangeLabels(
                    '${controller.start.value.toStringAsFixed(0)}h',
                    '${controller.end.value.toStringAsFixed(0)}h'),
                onChanged: (value) {
                  print("START: ${value.start}, End: ${value.end}");
                  controller.start.value = value.start;
                  controller.end.value = value.end;
                  //controller.values = value;
                  //controller.labels = RangeLabels("${value.start.toInt().toStringAsFixed(0)}h\$", "${value.start.toInt().toStringAsFixed(0)}h\$");
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                showCursor: true,
                readOnly: true,
                decoration: InputDecoration(
                  labelText: 'Escolha um Funcionário (Opcional)',
                  icon: Icon(Icons.account_circle),
                ),
                onTap: controller.openEmployeePage,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
