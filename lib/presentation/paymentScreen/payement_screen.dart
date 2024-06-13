import 'package:flutter/material.dart';
import 'package:simple_ripple_animation/simple_ripple_animation.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key, required this.imageUrl, required this.name});

  final String imageUrl;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  Colors.lightBlue,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Center(
            child: Container(
              child: RippleAnimation(
                  color: Color.fromARGB(181, 255, 255, 255),
              delay: const Duration(milliseconds: 300),
              repeat: true,
              minRadius: 120,
              ripplesCount: 6,
              duration: const Duration(milliseconds: 6 * 300),
              child: CircleAvatar(backgroundImage: AssetImage(imageUrl),radius: 85,)),
            ),
          ),
      // SizedBox(height: 70,),
          Container(
            height: 155,
            
            child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
            Text("Paying", style: TextStyle(fontSize: 18, color: Colors.white),),
            Text(name, style: TextStyle(fontSize:28, fontWeight: FontWeight.bold, color:  Colors.white ),),

            SizedBox(height: 50,),
                    Container(
            height: 50,
            width: 220,
            decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(10)),
      
            child: InkWell(
              
              onTap: () => Navigator.of(context).pop(),
              child: Center(child: Text("Cancel Payment", style: TextStyle(fontSize: 22, color: Colors.black, fontWeight: FontWeight.w600),))),)
          ],),),

  
        ],
      ),
    );
  }
}