import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_testing_with_fb/main.dart';
import 'package:flutter/material.dart';
import 'main.dart';

class AddNote extends StatefulWidget {
  const AddNote({Key? key}) : super(key: key);

  @override
  _AddNoteState createState() => _AddNoteState();
}

class _AddNoteState extends State<AddNote> {

  TextEditingController title = TextEditingController();
  TextEditingController content = TextEditingController();

  CollectionReference ref= FirebaseFirestore.instance.collection('notes');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          MaterialButton(onPressed: (){
            ref.add({
              'title' : title.text,
              'content': content.text,
            }).whenComplete(() {
              return Navigator.pushReplacement(context, MaterialPageRoute(builder:(context) =>  MyApp()));
            });
          },
       child: Text('Save'),

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































