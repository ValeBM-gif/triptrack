import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class DestinosScreen extends StatefulWidget {
  const DestinosScreen({super.key});

  @override
  State<DestinosScreen> createState() => _DestinosScreenState();
}

IconData getIconData(int index){
  switch(index){
    case 0: return Icons.travel_explore;
    case 1: return Icons.insert_invitation;
    case 2: return Icons.holiday_village;
    case 3: return Icons.share;
    default: return Icons.more_horiz;
  }
}

class _DestinosScreenState extends State<DestinosScreen> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            Image.asset(
              'assets/paisaje2.jpg',
              height: screenSize.height * .5,
              fit: BoxFit.fitHeight,
            ),
            ClipRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white10,
                  ),
                ),
              ),
            ),
            ListView(children: [
              Padding(
                padding: EdgeInsets.only(
                    left: screenSize.width * .1,
                    right: screenSize.width * .1,
                    top: screenSize.height * .1),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Bienvenido Usuario',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                          color: Colors.white),
                    ),
                    ClipRect(
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Colors.white54,
                          borderRadius: BorderRadius.all(
                            Radius.circular(7),
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: screenSize.width * .03),
                          child: const TextField(
                            decoration: InputDecoration(
                              suffixIcon: Icon(Icons.send),
                              suffixIconColor: Colors.black45,
                              border: InputBorder.none,
                              hintText: '¿A dónde quieres ir?',
                              hintStyle: TextStyle(color: Colors.black45),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ]),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(40),
                      topLeft: Radius.circular(40),
                    ),
                  ),
                  height: screenSize.height * .65,
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  height: screenSize.height*.08,
                  child: ScrollablePositionedList.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 7,
                    itemBuilder: (BuildContext context, int index) { return Padding(
                      padding: EdgeInsets.only(left: screenSize.width*.035,bottom: screenSize.height*.025),
                      child: Container(
                        width: screenSize.width * .22,
                        decoration: const BoxDecoration(
                          color: Colors.black12,
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        child: Padding(
                          padding:const EdgeInsets.all(8.0),
                          child: Icon(
                            getIconData(index),
                            color: Colors.black45,
                          ),
                        ),
                      ),
                    ); },
                  ),
                ),
              ],
            )
          ],
        ));
  }
}
