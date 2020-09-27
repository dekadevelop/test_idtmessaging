String getDateFromTimeStamp(int value) {
  var d = DateTime.fromMillisecondsSinceEpoch(value);
  return "${d.day}/${_format(d.month)}/${d.year} "
      "${_format(d.hour)}:${_format(d.minute)}:${_format(d.second)}";
}

String _format(int value) {
  return value.toString().padLeft(2, '0');
}

int getCurrentTimeStamp() {
  return DateTime.now().millisecondsSinceEpoch;
}
