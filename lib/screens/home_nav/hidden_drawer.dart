import 'package:edumarshal/screens/events/events_page.dart';
import 'package:edumarshal/screens/home/home_page.dart';
import 'package:edumarshal/screens/payment/payment_history_page.dart';
import 'package:edumarshal/screens/profile/profile_page.dart';
import 'package:edumarshal/screens/time_table/time_table_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hidden_drawer_menu/hidden_drawer_menu.dart';

import '../../controllers/db_controller.dart';
import '../../utils/dialogs.dart';

class HiddenDrawer extends StatefulWidget {
  const HiddenDrawer({super.key, required this.accessToken});
  final String accessToken;
  @override
  State<HiddenDrawer> createState() => _HiddenDrawerState();
}

class _HiddenDrawerState extends State<HiddenDrawer> {
  List<ScreenHiddenDrawer> _pages = [];

  late String email;

  @override
  void initState() {
    super.initState();

    // Map<String, dynamic>? jwtDecodedToken;
    try {
      // jwtDecodedToken = JwtDecoder.decode(widget.token!);
    } catch (e) {
      if (kDebugMode) {
        print('Error decoding token: $e');
      }
    }

    // Use default value if email is null
    // email = jwtDecodedToken?['email'] ?? 'DefaultEmail';
    email = 'DefaultEmail';

    _pages = [
      ScreenHiddenDrawer(
        ItemHiddenMenu(
            name: 'HomePage',
            baseStyle: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            selectedStyle: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            colorLineSelected: const Color.fromARGB(255, 251, 162, 45)),
        const HomePage(),
      ),

      ScreenHiddenDrawer(
        ItemHiddenMenu(
            name: 'Profile',
            baseStyle: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            selectedStyle: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            colorLineSelected: const Color.fromARGB(255, 251, 162, 45)),
        const ProfilePage(),
      ),

      ScreenHiddenDrawer(
        ItemHiddenMenu(
            name: 'Events',
            baseStyle: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            selectedStyle: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            colorLineSelected: const Color.fromARGB(255, 251, 162, 45)),
        const EventsPage(),
      ),

      ScreenHiddenDrawer(
        ItemHiddenMenu(
            name: 'Calender',
            baseStyle: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            selectedStyle: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            colorLineSelected: const Color.fromARGB(255, 251, 162, 45)),
        const TimeTablePage(),
      ),

      ScreenHiddenDrawer(
        ItemHiddenMenu(
            name: 'Payment History',
            baseStyle: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            selectedStyle: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            colorLineSelected: const Color.fromARGB(255, 251, 162, 45)),
        const PaymentHistoryPage(),
      ),

      //  ScreenHiddenDrawer(
      //   ItemHiddenMenu(
      //   name: 'Test',
      //   baseStyle: const TextStyle(
      //     fontSize: 20,
      //     fontWeight: FontWeight.bold,
      //     color: Colors.white,
      //   ),
      //   selectedStyle: const TextStyle(
      //     fontSize: 20,
      //     fontWeight: FontWeight.bold,
      //     color: Colors.white,

      //   ),
      //    colorLineSelected: const Color.fromARGB(255, 251, 162, 45)
      //   ),

      // ),

      ScreenHiddenDrawer(
        ItemHiddenMenu(
          name: 'SignOut',
          baseStyle: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          selectedStyle: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          onTap: () {
            DataBaseCon handler = DataBaseCon();
            handler.deleteUser(1);
            Navigator.pushReplacementNamed(context, '/login');
          },
          colorLineSelected: const Color.fromARGB(255, 251, 162, 45),
        ),
        Container(),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return await Dialogs().showExitConfirmationDialog(context);
      },
      child: HiddenDrawerMenu(
        backgroundColorAppBar: Colors.cyan,
        disableAppBarDefault: false,
        actionsAppBar: const <Widget>[],

        backgroundColorMenu: const Color.fromARGB(255, 199, 181, 246),
        screens: _pages,
        initPositionSelected: 0,

        slidePercent: 50,
        contentCornerRadius: 25,
        boxShadow: const [],
        // verticalScalePercent: 80.0,
        //    contentCornerRadius: 10.0,
        //  elevationAppBar: 100.0
      ),
    );
  }
}
