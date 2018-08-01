import 'package:flutter/material.dart';
import 'package:validate/validate.dart';
class test_data{
  String _field1;
  String _field2;
  String _field3;
  String _field4;

  String get field3 => _field3;

  set field3(String value) {
    _field3 = value;
  }

  String get field4 => _field4;

  set field4(String value) {
    _field4 = value;
  }

  String get field1 => _field1;

  set field1(String value) {
    _field1 = value;
  }

  String get field2 => _field2;

  set field2(String value) {
    _field2 = value;
  }


}
class test extends StatefulWidget {
  @override
  _testState createState() => _testState();
}

class _testState extends State<test> {
  GlobalKey <FormState> _key=new GlobalKey<FormState>();
  test_data data=new test_data();
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(title: new Text("Test"),),
      body: new Container(
        child: new Form(
          key: this._key,
          child: new ListView(
            children: <Widget>[
              new Column(
                crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
              new SizedBox(height: 5.0,),
              new TextFormField(decoration: new InputDecoration(labelText: "Test1"),
              onSaved: (String value){
                data._field1=value;
              },
                validator:(String value){
                  try{
                    Validate.notEmpty(value);

                  }catch(e){
                    return "Enter a value";
                  }
                  return null;
                },
              ),
              new SizedBox(height: 5.0,),
              new TextFormField(decoration: new InputDecoration(labelText: "Test2"),
                onSaved: (String value){
                  data._field2=value;
                },
                validator:(String value){
                    try{
                      Validate.notEmpty(value);

                    }catch(e){
                      return "Enter a value";
                    }
                    return null;
                },
              ),
              new SizedBox(height: 5.0,),
              new TextFormField(decoration: new InputDecoration(labelText: "Test3"),
                onSaved: (String value){
                  data._field3=value;
                },
                validator:(String value){
                  try{
                    Validate.notEmpty(value);

                  }catch(e){
                    return "Enter a value";
                  }
                  return null;
                },
              ),
              new SizedBox(height: 5.0,),
              new TextFormField(decoration: new InputDecoration(labelText: "Test4"),
                onSaved: (String value){
                  data._field4=value;
                },
                validator:(String value){
                  try{
                    Validate.notEmpty(value);

                  }catch(e){
                    return "Enter a value";
                  }
                  return null;
                },
              ),
              new FloatingActionButton(child: new Text("submit"),onPressed: (){
                if(_key.currentState.validate()){
                  _key.currentState.save();
                  
                }
              },
                shape: CircleBorder(),
              )
          ]
              )
            ],
          ),
        ),
      ),
    );
  }
}
