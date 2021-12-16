import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'main.dart';

class EditNode extends StatefulWidget {
  DocumentSnapshot docid;
  EditNode({
    required this.docid,
    Key? key}) : super(key: key);

  @override
  _EditNodeState createState() => _EditNodeState();
}

class _EditNodeState extends State<EditNode> {


  TextEditingController title = TextEditingController();
  TextEditingController content = TextEditingController();

  @override
  void initState(){
    title = TextEditingController(text: widget.docid.get('title'));
    content = TextEditingController(text: widget.docid.get('content'));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          MaterialButton(
            onPressed: (){
            widget.docid.reference.update({
              'title' : title,
              'content': content,
            }).whenComplete(() => Navigator.pushReplacement(context, MaterialPageRoute(builder:(context) =>  MyApp())));
          },
          child: Text('Update'),
          ),
          MaterialButton(
            onPressed: (){
              widget.docid.reference.delete().whenComplete(() => Navigator.pushReplacement(context, MaterialPageRoute(builder:(context) =>  MyApp())));
            },
            child: Text('Delete'),
          ),
        ],
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(border: Border.all()),
              child: TextField(
                controller: title,
                decoration: InputDecoration(
                    hintText: 'title'
                ),
              ),
            ),


            SizedBox(
              height: 5,
            ),

            Expanded(
              child: Container(
                decoration: BoxDecoration(border: Border.all()),
                child: TextField(
                  controller: content,
                  expands: true,
                  maxLines: null,
                  decoration: InputDecoration(
                      hintText: 'content'
                  ),
                ),
              ),
            ),

          ],
        ),
      ),

    );
  }
}



































