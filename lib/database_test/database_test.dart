import 'package:camera/camera.dart';

class summaryData{
  int id=0;
  String title="";
  String desc="";
  DateTime date=DateTime.now();
  List<String> content=[];
  XFile image;
  //array of tblModel
  static List<summaryData> list = [
    summaryData(1, "Toaster", "das", DateTime.now(), ["dsadsadsa"],new XFile(''),addToList: false),
    summaryData(2, "Video game", "asdsad", DateTime.now(), ["dsa","da","dasss"],new XFile(''), addToList: false),
    summaryData(3, "Groceries", "ads", DateTime.now(), ["1"],new XFile(''), addToList: false),
    summaryData(4, "Sandwich", "das", DateTime.now(), ["1","dasdsda"],new XFile(''), addToList: false),

  ];
  // Constructor
  summaryData(this.id, this.title, this.desc, this.date, this.content,this.image,{bool addToList=true}){
    if(addToList){
      list.add(this);
    }
  }
  // dummy data
  static void dummyData(){

  }
// get name
}