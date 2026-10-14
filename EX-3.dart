class MyDuration {
  int _milliseconds = 0;

  MyDuration(this._milliseconds);

  MyDuration operator +(MyDuration other) => MyDuration(_milliseconds + other._milliseconds);
  MyDuration operator -(MyDuration other) {
    if(_milliseconds < other._milliseconds){
      throw Exception("Time cannot be negative.");
    }
    return MyDuration(_milliseconds - other._milliseconds);
  }
  bool operator >(MyDuration other) => _milliseconds > other._milliseconds;

  MyDuration.fromHours(int hours) {
    if (hours < 0) throw Exception("Time cannot be negative");
    _milliseconds += hours * 60 * 60 * 1000;
  }
  MyDuration.fromMinutes(int minutes) {
    if (minutes < 0) throw Exception("Time cannot be negative");
    _milliseconds += minutes * 60 * 1000;
  }
  MyDuration.fromSeconds(int seconds) {
    _milliseconds += seconds * 1000;
  }
  // Display the duration in a readable format
  @override
  String toString() {
    int seconds = (_milliseconds / 1000).round();
    int minutes = (seconds / 60).floor();
    seconds = seconds % 60;
    int hours = (minutes / 60).floor();
    minutes = minutes % 60;
    return '$hours hours, $minutes minutes, $seconds seconds';
  }
}

void main() {
  MyDuration duration1 = MyDuration.fromHours(3); 
  MyDuration duration2 = MyDuration.fromMinutes(45); 
  print(duration1 + duration2); // 3 hours, 45 minutes, 0 seconds
  print(duration1>duration2); //true

  try {
    print(duration2 - duration1); // This will throw an exception
  } catch (e) {
    print(e); 
  }
}
