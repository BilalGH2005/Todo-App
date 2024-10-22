class Tasks {
  final String? label;
  bool? isChecked;
  Tasks({this.label, this.isChecked = false});
  void switchingCheck() {
    isChecked = !isChecked!;
  }

  Map<String, dynamic> toJson() => {
        'label': label,
        'isChecked': isChecked,
      };
}
