class Tasks {
  final String? label;
  final String? date;
  bool? isChecked;
  Tasks({this.label, this.date, this.isChecked});
  void switchingCheck() {
    isChecked = !isChecked!;
  }
}
