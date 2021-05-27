import 'dart:ui';
import 'package:flutter/material.dart';

class  bill extends StatefulWidget {


  @override
  _billState createState() => _billState();
}

class _billState extends State<bill> {

  double _billAmount_ = 0.0;
  int _tipPercentage = 0;
  int _personCounter = 1;
  double totalTip = 0.0;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body : Container(
        margin: EdgeInsets.only(top : MediaQuery.of(context).size.height * 0.1),
        alignment: Alignment.center,
        color: Colors.white,
        child : ListView(
          scrollDirection : Axis.vertical,
          padding : EdgeInsets.all(20.4),
          children : <Widget>[
            Container(
            width : 150,
            height : 150,
           decoration: BoxDecoration
             (
             color: Colors.purple[100],
             borderRadius: BorderRadius.circular(12.0),
             ),
           child: Center(
             child: Column(
               mainAxisAlignment: MainAxisAlignment.center,
               children: <Widget>[
                      Text('Total Per Person',
                      style : TextStyle(
                        fontSize: 17.0,
                         color : Colors.purple[600],
                        ),
                      ),
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Text("\u20B9 ${calculateTotalPerPerson( _billAmount_, _personCounter, totalTip)}",
                            style : TextStyle(
                             fontSize: 35.0,
                              color : Colors.purple[600],
                               ),
                          ),
                        ),
                       ],
             ),
           ),
          ),

           Container(
                 margin : EdgeInsets.only(top : 20.0),
                 padding: EdgeInsets.all(12.0),
                    height :270,
                    width : 150,

                 decoration: BoxDecoration(
                 color: Colors.transparent,
                 borderRadius : BorderRadius.circular(12.0),
                 border: Border.all(
                   color: Colors.grey[300],
                   style : BorderStyle.solid,
                 ),
             ),
                    child : Column(
                       children : <Widget>[
                         TextField(
                        keyboardType : TextInputType.numberWithOptions(decimal : true),
                        style : TextStyle(color : Colors.grey[900]),
                        decoration: InputDecoration(
                          prefixText : "Bill Amount",
                          //prefixIcon : Icon(Icons.attach_money)
                        ),
                        onChanged : (String value){
                          try{
                              _billAmount_= double.parse(value);
                             }
                         catch(exception){
                            _billAmount_ = 0.0;
                              }
                         },

                    ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                                Text('Split',
                                 style : TextStyle(
                                 fontSize : 17.0,
                                  color : Colors.grey[900],
                               ),
                         ),
                      Row(
                        children : <Widget>[
                          InkWell(
                             onTap: (){
                             setState(() {
                              if( _personCounter > 1){
                                _personCounter--;
                             }
                              else{
                                   }
                             });
                             },
                            child : Container(
                             width : 40.0,
                             height : 40.0,
                             margin: EdgeInsets.all(10.0),
                             decoration: BoxDecoration(
                            color: Colors.purple[100],
                             borderRadius : BorderRadius.circular(7.0),
                             ),
                             child : Center(
                               child: Text('-',
                               style: TextStyle(
                                color: Colors.purple[600],
                               fontWeight: FontWeight.bold,
                               fontSize: 17.0

                              ),
                             ),
                             ),
                             ),
                          ),
                          Text("$_personCounter",
                         style: TextStyle(
                         color: Colors.purple[600],
                         fontWeight: FontWeight.bold,
                           fontSize: 17.0
                          ),
                       ),
                        InkWell(
                           onTap: (){
                          setState(() {
                               _personCounter++;
                                 });
                          },
                            child : Container(
                              width : 40.0,
                              height : 40.0,
                              margin: EdgeInsets.all(10.0),
                              decoration: BoxDecoration(
                                color: Colors.purple[100],
                                borderRadius : BorderRadius.circular(7.0),
                              ),
                              child : Center(
                                child: Text('+',
                                  style: TextStyle(
                                      color: Colors.purple[600],
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17.0
                                  ),
                                ),
                              ),
                            ),
                          ),
                       ],
                      ),
                     ],
                      ),

                   Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:<Widget>[
                         Text("Tip",
                              style: TextStyle(
                                   color: Colors.grey[900],
                                   //fontWeight: FontWeight.bold,
                                   fontSize: 17.0
                                 ),
                                   ),
                                   Padding(
                                     padding: const EdgeInsets.all(18.0),
                                     child: Text('\u20B9 ${ calculateTotalTip(_billAmount_,_personCounter, _tipPercentage)}',
                                       style: TextStyle(
                                       color: Colors.purple[500],
                                       fontWeight: FontWeight.bold,
                                       fontSize: 17.0,
                            )
                           ),
                                   ),
                          ],
                      ),
                      Column(
                          children : <Widget>
                            [
                                  Text('$_tipPercentage%',
                                style: TextStyle(
                                color: Colors.purple[600],
                                fontWeight: FontWeight.bold,
                                fontSize: 17.0,
                     ),),
                     Slider(
                         min: 0,
                          max: 100,
                            activeColor: Colors.purple[600],
                            inactiveColor: Colors.grey,
                            divisions : 10,
                            value: _tipPercentage.toDouble(),
                            onChanged: (double newValue){
                             setState(() {
                               _tipPercentage = newValue.round();
                             });
                               }
                              )
                             ],
                            )
                           ],

                         ),
                ),
            ],
          ),
        ),
       );
  }
   calculateTotalPerPerson(double billAmount, int splitBy, double totalTip){

    var totalPerPerson= (totalTip+ billAmount )/splitBy;
    return totalPerPerson.toStringAsFixed(2);

    }
    calculateTotalTip(double billAmount, int splitBy, int tipPercentage)
    {
      //double totalTip =0.0;
      if(billAmount.toString().isEmpty || billAmount == null)
        {
             //no  money
        }
      else
        {
          totalTip = (billAmount * tipPercentage)/100;
        }
      return totalTip;
    }
    }
