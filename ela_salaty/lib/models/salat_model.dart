class SalatModel {
  final String name;
  final String time;
  final String formDate;

  const SalatModel(this.formDate, {required this.name, required this.time});

  int getHours() {
    // لو الوقت في الشكل "HH:mm"
    return int.parse(time.substring(0, 2));
  }

  int getMinutes() {
    return int.parse(time.substring(3, 5));
  }
}
