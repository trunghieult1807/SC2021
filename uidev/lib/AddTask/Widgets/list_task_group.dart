import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uidev/AddTask/Widgets/task_group_card.dart';
import 'package:uidev/HomePage/Widgets/okr_provider.dart';


//Parent widget of all ListItems, this widget role is just to group all list tiles.

class ListTaskGroup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final okrList = Provider.of<OKRProvider>(context).okrList;
    return okrList.length > 0
        ? ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: okrList.length,
            itemBuilder: (context, index) {
              return TaskGroup(okrList[index]);
            },
          )
        : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      height: MediaQuery.of(context).size.height - 450,
                      child: Image.asset('assets/waiting.png',
                          fit: BoxFit.cover),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      'No tasks added yet...',
                      style: Theme.of(context).textTheme.title,
                    ),
                  ],
                );

  }
}
