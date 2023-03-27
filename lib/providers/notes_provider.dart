import 'package:flutter/material.dart';
import 'package:note_app/models/note_model.dart';

class NotesProvider extends ChangeNotifier {
  List<NoteModel> notes = [];

  void addNotes(NoteModel note) {
    notes.add(note);
    notifyListeners();
    
  }
}
