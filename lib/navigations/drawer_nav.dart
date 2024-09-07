import 'package:flutter/material.dart';
import 'package:minetrack/pages/Integration_Page.dart';
import 'package:minetrack/pages/Login_Page.dart';
import 'package:minetrack/pages/Profile_Page.dart';
import 'package:minetrack/pages/Report_Page.dart';
import 'package:minetrack/pages/SMP_Page.dart';
import 'package:minetrack/pages/Settings_Page.dart';
import 'package:minetrack/pages/Shift_Handover_Page.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 0,
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'lib/images/MineTrackLogo.png',
                  width: 80,
                  height: 80,
                ),
                SizedBox(height: 10),
                Text(
                  'MINE TRACK',
                  style: TextStyle(
                    fontSize: 24,
                    color: Color.fromARGB(255, 255, 174, 0),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.settings,
              color: Colors.orange,
            ),
            title: Text('Settings'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SettingsPage()),
              );
            },
          ),
          ListTile(
            leading: Icon(
              Icons.person,
              color: Colors.orange,
            ),
            title: Text('Profile'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfilePage()),
              );
            },
          ),
          ListTile(
            leading: Icon(
              Icons.integration_instructions,
              color: Colors.orange,
            ),
            title: Text('Integration'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => IntegrationPage()),
              );
            },
          ),
          ListTile(
            leading: Icon(
              Icons.handshake,
              color: Colors.orange,
            ),
            title: Text('Shift Handover'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ShiftHandoverPage()),
              );
            },
          ),
          Spacer(),
          ListTile(
            leading: Icon(
              Icons.report,
              color: Colors.orange,
            ),
            title: Text('Report'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ReportPage()),
              );
            },
          ),
          Spacer(),
          ListTile(
            leading: Icon(
              Icons.safety_check,
              color: Colors.orange,
            ),
            title: Text('Safety Management Plan'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SmpPage()),
              );
            },
          ),
          Spacer(),
          ListTile(
            leading: Icon(
              Icons.logout,
              color: Colors.orange,
            ),
            title: Text('Logout'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => LoginPage())
              );
            },
          ),
        ],
      ),
    );
  }
}
