import 'package:ecosystem/constants.dart';
import 'package:flutter/material.dart';
import 'package:ecosystem/screens/home/home_screen.dart';
import 'package:ecosystem/screens/config/config_screen.dart';
import 'package:ecosystem/screens/about/about_screen.dart';
import 'package:ecosystem/screens/settings/settings_screen.dart';
import 'package:url_launcher/url_launcher.dart';

class NavigationDrawer extends StatelessWidget {
  final DrawerItem? currentItem;

  NavigationDrawer({required DrawerItem? currentItem})
      : currentItem = currentItem;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Material(
        color: colorPrimary,
        child: ListView(
          children: <Widget>[
            const SizedBox(height: 10),
            buildMenuItem(
                text: "Home",
                icon: Icons.home_rounded,
                onClicked: () => (currentItem == DrawerItem.home)
                    ? {}
                    : selectedItem(context, DrawerItem.home)),
            const SizedBox(height: 10),
            buildMenuItem(
                text: "Config",
                icon: Icons.code_rounded,
                onClicked: () => (currentItem == DrawerItem.config)
                    ? {}
                    : selectedItem(context, DrawerItem.config)),
            const SizedBox(height: 10),
            buildMenuItem(
                text: "Settings",
                icon: Icons.settings_rounded,
                onClicked: () => (currentItem == DrawerItem.settings)
                    ? {}
                    : selectedItem(context, DrawerItem.settings)),
            const SizedBox(height: 20),
            Divider(
              color: Colors.white30,
              endIndent: defaultPadding,
              indent: defaultPadding,
            ),
            const SizedBox(height: 20),
            buildMenuItem(
                text: "About",
                icon: Icons.info_rounded,
                onClicked: () => (currentItem == DrawerItem.about)
                    ? {}
                    : selectedItem(context, DrawerItem.about)),
            const SizedBox(height: 10),
            buildMenuItem(
                text: "Contribute",
                icon: Icons.code_rounded,
                onClicked: () => (currentItem == DrawerItem.contribute)
                    ? {}
                    : selectedItem(context, DrawerItem.contribute)),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  _launchURL({required String url}) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  VoidCallback? selectedItem(BuildContext context, DrawerItem item) {
    Navigator.of(context).pop();
    switch (item) {
      case DrawerItem.home:
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => HomeScreen()));
        break;
      case DrawerItem.config:
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => ConfigScreen()));
        break;
      case DrawerItem.settings:
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => SettingsScreen()));
        break;
      case DrawerItem.about:
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => AboutScreen()));
        break;
      case DrawerItem.contribute:
        _launchURL(url: githubUrl);
        break;
      default:
    }
  }

  Widget buildMenuItem(
      {required String text, required IconData icon, VoidCallback? onClicked}) {
    final color = Colors.white;
    final hoverColor = Colors.white10;

    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: defaultPadding),
      leading: Icon(icon, color: color),
      title: Text(text, style: TextStyle(color: color)),
      hoverColor: hoverColor,
      onTap: onClicked,
    );
  }
}
