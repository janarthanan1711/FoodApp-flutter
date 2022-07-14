import 'package:flutter/material.dart';

class DrawerMenu extends StatelessWidget {
  const DrawerMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
            colors: [Colors.white, Colors.orange],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight),
      ),
      child: Material(
        color: Colors.transparent,
        child: ListView(
          children: [
            const UserAccountsDrawerHeader(
                currentAccountPicture: CircleAvatar(
                    backgroundImage: AssetImage("images/account.jpg")),
                decoration: BoxDecoration(color: Colors.transparent),
                accountName: Text(
                  "User Name",
                  style: TextStyle(color: Colors.black),
                ),
                accountEmail: Text(
                  "user100@gmail.com",
                  style: TextStyle(color: Colors.black),
                )),
            MenuList(
              title: "Orders",
              iconName: Icons.border_color,
            ),
            MenuList(
              title: "Favorites",
              iconName: Icons.favorite,
            ),
            MenuList(
              title: "Help",
              iconName: Icons.help,
            ),
            MenuList(
              title: "Rate Us",
              iconName: Icons.star_half,
            ),
            MenuList(
              title: "Log Out",
              iconName: Icons.exit_to_app,
            )
          ],
        ),
      ),
    );
  }
}

class MenuList extends StatelessWidget {
  final String title;
  final IconData iconName;

  MenuList({
    required this.title,
    required this.iconName,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {},
      leading: Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(10),
          ),
          child: Icon(iconName, color: Colors.black)),
      title: Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }
}
