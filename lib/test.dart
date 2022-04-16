

// import 'package:flutter/material.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home:  Home(),
//     );
//   }
// }

// List<String> buttontxt = [
//   "C",
//   "DEL",
//   "%",
//   "/",
//   "7",
//   "8",
//   "9",
//   "-",
//   "4",
//   "5",
//   "6",
//   "+",
//   "1",
//   "2",
//   "3",
//   "x",
//   "0",
//   ".",
  
//   "="
// ];

// class Home extends StatelessWidget {
//   const Home({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       body: Container(
//         width: double.infinity,
//         decoration: BoxDecoration(
//             gradient: LinearGradient(colors: [
//           Color.fromARGB(255, 192, 225, 252),
//           Colors.white,
//           Color.fromARGB(255, 192, 225, 252),
//         ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
//         child: Padding(
//           padding: const EdgeInsets.fromLTRB(12, 12, 12, 0),
//           child: Column(
//             children: [
//               Container(
//                 margin: EdgeInsets.fromLTRB(0, 90, 0, 0),
//                 width: double.infinity,
//                 height: MediaQuery.of(context).size.height * 0.25,
//                 decoration: BoxDecoration(color: Colors.transparent),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Align(
//                         alignment: Alignment.topLeft,
//                         child: Text(
//                           "1+2+3+4+5",
//                           textAlign: TextAlign.right,
//                           style:
//                               TextStyle(fontSize: 28, color: Colors.grey[800]),
//                         )),
//                     Align(
//                         alignment: Alignment.bottomRight,
//                         child: Text("123456",
//                             textAlign: TextAlign.left,
//                             style: TextStyle(
//                                 fontSize: 40, fontWeight: FontWeight.w400)))
//                   ],
//                 ),
//               ),
//               Expanded(
//                 flex: 2,
//                 child: GridView.builder(
//                     itemCount: buttontxt.length,
//                     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                         crossAxisCount: 4,
//                         crossAxisSpacing: 8,
//                         mainAxisSpacing: 8),
//                     itemBuilder: (BuildContext context, int index) {
//                       if (index == 0) {
//                         return Button(Color.fromARGB(255, 93, 204, 23),
//                             buttontxt[index], Colors.white);
//                       }
//                       if (index == 1) {
//                         return Button(
//                             Colors.red, buttontxt[index], Colors.white);
//                       }
//                       if (index == 4 ||
//                           index == 5 ||
//                           index == 6 ||
//                           index == 8 ||
//                           index == 9 ||
//                           index == 10 ||
//                           index == 12 ||
//                           index == 13 ||
//                           index == 14 ||
//                           index == 16 ||
//                           index == 17) {
//                         return Button(Colors.white, buttontxt[index],
//                             Color.fromARGB(255, 3, 183, 255));
//                       }
//                       if(index==18){
//                         return Expanded(child: Button(Color.fromARGB(255, 3, 183, 255),
//                           buttontxt[index], Colors.white));
//                       }

//                       return Button(Color.fromARGB(255, 3, 183, 255),
//                           buttontxt[index], Colors.white);
//                     }),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget Button(Color btncolor, String btntxt, Color txtcolor) {
//     return ElevatedButton(
//       onPressed: () {},
//       child: Text(
//         btntxt,
//         style: TextStyle(fontSize: 18, color: txtcolor),
//       ),
//       style: TextButton.styleFrom(
//           backgroundColor: btncolor,
//           shape:
//               RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
//     );
//   }
// }
