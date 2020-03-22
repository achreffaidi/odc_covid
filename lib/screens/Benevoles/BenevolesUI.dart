import 'package:direct_select/direct_select.dart';
import 'package:flutter/material.dart';
import 'package:odc_covid/Model/Gov.dart';

class BenevolesUI extends StatefulWidget {
  @override
  _BenevolesUIState createState() => _BenevolesUIState();
}

class _BenevolesUIState extends State<BenevolesUI> {

  List<String> gouvernorats = new List();
  String _selectedGov =" | " ;


  List<DropdownMenuItem<String>> _dropdownMenuItems = new List();

  @override
  void initState() {
    loadGov() ;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.green,
    body: getBody()
    );
  }


  List<DropdownMenuItem<String>> buildDropdownMenuItems() {
    List<DropdownMenuItem<String>> items = List();
    for (String x in gouvernorats) {
      var t = x.split("|");
      items.add(
        DropdownMenuItem(

          value: x,
          child:  Container(
            color: Colors.white,
        child: Container(
          child: Row(
            children: <Widget>[
              Icon(Icons.location_on , color: Colors.deepOrange,size: 45,) ,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[

                Text(t[0].trim()  , style: TextStyle(color: Colors.deepOrange ,),),
                Text(t[1].trim(), style: TextStyle(color: Colors.black ,fontWeight: FontWeight.bold),),
              ],)
            ],
          ),
        ),
    ),
        ),
      );
    }
    return items;
  }

  onChangeDropdownItem(String selected) {
    setState(() {
      _selectedGov = selected;
    });
  }


  void loadGov(){

    DefaultAssetBundle.of(context).loadString("assets/gouvernorats.json").then((val){
      setState(() {
       List<Gouvernorat>   temp = Gov.fromJson(val).gouvernorats;
       gouvernorats = new List();
       for(var x in temp){
         for(var y in x.villes){
           gouvernorats.add(x.gouvernorat+"|"+y);
         }
       }
       _selectedGov = gouvernorats[0];
       _dropdownMenuItems = buildDropdownMenuItems();
       setState(() {

       });
      });
    }) ;

  }



  getBody() {
    print(gouvernorats);
    return Container(child: Column(
      children: <Widget>[
        Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: _dropdownMenuItems.isEmpty?Container() :DropdownButton(
      value: _selectedGov,
      items: _dropdownMenuItems,
      

      onChanged: onChangeDropdownItem,
    ),
          ),
        ),
      ],
    ) ,);
  }

}
