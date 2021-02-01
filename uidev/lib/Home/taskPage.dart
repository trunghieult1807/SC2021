import 'package:uidev/Task/animated_fab.dart';
import 'package:uidev/Task/diagonal_clipper.dart';
import 'package:uidev/Task/initial_list.dart';
import 'package:uidev/Task/list_model.dart';
import 'package:uidev/Task/task_row.dart';
import 'package:flutter/material.dart';


class TaskPage extends StatefulWidget {
  TaskPage({Key key}) : super(key: key);

  @override
  _TaskPageState createState() => new _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  final GlobalKey<AnimatedListState> _listKey =
      new GlobalKey<AnimatedListState>();
  final double _imageHeight = 256.0;
  ListModel listModel;
  bool showOnlyCompleted = false;

  @override
  void initState() {
    super.initState();
    listModel = new ListModel(_listKey, tasks);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Stack(
        children: <Widget>[
          _buildTimeline(),
          _buildImage(),
          _buildProfileRow(),
          _buildBottomPart(),
          _buildFab(),
        ],
      ),
    );
  }

  Widget _buildFab() {
    return new Positioned(
        top: _imageHeight - 100.0,
        right: -40.0,
        child: new AnimatedFab(
          onClick: _changeFilterState,
        ));
  }

  void _changeFilterState() {
    showOnlyCompleted = !showOnlyCompleted;
    tasks.where((task) => !task.completed).forEach((task) {
      if (showOnlyCompleted) {
        listModel.removeAt(listModel.indexOf(task));
      } else {
        listModel.insert(tasks.indexOf(task), task);
      }
    });
  }

  Widget _buildImage() {
    return Positioned.fill(
      bottom: null,
      child: ClipPath(
        clipper: DialogonalClipper(),
        child: Image.asset(
          'assets/dsc.png',
          fit: BoxFit.cover,
          height: _imageHeight,
          colorBlendMode: BlendMode.srcOver,
          color: Color.fromARGB(120, 20, 10, 40),
        ),
      ),
    );
  }



  Widget _buildProfileRow() {
    return Padding(
      padding: EdgeInsets.only(left: 16.0, top: _imageHeight / 2.5),
      child: Row(
        children: <Widget>[
          CircleAvatar(
            minRadius: 28.0,
            maxRadius: 28.0,
            backgroundImage: AssetImage('assets/profile.png'),
          ),
          Padding(
            padding: EdgeInsets.only(left: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  'Hieu Le',
                  style: new TextStyle(
                      fontSize: 26.0,
                      color: Colors.white,
                      fontWeight: FontWeight.w400),
                ),
                Text(
                  'UX/UI Developer',
                  style: new TextStyle(
                      fontSize: 14.0,
                      color: Colors.white,
                      fontWeight: FontWeight.w300),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBottomPart() {
    return Padding(
      padding: EdgeInsets.only(top: _imageHeight),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _buildMyTasksHeader(),
          _buildTasksList(),
        ],
      ),
    );
  }

  Widget _buildTasksList() {
    return Expanded(
      child: AnimatedList(
        initialItemCount: tasks.length,
        key: _listKey,
        itemBuilder: (context, index, animation) {
          return TaskRow(
            task: listModel[index],
            animation: animation,
          );
        },
      ),
    );
  }

  Widget _buildMyTasksHeader() {
    return Padding(
      padding: EdgeInsets.only(left: 64.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'My Tasks',
            style: new TextStyle(fontSize: 34.0),
          ),
          Text(
            'JANUARY 31, 2021',
            style: TextStyle(color: Colors.grey, fontSize: 12.0),
          ),
        ],
      ),
    );
  }

  Widget _buildTimeline() {
    return Positioned(
      top: 0.0,
      bottom: 0.0,
      left: 32.0,
      child: Container(
        width: 1.0,
        color: Colors.grey[300],
      ),
    );
  }
}
