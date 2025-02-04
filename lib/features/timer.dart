import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TimerScreen extends StatelessWidget {
  final DateTime startTime = DateTime(2025, 1, 23, 14, 36, 39); // Example start time
  final Duration elapsedTime = Duration(hours: 1, minutes: 3, seconds: 57); // Example elapsed time

  @override
  Widget build(BuildContext context) {
    // Formatting start time
    final String formattedStartTime =
        DateFormat('yyyy-MM-dd HH:mm:ss').format(startTime);

    // Total duration for progress calculation
    final Duration totalDuration = Duration(hours: 1, minutes: 4); // Example total duration

    // Progress calculation
    final double progress = elapsedTime.inSeconds / totalDuration.inSeconds;

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Display start time
            Text(
              'Started at $formattedStartTime',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 20),
            // Circular progress indicator with elapsed time
            Stack(
              alignment: Alignment.center,
              children: [
                // Circular progress
                SizedBox(
                  width: 150,
                  height: 150,
                  child: CircularProgressIndicator(
                    value: progress, // Progress percentage
                    strokeWidth: 8,
                    backgroundColor: Colors.grey.shade300,
                    valueColor: AlwaysStoppedAnimation<Color>(
                      Colors.purple, // Progress color
                    ),
                  ),
                ),
                // Center content inside the circle
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Elapsed time in "hr min" format
                    Text(
                      '${elapsedTime.inHours} hr ${elapsedTime.inMinutes % 60} min',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 5),
                    // Clock icon
                    Icon(
                      Icons.access_time,
                      size: 24,
                      color: Colors.grey,
                    ),
                    SizedBox(height: 5),
                    // Elapsed time in "hh:mm:ss" format
                    Text(
                      _formatElapsedTime(elapsedTime),
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Helper function to format elapsed time in hh:mm:ss
  String _formatElapsedTime(Duration elapsedTime) {
    final int hours = elapsedTime.inHours;
    final int minutes = elapsedTime.inMinutes % 60;
    final int seconds = elapsedTime.inSeconds % 60;
    return '${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }
}

void main() => runApp(MaterialApp(home: TimerScreen()));
