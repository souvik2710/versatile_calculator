import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:versatile_calculator/src/common_button.dart';

import 'package:math_expressions/math_expressions.dart';


class VersatileCalculator extends HookConsumerWidget {
  // double doDouble = 0.0;
  final List<String> integersCalculatorList = ['C','CE','%','/','7','8','9','x','4','5','6','-','1','2','3','+','0','.','00','='];
 final  List<Color> integersCalculatorColorList = [Colors.blue[800]!,Colors.blue[800]!,Colors.orange[800]!,Colors.orange[800]!
    ,Color(0xff302f36),Color(0xff302f36),Color(0xff302f36),Colors.orange[800]!,Color(0xff302f36),Color(0xff302f36),Color(0xff302f36),Colors.orange[800]!,Color(0xff302f36),Color(0xff302f36),Color(0xff302f36),
    Colors.orange[800]!,Color(0xff302f36),Color(0xff302f36),Color(0xff302f36),Colors.orange[800]!];
  // List<Function()> calculatorFunctions =[];

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final ValueNotifier<List<String>> calculateHistoryList = useState(['']);
    final ValueNotifier<String> displayString = useState('');
    // final ValueNotifier<String> tempValueString = useState('');
    final forCheck = useState(false);
    // final ValueNotifier<List<CalculatorObject>> listCalculatorObject = useState([]);
    // final  totalDue = useState(15.97);
    final valueController = useTextEditingController();
    // ValueNotifier<double> doubleValue = useState(0.0);

    useEffect(() {
      // doubleValue = useState(0.0);
      return;
    }, []);
    // String checkString(index){
    //   switch (index) {
    //     case 0:
    //     // return StorePropertiesView();
    //       return 'a';
    //     case 1:
    //       return 'b';
    //     default:
    //       return 'c';
    //   }
    // }
    bool checkLastBadValue(String valString){
      var lastStringItem = valString.substring(valString.length-1,valString.length);
      if(lastStringItem == '+'||lastStringItem == '-'||lastStringItem == '/'||lastStringItem == 'x'||lastStringItem == '.'){
        return true;
      }else{
        return false;
      }
    }
    String calculateInstant(String valString,String otherStringIncludingSign){
      final String tempString = valString;
      if(valString.contains('+')||valString.contains('-')||valString.contains('/')||valString.contains('x')||valString.contains('.')||otherStringIncludingSign=='='){
        Parser p = Parser();
        Expression exp = p.parse('${valString.replaceAll('x', '*')}');
        ContextModel cm = ContextModel();
        double eval = exp.evaluate(EvaluationType.REAL, cm);
        // double gValue = 9.42;
        // if(eval.toStringAsFixed(2).split('.')[1]=='00'){
        //   debugPrint('${gValue.toStringAsFixed(0)}');
        // }else{
        //   debugPrint('${gValue.toStringAsFixed(2)}');
        // }
        // if(eval.toString() == "Infinity"){
        //   eval =0;
        // }
        // String lastChar = valString.substring(valString.length-1,valString.length);
        // debugPrint('$lastChar');
        if(otherStringIncludingSign=='+'||otherStringIncludingSign=='-'||otherStringIncludingSign=='/'||otherStringIncludingSign=='x'||otherStringIncludingSign=='=') {
          calculateHistoryList.value.add('$tempString = ${eval.toStringAsFixed(2)}');
          forCheck.value = !forCheck.value;
        }
        if(eval.toString() == "Infinity"){
          eval =0;
        }

        return eval.toStringAsFixed(2);
      }else{
        return tempString;
      }

    }
    // void createHistory(String valString){
    //   if(valString.contains('+')||valString.contains('-')||valString.contains('/')||valString.contains('x')||valString.contains('.')){
    //
    //   }
    //
    // }
    // function to calculate the input operation


    // void equalPressed() {
      // String finaluserinput = userInput;
      // finaluserinput = userInput.replaceAll('x', '*');

      // Parser p = Parser();
      // Expression exp = p.parse(finaluserinput);
      // ContextModel cm = ContextModel();
      // double eval = exp.evaluate(EvaluationType.REAL, cm);
      // answer = eval.toString();
      // }
    // }

