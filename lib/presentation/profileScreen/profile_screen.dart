
import 'package:bitroot_test/presentation/dashboard/widgets/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  var _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            height: 300,
            width: MediaQuery.sizeOf(context).width,
            color: Color.fromARGB(255, 211, 221, 242),
            child: Stack(
              children: [
                Positioned(
                    top: 50,
                    right: 20,
                    child: Text(
                      "Log Out",
                      style: TextStyle(
                          color: Colors.blue,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    )),
                Positioned(
                  top: 80,
                  left: MediaQuery.sizeOf(context).width / 2 - 70,
                  child: Column(

                        
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CircleAvatar(
                            backgroundImage: AssetImage("lib/assets/images/user1.jpg"),
                            radius: 70,
                          ),
                          Text(
                            "Ava Max",
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold),
                          ),
                          Text("avamax@gmail.com", style: TextStyle(fontSize: 20))
                        ],
                      )
                )
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          CustomSearchBar(searchController: _searchController),
          Expanded(
            child: ListView(children: [
              SettingsTile(title: "Personal Info",prefixIcon: Icons.person,),
              Divider(),
              SettingsTile(title: "My QR Cide",prefixIcon: Icons.qr_code,),
                          Divider(),
              SettingsTile(title: "Banks and Cards",prefixIcon: Icons.apartment,),
                          Divider(),
              SettingsTile(title: "Payment Preferences",prefixIcon: Icons.payments,),
                          Divider(),
              SettingsTile(title: "Automatic Payments",prefixIcon: Icons.replay,),
                          Divider(),
              SettingsTile(title: "Login and Security",prefixIcon: Icons.login,),
                          Divider(),
              SettingsTile(title: "Notifications",prefixIcon: Icons.notifications,),
                          Divider(),

            ],)
          )
        ],
      ),
    );
  }
}

class SettingsTile extends StatelessWidget {
   SettingsTile({
    super.key,
    required this.title,
    required this.prefixIcon
  });

    String title ;
    IconData prefixIcon;
  

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(prefixIcon),
      title: Text(title),
      trailing: Icon(Icons.arrow_forward_ios),
    );
  }
}
