import 'package:bitroot_test/infrastructure/models/transaction_model.dart';
import 'package:flutter/material.dart';

class ActivityItem extends StatefulWidget {
  const ActivityItem({
    super.key,
    required this.tranList,
    required this.index
  });
final int index;
  final List<TransactionModel> tranList;

  @override
  State<ActivityItem> createState() => _ActivityItemState();
}

class _ActivityItemState extends State<ActivityItem> with  SingleTickerProviderStateMixin {

  late  AnimationController animationControler;
  late Animation<double> _animation;

@override
  void initState() {
    super.initState();
  animationControler =AnimationController(vsync: this, duration: Duration(seconds: 4));

  _animation =Tween<double>(begin: 0, end: 1).animate(animationControler);
  animationControler.forward();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(

      opacity: _animation,
      child: Container(
        height: 80,
        child: Column(
        //  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("${widget.tranList[widget.index].product}", style: TextStyle(fontSize:18 ),),
                Text("${widget.tranList[widget.index].price}",  style: TextStyle(fontSize:18 , fontWeight: FontWeight.bold)),
              ],
            ),
            RichText(
              strutStyle:StrutStyle(height: 1.5) ,
                text: TextSpan(children: [
              TextSpan(
                  text: "${widget.tranList[widget.index].company}",
                  style: TextStyle(color: Colors.black, fontSize:16 , fontWeight: FontWeight.bold)),
        
              TextSpan(
                  text: "\n${widget.tranList[widget.index].address}",
                  style: TextStyle(color: Colors.grey)),
            ])),
            Divider()
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    animationControler.dispose();
    super.dispose();
  }
}