import 'package:flutter/material.dart';
import 'package:note_app/models/note_model.dart';

class NotesProvider extends ChangeNotifier {
  List<NoteModel> notes = [];

  void addNotes(NoteModel note) {
    notes.add(note);
    notifyListeners();
  }

  void updateNote(NoteModel note) {
    int indexOfNote = notes.indexOf(
      notes.firstWhere((element) => element.id == note.id),
    );
    notes[indexOfNote] = note;
    notifyListeners();
  }

  void deleteNote(NoteModel note) {
    int indexOfNote = notes.indexOf(
      notes.firstWhere((element) => element.id == note.id),
    );
    notes.removeAt(indexOfNote);
    notifyListeners();
  }
}
