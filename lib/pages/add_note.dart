// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:note_app/models/note_model.dart';
import 'package:note_app/providers/notes_provider.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

class AddNewNote extends StatefulWidget {
  final bool isUpdate;
  final NoteModel? noteModel;
  const AddNewNote({Key? key, required this.isUpdate, this.noteModel})
      : super(key: key);

  @override
  State<AddNewNote> createState() => _AddNewNoteState();
}

class _AddNewNoteState extends State<AddNewNote> {
  TextEditingController titleController = TextEditingController();
  TextEditingController contentController = TextEditingController();

  void addNote() {
    NoteModel noteModel = NoteModel(
      id: Uuid().v1(),
      userId: "ihsohag",
      title: titleController.text,
      content: contentController.text,
      dateadded: DateTime.now(),
    );
    Provider.of<NotesProvider>(context, listen: false).addNotes(noteModel);
    Navigator.pop(context);
  }

  void updateNote() {
    widget.noteModel!.title = titleController.text;
    widget.noteModel!.content = contentController.text;
    Provider.of<NotesProvider>(context, listen: false)
        .updateNote(widget.noteModel!);
    Navigator.pop(context);
  }

  @override
  void initState() {
    super.initState();
    if (widget.isUpdate) {
      titleController.text = widget.noteModel!.title!;
      contentController.text = widget.noteModel!.content!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              if (titleController.text.trim().isNotEmpty &&
                  contentController.text.trim().isNotEmpty) {
                if (widget.isUpdate) {
                  //update note
                  updateNote();
                } else {
                  //add note
                  addNote();
                }
              } else {
                print("Please filled all the field");
              }
            },
            icon: Icon(Icons.check),
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        child: Column(
          children: [
            TextField(
              controller: titleController,
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
              controller: contentController,
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
