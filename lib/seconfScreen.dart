import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'dart:async';
class SecondScreen extends StatefulWidget {
  const SecondScreen({ Key? key }) : super(key: key);

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  bool isLoading = false;
  double value =0;
  Image? image;
  void getImage() async {
     NetworkImage("http://ontheworldmap.com/pakistan/pakistan-location-map.html");
  }
  String loaded = "Not loaded";
  
  Widget downloadData(){
     new Timer.periodic(
         Duration(seconds: 1),
             (Timer timer){
            setState(() {
              if(value >= 1) {
                  timer.cancel();
                  loaded = "loaded";
              }
              else {
                  value = value + 0.2;
                  print(value);
                  
              }
            });
         }
     );
     if(value>=1){
       return Icon(Icons.done,size: 50,);
     }
     if(value == 0){
       return Icon(Icons.close,size: 50,);
     }
     else{
       return CircularProgressIndicator();
       
     }
     
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: Icon(Icons.keyboard_return), onPressed: (){Navigator.pop(context);},),
      ),
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            
            ElevatedButton(onPressed: (){
              value = 0;
            }, child:Text('press') ),
            SizedBox(height: 10,),
            downloadData(),
            
            
          ]),
        ),
      ),
    );
  }
}