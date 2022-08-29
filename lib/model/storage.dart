//
// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:path_provider/path_provider.dart';
//
// class Home2 extends StatefulWidget {
//   final Storage1 storage;
//   const Home2({Key? key, required this.storage}) : super(key: key);
//
//   @override
//   State<Home2> createState() => _Home2State();
// }
//
// class Storage1 {
//   Future<String> get localpath async{
//     final dir = await getApplicationDocumentsDirectory();
//     return dir.path;
//   }
//   Future<File> get localFile async{
//     final path = await localpath;
//     return File('$path/db.text');
//   }
//
//   Future<String> readData() async{
//     try{
//       final file = await localFile;
//       String body = await file.readAsString();
//       return body;
//     }
//     catch(e){
//       return e.toString();
//     }
//   }
//
//   Future<File> writeData(String data) async{
//     final file = await localFile;
//     return file.writeAsString("$data");
//   }
// }
//
// class _Home2State extends State<Home2> {
//   TextEditingController controller = TextEditingController();
//   late String state;
//   late Future<Directory> _appDocDir;
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     widget.storage.readData().then((value) {
// setState(() {
//   state = value;
// });
//     });
//
//
//   }
//   Future<File> writeData() async{
//     setState(() {
//       state= controller.text;
//       controller.text;
//     });
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Heyy'),
//       ),
//       body: Center(
//         child: Column(
//           children: [
//             Text('${state ?? "File is Empty"}'),
//             TextField(
//               controller:  controller,
//             ),
//             GestureDetector(
//               onTap: (){},
//               child: Text('Write to file'),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
