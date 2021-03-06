import 'package:flutter/material.dart';
import 'package:ecosystem/constants.dart';
import 'package:ecosystem/screens/common/appbar.dart';
import 'package:ecosystem/screens/common/navdrawer.dart';
import 'components/body.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
        resizeToAvoidBottomInset: false,
        drawer: NavigationDrawer(currentItem: DrawerItem.home),
        appBar: buildAppBar(context, ""),
        body: HomeBody(),
      );
}
