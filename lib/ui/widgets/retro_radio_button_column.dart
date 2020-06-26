import 'package:flutter/material.dart';

class RetroRadioButtons extends StatefulWidget {

  final List<RadioModel> buttonData;

  RetroRadioButtons(this.buttonData);


  @override
  _RetroRadioButtonsState createState() => _RetroRadioButtonsState();
}

class _RetroRadioButtonsState extends State<RetroRadioButtons> {

  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
//    return GestureDetector(
//      child: Container(
//        margin: EdgeInsets.symmetric(horizontal: 3.0, vertical: 2.0),
//        width: 350,
//        height: 70,
//        decoration: new BoxDecoration(
//            color: Color(0xffffffff),
//            border: Border.all(color: Color(0xff707070), width: 2)),
//        child: Align(
//          //alignment: Alignment.centerLeft,
//          child: Row(
//            children: <Widget>[
//              Container(
//                width: 70,
//                height: 70,
//                decoration: new BoxDecoration(
//                  color: Color(0xffffffff),
//                  border: Border(
//                    right: BorderSide(color: Color(0xff707070), width: 2),
//                  ),
//                ),
//                child: Column(
//                  children: <Widget>[
//                    Container(
//                      height: 33,
//                      width: 70,
//                      child: FlatButton(
//                        child: Text("ON"),
//                        color: state ? Colors.green : Colors.white,
//                        shape: RoundedRectangleBorder(
//                            borderRadius: BorderRadius.circular(0.0)
//                        ),
//                        onPressed: () {
//                          print("ON");
//                        },
//                      ),
//                    ),
//                    Container(
//                      height: 33,
//                      width: 70,
//                      child: FlatButton(
//                        child: Text("OFF"),
//                        color: state ? Colors.white : Colors.red,
//                        shape: RoundedRectangleBorder(
//                            borderRadius: BorderRadius.circular(0.0)
//                        ),
//                        onPressed: () {
//                          sampleData.forEach((element) => element.isSelected = false);
//                          sampleData[index].isSelected = true;
//                        },
//                      ),
//                    ),
//
//                  ],
//                ),
//              ),
//              Flexible(
//                child: Padding(
//                  padding: EdgeInsets.only(left: 10.0),
//                  child: Text(
//                    text,
//                    style: TextStyle(
//                      fontFamily: 'Montserrat',
//                      color: Color(0xff292525),
//                      fontSize: 25,
//                      fontWeight: FontWeight.w900,
//                      fontStyle: FontStyle.normal,
//                    ),
//                    overflow: TextOverflow.clip,
//                    softWrap: true,
//                  ),
//                ),
//              )
//            ],
//          ),),
//      ),
//      onTap: () {
//        //_returnScreen(DesignScreen.this_era, text);
//        print("TAP");
//      },
//    );

    return Container(
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: widget.buttonData.length,
        itemBuilder: (BuildContext context, int index) {
          return new InkWell(
            //highlightColor: Colors.red,
            splashColor: Colors.blueAccent,
            onTap: () {
              setState(() {
                widget.buttonData.forEach((element) => element.isSelected = false);
                widget.buttonData[index].isSelected = true;
              });
              print("BLA");
            },
            child: new RadioItem(widget.buttonData[index]),
          );
        },
      ),
    );
  }
}

class RadioItem extends StatelessWidget {
  final RadioModel _item;

  RadioItem(this._item);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 3.0, vertical: 2.0),
      width: 350,
      height: 70,
      decoration: new BoxDecoration(
          color: Color(0xffffffff),
          border: Border.all(color: Color(0xff707070), width: 2)),
      child: Align(
        //alignment: Alignment.centerLeft,
        child: Row(
          children: <Widget>[
            Container(
              width: 70,
              height: 70,
              decoration: new BoxDecoration(
                color: Color(0xffffffff),
                border: Border(
                  right: BorderSide(color: Color(0xff707070), width: 2),
                ),
              ),
              child: Column(
                children: <Widget>[
                  Container(
                    height: 33,
                    width: 70,
                    color: _item.isSelected ? Colors.green : Colors.white,
                    child: Center(
                      child: Text(
                        "ON",
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          color: Color(0xff292525),
                          fontSize: 14,
                          fontWeight: _item.isSelected ? FontWeight.w700 : FontWeight.w500,
                          fontStyle: FontStyle.normal,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 33,
                    width: 70,
                    color: _item.isSelected ? Colors.white : Colors.red,
                    child: Center(child: Text("OFF", style: TextStyle(
                      fontFamily: 'Montserrat',
                      color: Color(0xff292525),
                      fontSize: 14,
                      fontWeight: _item.isSelected ? FontWeight.w500 : FontWeight.w700,
                      fontStyle: FontStyle.normal,
                    ),),),
                  ),
                ],
              ),
            ),
            Flexible(
              child: Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: Text(
                  _item.text,
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    color: Color(0xff292525),
                    fontSize: 25,
                    fontWeight: FontWeight.w900,
                    fontStyle: FontStyle.normal,
                  ),
                  overflow: TextOverflow.clip,
                  softWrap: true,
                ),
              ),
            )
          ],
        ),
      ),
    );

//    return new Container(
//      margin: new EdgeInsets.all(15.0),
//      child: new Row(
//        mainAxisSize: MainAxisSize.max,
//        children: <Widget>[
//          new Container(
//            height: 50.0,
//            width: 50.0,
//            child: new Center(
//              child: Padding(
//                  padding: EdgeInsets.only(left: 10.0),
//                  child: Text(
//                    _item.text,
//                    style: TextStyle(
//                      fontFamily: 'Montserrat',
//                      color: Color(0xff292525),
//                      fontSize: 25,
//                      fontWeight: FontWeight.w900,
//                      fontStyle: FontStyle.normal,
//                    ),
//                    overflow: TextOverflow.clip,
//                    softWrap: true,
//                  ),
//                ),
//            ),
//            decoration: new BoxDecoration(
//              color: _item.isSelected
//                  ? Colors.blueAccent
//                  : Colors.transparent,
//              border: new Border.all(
//                  width: 1.0,
//                  color: _item.isSelected
//                      ? Colors.blueAccent
//                      : Colors.grey),
//              borderRadius: const BorderRadius.all(const Radius.circular(2.0)),
//            ),
//          ),
//          new Container(
//            margin: new EdgeInsets.only(left: 10.0),
//            child: new Text(_item.text),
//          )
//        ],
//      ),
//    );
  }
}

class RadioModel {
  bool isSelected;
  final String text;

  RadioModel(this.isSelected, this.text);
}
