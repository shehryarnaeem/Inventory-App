import 'package:flutter/material.dart';
class inventory_data{
  String _brand;
  String _qty;

  String get brand => _brand;

  set brand(String value) {
    _brand = value;
  }

  String get qty => _qty;

  set qty(String value) {
    _qty = value;
  }


}
inventory_data i_data=new inventory_data();
List<inventory_data> data;
class brand extends StatefulWidget {
  int index;

  brand(this.index);

  @override
  _brandState createState() => _brandState(index);
}

class _brandState extends State<brand> {
  int index;

  _brandState(this.index);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Flexible(
        child: new TextFormField(
          decoration: new InputDecoration(
            labelText: "Brand Name",
            icon: Icon(Icons.storage),
          ),
          onSaved: (String value){
            data[index]._brand=value;
          },
        ),
      ),
    );
  }
}

class qty extends StatefulWidget {
  int _index;

  qty(this._index);

  @override
  _qtyState createState() => _qtyState(_index);
}

class _qtyState extends State<qty> {
  int index;

  _qtyState(this.index);

  String _count="0";
  void _add(){
    int temp=int.parse(_count);
    ++temp;

    setState(() {
      _count=temp.toString();
    });
  }

  void _subtract(){
    int temp=int.parse(_count);
    --temp;
    setState(() {
      _count=temp.toString();
    });
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: new Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(child: new Text("Quantity",style: new TextStyle(fontWeight: FontWeight.bold,color:Colors.black),)),
          ),
          new Row(
           mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: new Card(
                  shape: CircleBorder(),
                  child: new RaisedButton(
                   // shape: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
                    child:new Icon(Icons.add,color: Colors.white),
                    color: Colors.green,
                  onPressed: _add,

                  ),
                ),
              ),
              new Flexible(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: new SizedBox(
                      width: 40.0,
                      child: new TextFormField(
                keyboardType: TextInputType.number,
                        controller: TextEditingController(text: _count),
                        decoration: new InputDecoration(border: OutlineInputBorder(borderSide: BorderSide(style: BorderStyle.solid,color: Colors.black))),
                        onSaved: (String value){
                    data[index].qty=value;
                        },
              ),
                    ),
                  )
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),

                child: new Card(
                  shape: CircleBorder(),
                  child: new RaisedButton(
                    child:new Icon(Icons.remove,color: Colors.white),
                    color: Colors.red,
                  onPressed: _subtract,

                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

class inventory_card extends StatefulWidget {
  int index;

  inventory_card(this.index);

  @override
  _inventory_cardState createState() => _inventory_cardState(index);
}

class _inventory_cardState extends State<inventory_card> {
  int index;
  //final GlobalKey<FormState> _key=new GlobalKey<FormState>();



  _inventory_cardState(this.index);

  @override
  Widget build(BuildContext context) {
    brand br=new brand(index);
    qty quan=new qty(index);
    return new Form(
      child: new Card(
        elevation: 5.0,
        shape: BeveledRectangleBorder(),
        child: new Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            br,
            new SizedBox(height: 3.0,),
            quan,
          ],
        ),
      ),
    );
  }
}

class inventory extends StatefulWidget {
  @override
  _inventoryState createState() => _inventoryState();
}

class _inventoryState extends State<inventory> {
  final GlobalKey<FormState> _keys=new GlobalKey<FormState>();
  List<inventory_card> cards=new List<inventory_card>(4);
   int _count=2;


  _inventoryState(){
    data=new List<inventory_data>(_count);
  }

  @override
  void dispose() {
    if(_keys.currentState.validate())
      {
        _keys.currentState.save();
      }
  }

  void add_new(){
    setState(() {
      data.add(new inventory_data());
      _count++;
    });
  }
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      floatingActionButton: new FloatingActionButton(onPressed: add_new,child: new Icon(Icons.add),heroTag: "addCard",),
      appBar: new AppBar(
        title: new Text("Profile",style: new TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
      ),
      body: new ListView.builder(
       itemCount: _count,
        itemBuilder: (context,index){
         final item=new inventory_card(index);
         print(index);
         return item;
        },
      ),
         );
  }
}
