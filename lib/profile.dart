import 'package:flutter/material.dart';
import 'package:validate/validate.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:async';
import 'dart:io';
import 'package:profile_app/inventory.dart';

class profileData{
  Image _image;
  String _name;
  String _number;
  String _email;
  String _shop;


  String get shop => _shop;

  set shop(String value) {
    _shop = value;
  }

  Image get image => _image;

  set image(Image value) {
    _image = value;
  }

  String get name => _name;

  set name(String value) {
    _name = value;
  }

  String get number => _number;

  set number(String value) {
    _number = value;
  }

  String get email => _email;

  set email(String value) {
    _email = value;
  }


}

profileData data=new profileData();

class profile_image extends StatefulWidget {
  Image image;

  @override
  _profile_imageState createState() {
    _profile_imageState image_state=_profile_imageState();
    this.image=image_state.im;
    return image_state;
  }

}

class _profile_imageState extends State<profile_image> {

  Image im;
  File _image;

  Image imageChild(){
    var _img=Image.asset("asset/images.png");
    Image temp= _image==null ? im=_img : im=Image.file(_image,fit: BoxFit.cover ,);
    data.image=temp;
    return temp;
  }

  Future getImageC() async{
    var image=await ImagePicker.pickImage(source:ImageSource.camera);
    setState(() {
      this._image=image  ;
    });
  }

  Future getImageG() async{
    var image=await ImagePicker.pickImage(source:ImageSource.gallery);
    setState(() {
      this._image=image  ;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        new SizedBox(
          width: 100.0,
          height: 100.0,
          child: new Card(
            shape: CircleBorder(side: BorderSide(color: Colors.blue[500],style: BorderStyle.solid,width: 4.0)),
            child: new Container(
              child: imageChild(),
            ),
          ),
        ),
        new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: new FloatingActionButton(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(Icons.image),
                  ),
                  onPressed: getImageG,
                  heroTag: "Gallery",
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: new FloatingActionButton(
                  child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(Icons.camera)
                  ),
                  onPressed: getImageC,
                  heroTag: "Camera",
                ),
              )
            ]
        )
      ],
    );
  }
}


class profile_name extends StatefulWidget {
  @override
  _profile_nameState createState() => _profile_nameState();
}

class _profile_nameState extends State<profile_name> {
  String _name='';

  String get name => _name;

  set name(String value) {
    _name = value;
  }

  String _validatename(String value){
    if(value.length<2)
    {
      return "Enter a valid name";
    }
    else if(value.length>20){
      return "Max length is 20";
    }
    else{
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0,right: 20.0),
      child: new TextFormField(
        decoration: new InputDecoration(
            labelText: "Name",
            icon: new Icon(Icons.person)
        ),
        onSaved: (String value){
          this._name=value;
          data.name=value;
          print(data.name);
        },
        validator: _validatename,
      ),
    );
  }
}


class profile_email extends StatefulWidget {
  @override
  _profile_emailState createState() => _profile_emailState();
}

class _profile_emailState extends State<profile_email> {
  String _email='';

  String get email => _email;

  set email(String value) {
    _email = value;
  }

  String _validateEmail(String value)
  {
    try{
      Validate.isEmail(value);
    }
    catch(e){
      return "The Email address must be a valid email address";
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0,right: 20.0),
      child: new TextFormField(
        decoration: new InputDecoration(
          labelText: "Email",
          icon: new Icon(Icons.email),
          hintText: "something@example.com",
        ),
        keyboardType: TextInputType.emailAddress,
        onSaved: (String value){
          this._email=value;
          data.email=value;
          print(data.email);
        },
        validator: _validateEmail,
      ),
    );
  }
}



class profile_number extends StatefulWidget {

  @override
  _profile_numberState createState() {
    _profile_numberState numbers=_profile_numberState();
    return numbers;
  }
}
class _profile_numberState extends State<profile_number> {
  String _number='';
  String get number => _number;

