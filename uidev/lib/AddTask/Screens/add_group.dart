import 'package:flutter/material.dart';
import 'package:uidev/AddTask/SubPages/Screens/add_new_task_group.dart';
import 'package:uidev/Theme/BackButton/back_button.dart';
import 'package:uidev/Theme/Color/light_colors.dart';
import '../Widgets/list_task_group.dart';

//Homepage of the app. It allows the user to insert new tasks to his list.
//It'll allow the user to add new lists too (later features).

class AddGroup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final topPadding = MediaQuery.of(context).padding.top;

    return Scaffold(
      backgroundColor: LightColors.kLightYellow,
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              //forceElevated: true,
              //elevation: 8,
              backgroundColor: LightColors.kDarkYellow,
              expandedHeight: 240.0,
              floating: false,
              pinned: true,
              leading: Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: MyBackButton(),
              ),
              flexibleSpace: FlexibleSpaceBar(
                collapseMode: CollapseMode.pin,
                background: Container(
                  color: LightColors.kLightYellow,
                  child: Column(
                    children: [
                      SizedBox(height: 60,),
                      Center(
                        child: Image(
                          height: 200,
                          image: AssetImage('assets/artwork/task.png'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ];
        },
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(
              20,
              20,
              20,
              0,
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: ListTaskGroup(),
                    ),
                  ],
                ),
                SizedBox(
                  height: 50,
                ),
              ],
            ),
          ),
        ),
      ),

      // SafeArea(
      //   child: SingleChildScrollView(
      //     child: Padding(
      //       padding: const EdgeInsets.fromLTRB(
      //         20,
      //         20,
      //         20,
      //         0,
      //       ),
      //       child: Column(
      //         children: [
      //           MyBackButton(),
      //           SizedBox(height: 30.0),
      //           Row(
      //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //             children: <Widget>[
      //               Text(
      //                 'Today',
      //                 style: TextStyle(
      //                     fontSize: 30.0, fontWeight: FontWeight.w700),
      //               ),
      //               Container(
      //                 height: 40.0,
      //                 width: 120,
      //                 decoration: BoxDecoration(
      //                   color: LightColors.kGreen,
      //                   borderRadius: BorderRadius.circular(30),
      //                 ),
      //                 child: FlatButton(
      //                   onPressed: () {},
      //                   child: Center(
      //                     child: Text(
      //                       'Timeline',
      //                       style: TextStyle(
      //                           color: Colors.white,
      //                           fontWeight: FontWeight.w700,
      //                           fontSize: 16),
      //                     ),
      //                   ),
      //                 ),
      //               ),
      //             ],
      //           ),
      //           SizedBox(
      //             height: 40,
      //           ),
      //           Row(
      //             children: [
      //               Expanded(
      //                 child: ListTaskGroup(),
      //               ),
      //             ],
      //           ),
      //           SizedBox(height: 50,),
      //         ],
      //       ),
      //     ),
      //   ),
      // ),
      floatingActionButton: FloatingActionButton(
        elevation: 5,
        backgroundColor: LightColors.kDarkYellow,
        child: Icon(Icons.add),
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (_) => AddNewTaskGroup(isEditMode: false),
          );
        },
        tooltip: 'Add a new task!',
      ),
    );
  }
}
