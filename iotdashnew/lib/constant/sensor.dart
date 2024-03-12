class SensorData {
  final String time;
  final double temperature;

  SensorData({required this.time, required this.temperature});

   @override
     String toString() {
    return 'Time: $time, Temperature: $temperature';
  }
}