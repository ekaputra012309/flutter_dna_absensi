import 'package:flutter/material.dart';

class CustomBottomNavBar extends StatefulWidget {
  final List<NavItem> items;
  final ValueChanged<int> onItemSelected;
  final int currentIndex;

  const CustomBottomNavBar({
    super.key,
    required this.items,
    required this.onItemSelected,
    required this.currentIndex,
  });

  @override
  _CustomBottomNavBarState createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: widget.items.map((item) {
        return BottomNavigationBarItem(
          icon: Icon(item.icon),
          label: item.label,
        );
      }).toList(),
      currentIndex: widget.currentIndex,
      onTap: widget.onItemSelected,
    );
  }
}

class NavItem {
  final IconData icon;
  final String label;

  NavItem({
    required this.icon,
    required this.label,
  });
}

class CustomColors {
  static const Color colorSatu = Colors.blueAccent;
  static const Color colorDua = Colors.lightBlueAccent;
  static const Color colorTiga = Color(0xFF83D2FA);
  static const Color colorBackground = Color.fromARGB(255, 241, 242, 251);
}

class CustomListTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String range;

  const CustomListTile(
      {super.key,
      required this.icon,
      required this.title,
      required this.range});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        icon,
        size: 36.0,
        color: CustomColors.colorDua,
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Text(
              title,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              style: const TextStyle(color: CustomColors.colorDua),
            ),
          ),
          const SizedBox(
            width: 16.0,
          ),
          Text(
            range,
          ),
        ],
      ),
    );
  }
}

class CustomTextFormField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final String? Function(String?)? customValidator;

  const CustomTextFormField({
    super.key,
    required this.label,
    required this.controller,
    this.customValidator,
  });

  String? defaultValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter $label.';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
          labelText: label,
          labelStyle: const TextStyle(color: CustomColors.colorDua)),
      validator: customValidator ?? defaultValidator,
    );
  }
}

class MenuCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback? onTap;

  const MenuCard(
      {super.key, required this.icon, required this.title, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            onTap;
          },
          child: Icon(
            icon,
            size: 60.0,
            color: CustomColors.colorDua,
          ),
        ),
        const SizedBox(height: 8.0),
        Text(
          title,
          style: const TextStyle(fontSize: 16.0, color: CustomColors.colorDua),
        ),
      ],
    );
  }
}
