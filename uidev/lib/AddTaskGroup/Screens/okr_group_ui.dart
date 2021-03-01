// import 'package:flutter/material.dart';
// import 'package:uidev/AddTaskGroup/SubPages/Screens/add_okr_group.dart';
// import 'package:uidev/Theme/BackButton/back_button.dart';
// import 'package:uidev/Theme/Color/light_colors.dart';
// import '../Widgets/okr_group_listview.dart';
//
// //Homepage of the app. It allows the user to insert new tasks to his list.
// //It'll allow the user to add new lists too (later features).
//
// class OKRGroupUI extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final topPadding = MediaQuery.of(context).padding.top;
//     final bottomPadding = MediaQuery.of(context).padding.bottom;
//
//     return Scaffold(
//       backgroundColor: LightColors.kLightYellow,
//       body: NestedScrollView(
//         headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
//           return <Widget>[
//             SliverAppBar(
//               automaticallyImplyLeading: false,
//               elevation: 2,
//               backgroundColor: LightColors.kDarkYellow,
//               expandedHeight: 240.0,
//               floating: false,
//               pinned: true,
//               leading: Padding(
//                 padding: const EdgeInsets.only(left: 20.0),
//                 child: MyBackButton(),
//               ),
//               flexibleSpace: FlexibleSpaceBar(
//                 collapseMode: CollapseMode.pin,
//                 background: Container(
//                   color: LightColors.kLightYellow,
//                   child: Column(
//                     children: [
//                       SizedBox(height: topPadding + 20,),
//                       Center(
//                         child: Image(
//                           height: 200,
//                           image: AssetImage('assets/artwork/task.png'),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           ];
//         },
//         body: SingleChildScrollView(
//           child: Padding(
//             padding: const EdgeInsets.fromLTRB(
//               20,
//               0,
//               20,
//               0,
//             ),
//             child: Column(
//               children: [
//                 Row(
//                   children: [
//                     Expanded(
//                       child: OKRGroupListview(),
//                     ),
//                   ],
//                 ),
//                 SizedBox(
//                   height: 50,
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//
//       floatingActionButton: FloatingActionButton(
//         elevation: 5,
//         backgroundColor: LightColors.kDarkYellow,
//         child: Icon(Icons.add),
//         onPressed: () {
//           showModalBottomSheet(
//             context: context,
//             builder: (_) => AddOKRGroupUI(isEditMode: false),
//           );
//         },
//         tooltip: 'Add a new task!',
//       ),
//     );
//   }
// }
