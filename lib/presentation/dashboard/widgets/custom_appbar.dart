import 'package:bitroot_test/presentation/profileScreen/profile_screen.dart';
import 'package:flutter/material.dart';

class DashboardAppbar extends StatelessWidget {
  const DashboardAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => ProfileScreen(),
      )),
      child: Container(
        margin: EdgeInsets.only(left: 15),
        child: Row(
          children: [
            InkWell(
                child: CircleAvatar(
              backgroundColor: Colors.white,
              radius: 38,
              child: CircleAvatar(
                backgroundColor: Colors.white,
                backgroundImage: AssetImage("lib/assets/images/user1.jpg"),
                radius: 35,
              ),
            )),
            SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Hi Eva Max,",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text(
                  "Here's your spending dashboard",
                  style: TextStyle(fontSize: 20),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