  set number(String value) {
    _number = value;
  }

  String _validatenumber(String value)
  {
    if(value.length!=11)
    {
      return "Enter a valid number";
    }
    else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0,right: 20.0),
      child: Container(
        child: Row(
          children: <Widget>[
            new Flexible(
              child: new TextFormField(
                decoration: new InputDecoration(
                  labelText: "Number",
                  hintText: "+92xxxxxxxxxx",
                  icon: new Icon(Icons.contacts),
                ),
                keyboardType: TextInputType.number,
                onSaved: (String value){
                  this._number=value;
                  data.number=value;
                  print(data.number);

                },
                validator: _validatenumber,
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class profile_shop extends StatefulWidget {
  @override
  _profile_shopState createState() => _profile_shopState();
}

class _profile_shopState extends State<profile_shop> {
  String _shop='';

  String get shop => _shop;

  set shop(String value) {
    _shop = value;
  }

  String _validateshop(String value){
    //Enter any mechanism
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0,right: 20.0),
      child: new TextFormField(
        decoration: new InputDecoration(
          labelText: "Shop Number",
          icon: new Icon(Icons.shop),
        ),
        keyboardType: TextInputType.number,
        onSaved: (String value){
          this._shop=value;
          data.shop=value;
          print(data.shop);
        },
      ),
    );
  }
}



class profile extends StatefulWidget {
  @override
  _profileState createState() => _profileState();
}

class _profileState extends State<profile> {
  final GlobalKey<FormState> _key=new GlobalKey<FormState>();

  profile_image img=new profile_image();
  profile_name name=new profile_name();
  profile_email email=new profile_email();
  profile_number number=new profile_number();
  profile_shop shop_num=new profile_shop();



  void submit()
  {
    if(this._key.currentState.validate()){
      this._key.currentState.save();
      Navigator.of(context).push(new MaterialPageRoute(builder: (BuildContext context){
        new inventory();
      }));

    }
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        centerTitle: true,
        title: new Text("Profile",style: new TextStyle( fontWeight: FontWeight.bold,color: Colors.white),),
      ),
      body:new Container(
        decoration: BoxDecoration(image: DecorationImage(image: new AssetImage('asset/payments-pattern_1x.png'),fit: BoxFit.fill)),
        child: new Form(
          key: this._key,
          child:
              new ListView(
                children: <Widget>[

                  new Stack(
                    children:<Widget>[

                      Padding(
                        padding: const EdgeInsets.only(top:30.0),
                        child: new SizedBox(

                          child: new Card(
                            margin: const EdgeInsets.only(top: 50.0,bottom: 50.0,right: 50.0,left: 50.0),
                            shape: RoundedRectangleBorder(),
                            child: new Column(
                              children: <Widget>[
                                new SizedBox(height: 100.0,),
                                name,
                                new SizedBox(height: 3.0,),
                                email,
                                new SizedBox(height: 3.0,),
                                number,
                                new SizedBox(height: 3.0,),
                                shop_num,
                                new SizedBox(height: 3.0,),
                                Padding(
                                  padding: const EdgeInsets.only(top: 15.0,bottom: 15.0),
                                  child: new Container(child: new Text("Submit",style:new TextStyle(color: Colors.white,
                                      fontWeight: FontWeight.w300,
                                      fontSize: 20.0,
                                      letterSpacing: 0.3
                                  ),
                                  ),
                                    alignment: FractionalOffset.center,
                                    width: 220.0,
                                    height: 60.0,
                                    decoration: new BoxDecoration(color: Colors.blue[500],
                                        borderRadius: new BorderRadius.all(const Radius.circular(30.0))),
                                  ),
                                ),
                              ],
                            ),
                            color: Colors.white,elevation: 15.0,),
                        ),
                      ),
                      
                       Padding(
                         padding: const EdgeInsets.only(top: 25.0),
                         child: img,
                       )
                    ]
                  ),


                ],
              ),
        ),
      ) ,
    );
  }
}

