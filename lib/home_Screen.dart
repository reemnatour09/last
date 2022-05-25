import 'package:flutter/material.dart';
import 'package:note_application/addNote_Screen.dart';
import 'package:provider/provider.dart';

import 'database/note_getx_controller.dart';
import 'editNote_Screen.dart';
import 'model/noteModel.dart';

class home_Screen extends StatefulWidget {
  const home_Screen({Key? key}) : super(key: key);

  @override
  State<home_Screen> createState() => _home_ScreenState();
}

class _home_ScreenState extends State<home_Screen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('My Notes'),
          centerTitle: true,
          backgroundColor: Colors.blue,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, '/newNote');
          },
          child: Icon(Icons.add),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: Consumer<AccountChangeNotifier>(builder: (
            BuildContext context,
            AccountChangeNotifier value,
            Widget? child,
          ) {
            if (value.note.isEmpty) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Divider(
                    color: Colors.transparent,
                  ),
                  Text(
                    'No Notes :(',
                    style: TextStyle(
                        fontSize: 25,
                        color: Colors.black45,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    'you have no task to do.',
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.black45,
                        fontWeight: FontWeight.bold),
                  )
                ],
              );
            }
            return ListView.separated(
                itemCount: value.note.length,
                separatorBuilder: (context, index) {
                  return SizedBox(
                    height: 15,
                  );
                },
                itemBuilder: (context, index) {
                  Note note = value.note[index];

                  return GestureDetector(
                    onTap: () async {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => editNote_Screen(
                            notedata: note,
                          ),
                        ),
                      );
                    },
                    child: Container(
                      height: 100,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.06),
                            spreadRadius: 5,
                            blurRadius: 6,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.white,
                      ),
                      clipBehavior: Clip.antiAlias,
                      child: Row(
                        children: [
                          Container(
                            height: 100,
                            width: 20,
                            decoration: BoxDecoration(
                              // color: Colors.yellow,
                              color: Color(int.parse('${note.color}')),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(15),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: 250,
                                  child: Text(
                                    note.title,
                                    maxLines: 1,
                                    style: TextStyle(
                                      fontSize: 15,
                                      overflow: TextOverflow.ellipsis,
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.w500,
                                      color: Colors.blue,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                SizedBox(
                                  width: 250,
                                  child: Text(
                                    note.description,
                                    maxLines: 2,
                                    style: TextStyle(
                                      overflow: TextOverflow.ellipsis,
                                      fontSize: 12,
                                      fontFamily: 'Montserrat',
                                      color: Colors.black,
                                    ),
                                  ),
                                ),

                                //-------------------------------------------//
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                });
          }),
        ));
  }
}
