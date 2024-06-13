import 'package:bitroot_test/infrastructure/models/transaction_model.dart';
import 'package:bitroot_test/presentation/dashboard/widgets/activity_item.dart';
import 'package:bitroot_test/presentation/dashboard/widgets/flexible_appbar.dart';
import 'package:bitroot_test/presentation/dashboard/widgets/search_bar.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatefulWidget {
  DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  var searchController = TextEditingController();

  var scrollController = ScrollController();

    List<TransactionModel> tranList =[
  
  TransactionModel("appleMac", "Apple Inc.", "1304, colorado street suit", "\$ 250"),
  TransactionModel("Uneo Coffee filter", "ASC cofee bar", "1304, colorado street suit", "\$ 4500"),
  TransactionModel("appleMac", "Apple Inc.", "1304, colorado street suit", "\$ 250"),
  TransactionModel("Uneo Coffee filter", "ASC cofee bar", "1304, colorado street suit", "\$ 4500"),
  TransactionModel("appleMac", "Apple Inc.", "1304, colorado street suit", "\$ 250"),
  TransactionModel("Uneo Coffee filter", "ASC cofee bar", "1304, colorado street suit", "\$ 4500"),
  TransactionModel("appleMac", "Apple Inc.", "1304, colorado street suit", "\$ 250"),
    TransactionModel("Uneo Coffee filter", "ASC cofee bar", "1304, colorado street suit", "\$ 4500"),
  TransactionModel("appleMac", "Apple Inc.", "1304, colorado street suit", "\$ 250"),
  TransactionModel("Uneo Coffee filter", "ASC cofee bar", "1304, colorado street suit", "\$ 4500"),
  TransactionModel("appleMac", "Apple Inc.", "1304, colorado street suit", "\$ 250"),
  
  ];

  List<bool> _visibleItem =[];



@override
  void initState() {

    super.initState();
    initializeVisibilty();
  }


initializeVisibilty()async{
  for(int i=0;i<tranList.length;i++){
    await Future.delayed(Duration(milliseconds: 200));
    setState(() {

      _visibleItem.add(true);
      
    });
  }

}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
     
          SliverAppBar(
            pinned: false,
            actions: [Padding(
              padding: const EdgeInsets.only(right:8.0),
              child: Icon(Icons.notifications),
            )],
            backgroundColor:       Color.fromARGB(255, 211, 221, 242),
            expandedHeight: 450,

         
            flexibleSpace: FlexibleSpaceBar(background: FlexibleAppBar()),
          ),
          SliverAppBar(
            centerTitle: true,
            title: CustomSearchBar(searchController: searchController),
            pinned: true,
          ),
          SliverToBoxAdapter(
            child: Container(
              padding: EdgeInsets.all(15),
              child: Column(
                children: [
                  Row(

                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [Text("Your Activity", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),), Icon(Icons.sort,color: Colors.blue,)],
                  ),
                  Container(
                    height: MediaQuery.sizeOf(context).height,
                    child: ListView.builder(
                    controller: scrollController,
                    physics:NeverScrollableScrollPhysics() ,
                      itemCount: tranList.length,
                      itemBuilder: (context, index) {
                        return Visibility(
                            visible: index<_visibleItem.length && _visibleItem[index],
                          child: ActivityItem(tranList: tranList, index: index,));
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}




