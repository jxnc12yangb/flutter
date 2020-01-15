/// @author yangbang
/// @create 2019/12/18
/// @Describe
class Log{

  static bool isDebug = true;
  static const String TAG = "YBLog";

  static d([dynamic value1,dynamic value2,dynamic value3,dynamic value4,dynamic value5,dynamic value6,dynamic value7,dynamic value8,]){
    if(isDebug) {
      printWrapped("$TAG ${value1??""} ${value2??""} ${value3??""} ${value4??""} ${value5??""} ${value6??""} ${value7??""} ${value8??""}",true);
    }
  }


  static dTAG(String tag,[dynamic value1,dynamic value2,dynamic value3,dynamic value4,dynamic value5,dynamic value6,dynamic value7,dynamic value8,]){
    if(isDebug) {
      printWrapped("${tag??TAG} ${value1??""} ${value2??""} ${value3??""} ${value4??""} ${value5??""} ${value6??""} ${value7??""} ${value8??""}",true);
    }
  }

  static i2(dynamic value,dynamic value1,{tag}){
    print("${tag??TAG}  $value  $value1");
  }

  static i3(dynamic value,dynamic value2,dynamic value3,{tag}){
    print("${tag??TAG}  $value  $value2  $value3");
  }

  static i(dynamic value,{tag}){
    print("${tag??TAG}  $value");
  }

  static i1TAG(String tag,dynamic value){
    print("${tag??TAG}  $value");
  }

  static i2TAG(String tag,dynamic value,dynamic value1,){
    print("${tag??TAG}  $value  $value1");
  }

  static i3TAG(String tag,dynamic value,dynamic value2,dynamic value3){
    print("${tag??TAG}  $value  $value2  $value3");
  }

  static dMap(Map map,{tag}){
    if(isDebug){
      if (map==null) return;
      StringBuffer stringBuffer = StringBuffer();
      stringBuffer.write("{\n");
      map.forEach((key,value){
        stringBuffer.write("$key : $value");
        stringBuffer.write("\n");
      });
      stringBuffer.write("}");
      //print();
      printWrapped("${tag??""}$stringBuffer",false);
    }
  }

  static void printWrapped(String text,bool line) {

    if(line){
      CustomTrace programInfo = CustomTrace(StackTrace.current);
      text = " ${programInfo.fileName} $text";
    }

    final pattern = RegExp('.{1,800}'); // 800 is the size of each chunk
    pattern.allMatches(text).forEach((match) => print(match.group(0)));
  }

}

class CustomTrace {
  final StackTrace _trace;

  String fileName;
  int lineNumber;
  int columnNumber;

  CustomTrace(this._trace) {
    _parseTrace();
  }

  void _parseTrace() {
    /* The trace comes with multiple lines of strings, we just want the first line, which has the information we need */
    fileName = this._trace.toString().split("\n")[2];
    fileName = fileName.substring(fileName.indexOf('('));
    return;

    var traceString = this._trace.toString().split("\n")[1];

    /* Search through the string and find the index of the file name by looking for the '.dart' regex */


    var indexOfFileName = traceString.indexOf(RegExp(r'[A-Za-z]+.dart'));

    var fileInfo = traceString.substring(indexOfFileName);

    var listOfInfos = fileInfo.split(":");

    /* Splitting fileInfo by the character ":" separates the file name, the line number and the column counter nicely.
      Example: main.dart:5:12
      To get the file name, we split with ":" and get the first index
      To get the line number, we would have to get the second index
      To get the column number, we would have to get the third index
    */

    this.fileName = listOfInfos[0];
    this.lineNumber = int.parse(listOfInfos[1]);
    var columnStr = listOfInfos[2];
    columnStr = columnStr.replaceFirst(")", "");
    this.columnNumber = int.parse(columnStr);
  }
}

