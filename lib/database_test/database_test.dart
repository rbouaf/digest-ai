import 'package:camera/camera.dart';

class summaryData{
  int id=0;
  String title="";
  DateTime date=DateTime.now();
  String content="";
  XFile image;
  //array of tblModel
  static List<summaryData> list = [
    summaryData(1, "Toaster", DateTime.now(), "dsadsadsa",new XFile(''),addToList: false),
    summaryData(2, "Video game", DateTime.now(), "dasss",new XFile(''), addToList: false),
    summaryData(3, "Groceries", DateTime.now(), "1",new XFile(''), addToList: false),
    summaryData(4, "Sandwich", DateTime.now(), "dasdsda",new XFile(''), addToList: false),

  ];
  // Constructor
  summaryData(this.id, this.title, this.date, this.content,this.image,{bool addToList=true}){
    if(addToList){
      list.add(this);
    }
  }
// get name
}