// Imagens da pasta assets >> https://drive.google.com/drive/folders/1oM5aVAx-Q-UoddSv9yQj4uvDe5O1VZ7O?usp=sharing

import 'package:barberapp/app/global/widgets/snackbar_custon.dart';
import 'package:barberapp/app/modules/home/controllers/home_controller.dart';
import 'package:barberapp/app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Page3 extends StatelessWidget {
  final controller = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.only(top: 18, left: 10, right: 10),
        color: Colors.teal,
        child: ListView(
          children: <Widget>[
            CircleAvatar(
              maxRadius: 48,
              backgroundImage: AssetImage('assets/logo.png'),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 25.0, top: 8.0),
                child: Text(
                  '${controller.auth.user.fullname}',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 20.0),
                ),
              ),
            ),

            Visibility(
              visible: controller.auth.user.employees.length > 0,
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 16.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8),
                    topRight: Radius.circular(8),
                    bottomLeft: Radius.circular(8),
                    bottomRight: Radius.circular(8),
                  ),
                  color: Colors.white,
                ),
                height: 150,
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          IconButton(
                            icon: Image.asset('assets/wallet.png'),
                            onPressed: () {
                              Get.toNamed(Routes.PAYMENTS);
                            },
                          ),
                          Text(
                            'Pagamentos',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      /* Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          IconButton(
                            icon: Image.asset('assets/truck.png'),
                            onPressed: () {},
                          ),
                          Text(
                            'Entregas',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )
                        ],
                      ), */
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          IconButton(
                            icon: Image.asset('assets/card.png'),
                            onPressed: () {
                              Get.toNamed(Routes.EMPLOYEE_SCHEDULES);
                            },
                          ),
                          Text(
                            'Agendamentos',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          IconButton(
                            icon: Image.asset('assets/contact_us.png'),
                            onPressed: () {
                              Get.toNamed(Routes.RATINGS);
                            },
                          ),
                          Text(
                            'Avaliações',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              color: Colors.white,
              child: ListTile(
                title: Text('Configurações'),
                subtitle: Text('Definição de privacidade'),
                leading: Image.asset(
                  'assets/settings_icon.png',
                  fit: BoxFit.scaleDown,
                  width: 30,
                  height: 30,
                ),
                trailing: Icon(Icons.chevron_right),
                onTap: () {
                  Get.toNamed(Routes.SETTINGS);
                },
              ),
            ),
            Divider(),
            Container(
              color: Colors.white,
              child: ListTile(
                title: Text('Ajuda & Suporte'),
                subtitle: Text('Centro de ajuda e suporte'),
                leading: Image.asset('assets/support.png'),
                trailing: Icon(
                  Icons.chevron_right,
                ),
                onTap: () {
                  //Get.toNamed(Routes.SETTINGS);
                  SnackbarCustom.warning(
                      "Aviso", "Recurso não disponícel para essa versão.");
                },
              ),
            ),
            Divider(),
            /* Container(
              color: Colors.white,
              child: ListTile(
                title: Text('FAQ'),
                subtitle: Text('Perguntas e respostas'),
                leading: Image.asset('assets/faq.png'),
                trailing: Icon(Icons.chevron_right),
                onTap: () {},
              ),
            ),
            Divider(), */
            Container(
              color: Colors.white,
              child: ListTile(
                title: Text('Sair'),
                subtitle: Text('Deslogar do usuário'),
                leading: Image.asset('assets/faq.png'),
                trailing: Icon(Icons.chevron_right),
                onTap: () {
                  controller.logout();
                },
              ),
            ),
            Divider(),
          ],
        ),
      ),
    );
  }
}
