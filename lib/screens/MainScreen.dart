import 'package:flutter/material.dart';
import 'package:morpheus/morpheus.dart';

import 'Benevoles/BenevolesUI.dart';
import 'Demandes/DemandesUI.dart';
import 'Infos/InfosUI.dart';
import 'Profile/ProfileUI.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final List<Widget> _screens = [

    BenevolesUI() ,
    DemandesUI(),
    InfosUI(),
    ProfileUI()

  ];
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {

    double headerSize = MediaQuery.of(context).size.height*(1/6) ;

    return Scaffold(

      appBar:
      PreferredSize(child: _getHeader(), preferredSize: Size.fromHeight(headerSize))

      ,
      body: MorpheusTabView(
          child: _screens[_currentIndex]
      ),
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 35,
        elevation: 8,
        selectedItemColor: Colors.deepOrange,
        unselectedItemColor: Colors.black,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            title: Text('Benevoles'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.touch_app),
            title: Text('Demandes'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            title: Text('Infos'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.contact_mail),
            title: Text('Profile'),
          ),
        ],
        onTap: (index) {
          if (index != _currentIndex) {
            setState(() => _currentIndex = index);
          }
        },
      ),
    );
  }

  _getHeader() {

    return Container(
      color: Colors.orange,
      child:Container(

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            SizedBox(height: 30,) ,
            Padding(
              padding: const EdgeInsets.only(left : 30.0),
              child: Text("35 notifications" , style: TextStyle(color : Colors.white),),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                    width: MediaQuery.of(context).size.width*0.6,
                    child: Text("fs fdsfd  fsd fs fsd sf sdfsd fdlfsdl fsdlfkj sdlfsd mjrper  elfjze lej rijrpej dfs" ,style: TextStyle(color : Colors.black , fontSize: 22),)),
                Icon(Icons.flag , color: Colors.deepOrange,size: 90,)
              ],
            ),
          ],),
      ),
    );


  }
}