    Function() getCalculatorFunctionFromIndex(index){
      switch (index) {
        case 0:
          return (){
            // doubleValue.value = 0.0;
            valueController.text = '';
            displayString.value = valueController.text;
            // valueController.text = doubleValue.value.toStringAsFixed(2);
          };
        case 1:
          return (){
            valueController.text = valueController.text.substring(0,valueController.text.length-1);
            displayString.value = valueController.text;
          };
        case 2:
          return (){
            //for %
            if(checkLastBadValue(valueController.text) ==false){
              Parser p = Parser();
              Expression exp = p.parse('${valueController.text.replaceAll('x', '*')}');
              ContextModel cm = ContextModel();
              double eval = exp.evaluate(EvaluationType.REAL, cm);
              String evalPerCent = (eval/100).toStringAsFixed(2);
              calculateHistoryList.value.add('${valueController.text}/100 = $eval ');
              valueController.text =   evalPerCent;
              displayString.value = valueController.text;
              // valueController.text = valueController.text + '%';

            }
            // valueController.text = doubleValue.value.toStringAsFixed(2);
          };
        case 3:
          return (){
            if(checkLastBadValue(valueController.text) ==false){
              // valueController.text = valueController.text + '/';
              valueController.text = calculateInstant(valueController.text,'/') + '/';
              // displayString.value = valueController.text;
            }
          };
        case 4:
          return (){
            //for seven
            valueController.text = valueController.text + '7';
            displayString.value = valueController.text;
            displayString.value = calculateInstant(valueController.text,'7');


            // doubleValue.value = doubleValue.value + 7;
            // debugPrint('${doubleValue.value}*******');
            // valueController.text = doubleValue.value.toStringAsFixed(2);

          };
        case 5:
          return (){
            valueController.text = valueController.text + '8';
            displayString.value = valueController.text;
            displayString.value = calculateInstant(valueController.text,'8');
            // doubleValue.value = doubleValue.value + 8;
            // valueController.text = doubleValue.value.toStringAsFixed(2);

          };
        case 6:
          return (){
            valueController.text = valueController.text + '9';
            displayString.value = valueController.text;
            displayString.value = calculateInstant(valueController.text,'9');
            // doubleValue.value = doubleValue.value + 9;
            // valueController.text = doubleValue.value.toStringAsFixed(2);

          };
        case 7:
          return (){
            if(checkLastBadValue(valueController.text) ==false){
              valueController.text = calculateInstant(valueController.text,'x') + 'x';
              // valueController.text = valueController.text + 'x';
              // displayString.value = valueController.text;
            }

          };
        case 8:
          return (){
            valueController.text = valueController.text + '4';
            displayString.value = valueController.text;
            displayString.value = calculateInstant(valueController.text,'4');
            // doubleValue.value = doubleValue.value + 4;
            // valueController.text = doubleValue.value.toStringAsFixed(2);

          };
        case 9:
          return (){
            valueController.text = valueController.text + '5';
            displayString.value = valueController.text;
            displayString.value = calculateInstant(valueController.text,'5');
            // doubleValue.value = doubleValue.value + 5;
            // valueController.text = doubleValue.value.toStringAsFixed(2);

          };
        case 10:
          return (){
            valueController.text = valueController.text + '6';
            displayString.value = valueController.text;
            displayString.value = calculateInstant(valueController.text,'6');
            // doubleValue.value = doubleValue.value + 6;
            // valueController.text = doubleValue.value.toStringAsFixed(2);

          };
        case 11:
          return (){
            if(checkLastBadValue(valueController.text) ==false){
              valueController.text = calculateInstant(valueController.text,'-') + '-';
              // valueController.text = valueController.text + '-';
              // displayString.value = valueController.text;
            }

          };
        case 12:
          return (){
            valueController.text = valueController.text + '1';
            displayString.value = valueController.text;
            displayString.value = calculateInstant(valueController.text,'1');
            // doubleValue.value = doubleValue.value + 1;
            // valueController.text = doubleValue.value.toStringAsFixed(2);

          };
        case 13:
          return (){
            valueController.text = valueController.text + '2';
            displayString.value = valueController.text;
            displayString.value = calculateInstant(valueController.text,'2');
            // doubleValue.value = doubleValue.value + 2;
            // valueController.text = doubleValue.value.toStringAsFixed(2);

          };
        case 14:
          return (){
            valueController.text = valueController.text + '3';
            displayString.value = valueController.text;
            displayString.value = calculateInstant(valueController.text,'3');
            // doubleValue.value = doubleValue.value + 3;
            // valueController.text = doubleValue.value.toStringAsFixed(2);

          };
        case 15:
          return (){

            if(checkLastBadValue(valueController.text) ==false){
              valueController.text = calculateInstant(valueController.text,'+') + '+';
              // valueController.text = valueController.text + '+';
              // displayString.value = calculateInstant(valueController.text);
              // displayString.value = valueController.text;
            }


          };
        case 16:
          return (){
            valueController.text = valueController.text + '0';
            displayString.value = valueController.text;
            displayString.value = calculateInstant(valueController.text,'0');

          };
        case 17:
          return (){
            if(checkLastBadValue(valueController.text) ==false){
              valueController.text = valueController.text + '.';
              displayString.value = valueController.text;
            }
          };
        case 18:
          return (){
            // if(valueController.text.length>)
            valueController.text = valueController.text + '00';
            displayString.value = valueController.text;
            displayString.value = calculateInstant(valueController.text,'00');

          };
        case 19:
          return (){
            valueController.text = calculateInstant(valueController.text,'=') ;
            valueController.text = '';
            displayString.value = valueController.text;
            // Parser p = Parser();
            // Expression exp = p.parse('${valueController.text.replaceAll('x', '*')}');
            // ContextModel cm = ContextModel();
            // double eval = exp.evaluate(EvaluationType.REAL, cm);
            // valueController.text =   eval.toStringAsFixed(2);

          };
        default:
          return (){};
      }
    }
    return AlertDialog(
      backgroundColor: Colors.transparent,
      contentPadding: EdgeInsets.all(0),
      alignment: Alignment.center,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(0))),
      content: StatefulBuilder(
          builder: (BuildContext context, StateSetter setState){
            // setStatePass = setState;
            return Container(
              color: Colors.black,
              height: 500,
              width: 640,
              child: Row(
                children: [
                  Expanded(flex:1,child: Container(
                    color:Colors.grey[300],
                    child: Column(
                      children: [
                        Expanded(
                          flex: 16,
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(0.0)),
                                border: Border.all(color: Colors.grey[300]!,width: 1)
                            ),
                            padding: EdgeInsets.only(left:10,right: 10,top:10),
                            margin:  EdgeInsets.only(left:10,right: 10,top:10),
                            child: ListView.separated(
                                itemCount: calculateHistoryList.value.length,
                                itemBuilder: (context,index){
                                  return Text('${calculateHistoryList.value[index]}');
                                },
                                separatorBuilder: (context, index) {
                                  return SizedBox(height: 4,);
                                }),
                          ),
                        ),
                        Expanded(flex:2,child: SizedBox(
                          height: MediaQuery.of(context).size.height,
                          // color: Colors.red[100],
                          width: MediaQuery.of(context).size.width,
                          child:CommonElevatedButton(buttonText: 'Clear All',
                            outSidePadding: 0.0,
                            width: MediaQuery.of(context).size.width,
                            // height: MediaQuery.of(context).size.height,
                            onbuttonPressed: (){
                              calculateHistoryList.value = [];
                            },
                            sizeType: ButtonSizeType.medium,
                            colorType: ButtonColorType.dark,),
                          // padding:EdgeInsets.symmetric(horizontal: 10),

                        )),
                      ],
                    ),
                  ),


                  ),
                  Expanded(
                    flex:1,
                    child: Column(
                      children: [
                        // Expanded(flex:3,child: Container(
                        //   color: Colors.white,
                        //   padding: const EdgeInsets.all(8.0),
                        //   child: Container(
                        //     decoration: BoxDecoration(
                        //         color: Colors.white,
                        //       borderRadius: BorderRadius.all(Radius.circular(0.0)),
                        //       border: Border.all(color: Colors.grey,width: 1)
                        //
                        //     ),
                        //     child: Center(child: Text('${displayString.value}')),
                        //     padding:EdgeInsets.symmetric(horizontal: 10),
                        //
                        //   ),
                        // )),
                        Expanded(flex:6,child: Center(
                          child: Container(
                            color: Colors.white,
                            padding:EdgeInsets.symmetric(horizontal: 10),
                            child:  Column(
                              children: [
                                Align(
                                  alignment : Alignment.centerRight,
                                  child: Container(
                                      padding: EdgeInsets.all(10),
                                      child: Text('${displayString.value}',style: TextStyle(fontSize: 28),)),
                                ),
                                Container(
                                    alignment: Alignment.centerRight,
                                    padding: const EdgeInsets.all(10),
                                    child: Text('${valueController.text}',style: TextStyle(fontSize: 12,color: Colors.grey),)),
                                // CommonTextField(
                                //   style:TextStyle(fontSize: 12,color: Colors.grey),
                                //   textEditingController: valueController,
                                //   hintText: 'Net Value',
                                //   hintStyle: TextStyle(fontSize: 12,color: Colors.grey),
                                // ),
                              ],
                            ),),
                        )),

                        Expanded(
                          flex: 16,
                          child: Container(
                            child: GridView.count(

                                childAspectRatio:1.10,
                                padding: EdgeInsets.zero,
                                // semanticChildCount: 2,
                                crossAxisCount: 4,
                                crossAxisSpacing: 0.0,
                                mainAxisSpacing: 0.0,
                                children: List.generate(integersCalculatorList.length, (index) {
                                  return InkWell(
                                    onTap: (){
                                      getCalculatorFunctionFromIndex(index)(); //invoke function

                                      // doubleValue.value = doubleValue.value + 7;
                                      // debugPrint('${doubleValue.value}iiiiiii');
                                      // String h =checkString(index);
                                      // debugPrint('${checkString(index)} .....');
                                      // valueController.text = doubleValue.value.toStringAsFixed(2);
                                      // debugPrint('${doubleValue.value}');

                                      // String checkString = valueController.text.toString();
                                      // if(integersCalculatorList[index]=='.'){
                                      //   if(checkString.contains('.')) {
                                      //     debugPrint('yes');
                                      //
                                      //   }else{
                                      //     debugPrint('no');
                                      //     if(valueController.text.length>0) {
                                      //       valueController.text = valueController.text + '.';
                                      //       doUseDouble = double.parse('${valueController.text} ');
                                      //       debugPrint('$doUseDouble ooooo');
                                      //     }
                                      //   }
                                      // }else if(integersCalculatorList[index]=='00'){
                                      //   if(checkString.contains('.')) {
                                      //     int indexFind = checkString.indexOf('.');
                                      //     String indexSubString = checkString.substring(indexFind+1,checkString.length);
                                      //     debugPrint('subString -> $indexSubString');
                                      //     if(indexSubString.length>=1){
                                      //
                                      //     }else{
                                      //       valueController.text = valueController.text + '${integersCalculatorList[index]}'; /*00*/
                                      //       doUseDouble = double.parse('${valueController.text} ');
                                      //       debugPrint('$doUseDouble mmmm');
                                      //     }
                                      //     debugPrint('${valueController.text}jjjjj');
                                      //
                                      //
                                      //   }else{
                                      //     valueController.text = valueController.text + '${integersCalculatorList[index]}'; /*00*/
                                      //     doUseDouble = double.parse('${valueController.text} ');
                                      //     debugPrint('$doUseDouble tttt');
                                      //
                                      //   }
                                      //
                                      // }else{
                                      //   // debugPr
                                      //   if(checkString.contains('.')) {
                                      //     int indexFind = checkString.indexOf('.');
                                      //     String indexSubString = checkString.substring(indexFind+1,checkString.length);
                                      //     debugPrint('subString -> $indexSubString');
                                      //     if(indexSubString.length==2){
                                      //
                                      //     }else{
                                      //       valueController.text = valueController.text + '${integersCalculatorList[index]}';
                                      //       doUseDouble = double.parse('${valueController.text} ');
                                      //       debugPrint('$doUseDouble mmmm');
                                      //     }
                                      //     debugPrint('${valueController.text}jjjjj');
                                      //
                                      //
                                      //   }else{
                                      //     valueController.text = valueController.text + '${integersCalculatorList[index]}';
                                      //     doUseDouble = double.parse('${valueController.text} ');
                                      //     debugPrint('$doUseDouble tttt');
                                      //   }
                                      //
                                      // }
                                    },
                                    child: Container(
                                      // height: 30,
                                      // width: 30,

                                      decoration: BoxDecoration(
                                          border: Border.all(color: Colors.black),
                                          borderRadius: const BorderRadius.all(
                                            Radius.circular(0),),
                                          color: integersCalculatorColorList[index]

                                      ),
                                      child: Center(child: Text('${integersCalculatorList[index]}',style: TextStyle(color: Colors.white,fontWeight: FontWeight.w700),)),

                                    ),
                                  );
                                }
                                ) ),

                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }

      ),
    );
  }
}

class ExpandedContainerFunction extends HookConsumerWidget {
  final String passContainerString;
  ExpandedContainerFunction({ required this.passContainerString});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return Expanded(
      child: Container(
        // width: 30,
        // height: 30,
        decoration: BoxDecoration(
            color: Color(0xFF005FB8),
            borderRadius: BorderRadius.all(Radius.circular(0)),
            border: Border.all(color: Colors.grey[100]!,)
        ),
        child: Center(child: Text('$passContainerString',style: TextStyle(color: Colors.white),)),
      ),
    );
  }
}



// var lastStringItem = valueController.text.substring(valueController.text.length-1,valueController.text.length);
// debugPrint('$lastStringItem iii');
// if(lastStringItem != '+'||lastStringItem != '-'||lastStringItem != '/'||lastStringItem != 'x'||lastStringItem != '.'){
// valueController.text = valueController.text + '/';
// }