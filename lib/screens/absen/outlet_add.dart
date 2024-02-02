import 'package:dnaabsensi/screens/absen/currentlocation.dart';
import 'package:flutter/material.dart';

import '../../services/constants.dart';

class OutletAddPage extends StatefulWidget {
  const OutletAddPage({super.key});

  @override
  State<OutletAddPage> createState() => _OutletAddPageState();
}

class _OutletAddPageState extends State<OutletAddPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _namaAccount = TextEditingController();
  final TextEditingController _tipeOutlet = TextEditingController();
  final TextEditingController _alasan = TextEditingController();
  final TextEditingController _kodeOutlet = TextEditingController();
  final TextEditingController _namaOutlet = TextEditingController();
  final TextEditingController _distributor = TextEditingController();
  final TextEditingController _alamat = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.colorBackground,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              _buildBackground(),
              _buildAppBar(),
              _buildContent(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBackground() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        height: 250,
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
              SizedBox(height: 56.0),
              Icon(
                Icons.store_rounded,
                size: 72.0,
                color: CustomColors.colorBackground,
              ),
              SizedBox(height: 8.0),
              Text(
                'Tambah Outlet',
                style: TextStyle(
                  fontSize: 20.0,
                  color: CustomColors.colorBackground,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAppBar() {
    return Positioned(
      top: 16,
      left: 16,
      right: 0,
      child: AppBar(
        leading: IconButton(
          icon: Container(
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: CustomColors.colorBackground,
            ),
            padding: const EdgeInsets.all(8.0),
            child: const Icon(
              Icons.arrow_back,
              color: CustomColors.colorDua,
            ),
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
    );
  }

  Widget _buildContent() {
    return Padding(
      padding: const EdgeInsets.only(
        top: kToolbarHeight + 136.0,
        left: 32.0,
        right: 32.0,
      ),
      child: Align(
        alignment: Alignment.topCenter,
        child: Column(
          children: <Widget>[
            Form(
              key: _formKey, // Associate the _formKey with the Form widget
              child: Column(
                children: [
                  _buildMapContainer(),
                  const SizedBox(height: 16.0),
                  _buildFormContainer(),
                  const SizedBox(height: 16.0),
                  _buildTakePictureContainer(),
                ],
              ),
            ),
            const SizedBox(height: 16.0),
            _buildSaveChangesButton(),
            const SizedBox(height: 16.0),
          ],
        ),
      ),
    );
  }

  Widget _buildMapContainer() {
    return Column(
      children: [
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: TextFormField(
                    controller: _alamat,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter alamat.';
                      }
                      return null;
                    },
                    maxLines: null,
                    style: const TextStyle(
                      color: CustomColors.colorDua,
                    ),
                    decoration: InputDecoration(
                      hintText: 'Alamat*',
                      hintStyle: TextStyle(
                        color: CustomColors.colorDua.withOpacity(0.7),
                      ),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                IconButton(
                  color: CustomColors.colorDua,
                  icon: const Icon(
                    Icons.location_pin,
                    size: 30.0,
                    color: CustomColors.colorTiga,
                  ),
                  onPressed: () async {
                    final result = await Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              CurrentLocationPage(alamatVal: _alamat)),
                    );
                    if (result != null) {
                      // double latitude = result['latitude'];
                      // double longitude = result['longitude'];
                      String address = result['address'];
                      setState(() {
                        _alamat.text = address;
                        // _alamat.text = '$longitude, $latitude';
                      });
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildFormContainer() {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            CustomTextFormField(
              label: 'Pilih nama account*',
              controller: _namaAccount,
            ),
            CustomTextFormField(
              label: 'Pilih tipe outlet*',
              controller: _tipeOutlet,
            ),
            CustomTextFormField(
              label: 'alasan tambah toko',
              controller: _alasan,
            ),
            CustomTextFormField(
              label: 'Input kode outlet',
              controller: _kodeOutlet,
            ),
            CustomTextFormField(
              label: 'Nama outlet*',
              controller: _namaOutlet,
            ),
            CustomTextFormField(
              label: 'Pilih distributor center*',
              controller: _distributor,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTakePictureContainer() {
    return Container(
      width: double.infinity,
      height: 200.0,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            IconButton(
              icon: const Icon(
                Icons.add_a_photo_rounded,
                size: 80.0,
                color: CustomColors.colorDua,
              ),
              onPressed: () {
                // Add your logic to take a picture
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSaveChangesButton() {
    return SizedBox(
      width: double.infinity,
      height: 50.0,
      child: ElevatedButton(
        onPressed: () {
          if (_formKey.currentState?.validate() ?? false) {
            // Validation passed, perform save changes logic
            // This method will be called when the "Save Changes" button is pressed
          }
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: CustomColors.colorDua,
        ),
        child: const Text(
          'Save Changes',
          style: TextStyle(color: CustomColors.colorBackground),
        ),
      ),
    );
  }
}
