import 'package:flutter/material.dart';

import '../../services/constants.dart';
import 'outlet_add.dart';

class CheckInPage extends StatelessWidget {
  const CheckInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.colorBackground,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Stack(
              children: [
                _buildHeader(),
                _buildMenuGrid(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      height: 400,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(36.0)),
        gradient: LinearGradient(
          colors: [CustomColors.colorSatu, CustomColors.colorTiga],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: const Center(
        child: Column(
          children: [
            SizedBox(height: 36.0),
            CircleAvatar(
              radius: 50,
            ),
            SizedBox(height: 16.0),
            Text(
              'Selamat Datang',
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.white,
              ),
            ),
            Text(
              'Username',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuGrid(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 16.0,
        right: 16.0,
        top: 220.0,
      ),
      child: SizedBox(
        child: Align(
          alignment: Alignment.topCenter,
          child: Column(
            children: <Widget>[
              Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                child: GridView.count(
                  crossAxisCount: 2,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    MenuCard(
                      icon: Icons.checklist_rtl_rounded,
                      title: 'Report',
                      onTap: () {},
                    ),
                    MenuCard(
                      icon: Icons.work_history,
                      title: 'Daftar Kerja',
                      onTap: () {},
                    ),
                    MenuCard(
                      icon: Icons.wallet_rounded,
                      title: 'Slip Gaji',
                      onTap: () {},
                    ),
                    MenuCard(
                      icon: Icons.check_box_rounded,
                      title: 'Izin/Sakit/Off',
                      onTap: () {},
                    ),
                    MenuCard(
                      icon: Icons.maps_home_work_rounded,
                      title: 'Menu X',
                      onTap: () {},
                    ),
                    MenuCard(
                      icon: Icons.maps_ugc_rounded,
                      title: 'Menu Y',
                      onTap: () {},
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16.0),
              const Text('00:00:00'),
              const SizedBox(height: 16.0),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      builder: (BuildContext context) {
                        return _buildModalContent(context);
                      },
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: CustomColors.colorDua,
                  ),
                  child: const Text(
                    'Absen Check In',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildModalContent(BuildContext context) {
    double modalHeight = MediaQuery.of(context).size.height * 0.90;
    double modalWidth = MediaQuery.of(context).size.width * 0.94;

    return SizedBox(
      height: modalHeight,
      width: modalWidth,
      child: Column(
        children: [
          _buildModalHeader(context),
          const Divider(
            height: 0.5,
          ),
          _buildModalBody(),
          _buildModalFooter(context),
        ],
      ),
    );
  }

  Widget _buildModalHeader(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          const Spacer(),
          const Text(
            'Outlet terdekat',
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: CustomColors.colorDua,
            ),
          ),
          const Spacer(),
          IconButton(
            icon: const Icon(Icons.close),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }

  Widget _buildModalBody() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: ListView.builder(
          itemCount: 20,
          itemBuilder: (context, index) {
            return CustomListTile(
              icon: Icons.store_rounded,
              title:
                  'Item $index with a long description that will be truncated with ellipsis...',
              range: '${(index + 1) * 100} m',
            );
          },
        ),
      ),
    );
  }

  Widget _buildModalFooter(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const OutletAddPage()),
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: CustomColors.colorDua,
          ),
          child: const Text(
            'Tambah Outlet',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
