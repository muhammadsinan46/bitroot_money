
import 'package:bitroot_test/infrastructure/models/contact_models.dart';
import 'package:bitroot_test/presentation/dashboard/widgets/animated_user_item.dart';
import 'package:bitroot_test/presentation/dashboard/widgets/custom_appbar.dart';
import 'package:bitroot_test/presentation/paymentScreen/payement_screen.dart';
import 'package:flutter/material.dart';


class FlexibleAppBar extends StatefulWidget {
   FlexibleAppBar({super.key});

  @override
  State<FlexibleAppBar> createState() => _FlexibleAppBarState();
}

class _FlexibleAppBarState extends State<FlexibleAppBar> {
  final appbarHeight = 66.0;

ContactModel model =ContactModel();

List<bool> _visibleItem =[];
final int count =ContactModel().contactList.length;


@override
  void initState() {

    super.initState();
    initializeVisibilty();
  }


initializeVisibilty()async{
  for(int i=0;i<count;i++){
    await Future.delayed(Duration(milliseconds: 200));
    setState(() {

      _visibleItem.add(true);
      
    });
  }

}

  @override
  Widget build(BuildContext context) {
    final double statusbarHeight = MediaQuery.of(context).padding.top;
    return Container(
      padding: EdgeInsets.only(top: statusbarHeight),
      height: appbarHeight + statusbarHeight,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          DashboardAppbar(),
          Container(
              margin: EdgeInsets.all(25),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              height: 150,
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(
                      left: 15,
                    ),
                    height: 85,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "\$ 204.05",
                          style: TextStyle(
                              fontSize: 55, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "Your Balance",
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  VerticalDivider(
                    indent: 15.0,
                    endIndent: 15.0,
                  ),
                  SizedBox(width: 20),
                  Container(
                    margin: EdgeInsets.only(
                      left: 25,
                    ),
                    height: 85,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "30",
                          style: TextStyle(
                              fontSize: 55, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "Last Days",
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )),
          Align(
            
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: EdgeInsets.only(left:8),
              child: Text("Sent Again",style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),))),
          Container(
                height: 140,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: model.contactList.length,
                  itemBuilder: (context, index) {
                    return Visibility(
                      visible: index<_visibleItem.length && _visibleItem[index],
                      child: FadeAnimation(
                        delay: 2.0+index,
                        direction: FadeInDirection.rtl,
                        fadeOffset: index ==0?80:80.0*100,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              InkWell(
                                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => PaymentScreen(imageUrl: model.contactList[index]['image'],name: model.contactList[index]['name'],),)),
                                child: CircleAvatar(
                                  backgroundColor: Colors.white,
                                  radius: 40,
                                backgroundImage: AssetImage("${model.contactList[index]['image']}"),
                                ),
                              ),
                            Text("${model.contactList[index]['name']}"),
                              SizedBox(
                                height: 10,
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              )
        ],
      ),
    );
  }
}
