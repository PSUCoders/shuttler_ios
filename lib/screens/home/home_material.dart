import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

/// Home Screen Layout with Material Style for Android devices
class HomeMaterial extends StatefulWidget {
  final List<Widget> pages;
  final List<BottomNavigationBarItem> navBarItems;
  final bool hasUnreadNotification;

  HomeMaterial({
    this.pages,
    this.navBarItems,
    this.hasUnreadNotification,
  });

  @override
  _HomeMaterialState createState() => _HomeMaterialState();
}

class _HomeMaterialState extends State<HomeMaterial>
    with SingleTickerProviderStateMixin {
  GoogleMapController mapController;
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      vsync: this,
      length: 3,
      initialIndex: 1, // Open Map tab first
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  _handleNavigationBarTap(int index) {
    _tabController.animateTo(index);

    // Force rebuild bottom navigation bar active item
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
        physics: NeverScrollableScrollPhysics(),
        controller: _tabController,
        children: widget.pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _tabController.index,
        onTap: _handleNavigationBarTap,
        items: widget.navBarItems,
      ),
    );
  }
}
