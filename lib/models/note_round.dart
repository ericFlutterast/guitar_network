class NoteRound {
  String note;
  int index;
  double pitch;
  bool borderFlag;
  bool backgroundFlag;

  NoteRound({
    required this.note,
    required this.index,
    required this.pitch,
    required this.borderFlag,
    required this.backgroundFlag,
  });
}

abstract class ListOfNoteRound {
  static final List<NoteRound> listWithNotes = [
    NoteRound(
      note: '',
      index: 0,
      pitch: 0.0,
      borderFlag: false,
      backgroundFlag: false,
    ),
    NoteRound(
      note: '',
      index: 0,
      pitch: 0.0,
      borderFlag: false,
      backgroundFlag: false,
    ),
    NoteRound(
      note: '',
      index: 0,
      pitch: 0.0,
      borderFlag: false,
      backgroundFlag: false,
    ),
    NoteRound(
      note: '',
      index: 0,
      pitch: 0.0,
      borderFlag: false,
      backgroundFlag: false,
    ),
    NoteRound(
      note: '',
      index: 0,
      pitch: 0.0,
      borderFlag: false,
      backgroundFlag: false,
    ),
    NoteRound(
      note: '',
      index: 0,
      pitch: 0.0,
      borderFlag: false,
      backgroundFlag: false,
    ),
  ];
}
