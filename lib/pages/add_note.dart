// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddNewNote extends StatefulWidget {
  const AddNewNote({Key? key}) : super(key: key);

  @override
  State<AddNewNote> createState() => _AddNewNoteState();
}

class _AddNewNoteState extends State<AddNewNote> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.check),
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        child: Column(
          children: [
            TextField(
              autofocus: true,
              textInputAction: TextInputAction.next,
              style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
              decoration: InputDecoration(
                hintText: "Title",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 5.h),
            TextField(
              maxLines: null,
              style: TextStyle(
                fontSize: 15.sp,
              ),
              decoration: InputDecoration(
                hintText: "Notes",
                border: OutlineInputBorder(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
