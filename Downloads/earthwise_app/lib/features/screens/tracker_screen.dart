// tracker_screen.dart
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart'; // Import the fl_chart package for charts and graphs
import '/features/screens/AR_visualization_screen.dart'; // This Update the import path accordingly
import '/features/screens/learning_modules_screen.dart'; // Import the LearningModulesScreen

class TrackerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Carbon Footprint Tracker',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF00BF63),
                ),
              ),
              const SizedBox(height: 20), // Padding from top
              Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: const Color(0xFF1791C8),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Row(
                  children: [
                    Icon(
                      Icons.info_outline,
                      color: Colors.white,
                      size: 24,
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        'Your carbon footprint is higher than average. Consider taking actions to reduce it.',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              _buildEmissionsCard(
                context,
                'Annual footprint (CO2)',
                '58.1 tons',
                '2024',
              ),
              const SizedBox(height: 20),
              _buildEmissionsCard(
                context,
                'Monthly',
                '29.7 kg',
                '2024',
              ),
              const SizedBox(height: 20),
              _buildEmissionsCard(
                context,
                'Weekly',
                '10.4 kg',
                '2024',
              ),
              const SizedBox(height: 20),
              _buildEmissionsCard(
                context,
                'Daily',
                '2.1 kg',
                '2024',
              ),
              const SizedBox(height: 30),
              const Text(
                'Emission Trends',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF00BF63),
                ),
              ),
              const SizedBox(height: 20),
              AspectRatio(
                aspectRatio: 1.7,
                child: LineChart(
                  _buildLineChartData(),
                ),
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LearningModulesScreen(),
                        ),
                      );
                    },
                    child: const Text(
                      'Learn more',
                      style:
                          TextStyle(color: Colors.white), // Button text color
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          Color(0xFF00BF63), // Set background color to #00BF63
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 15),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ARVisualizationsScreen(),
                        ),
                      );
                    },
                    child: const Text(
                      'AR/VR',
                      style:
                          TextStyle(color: Colors.white), // Button text color
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          Color(0xFF1791C8), // Set background color to #1791C8
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 15),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              const Text(
                'REDUCTION TIPS:',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF00BF63),
                ),
              ),
              const SizedBox(height: 10),
              _buildTip(context, 'Reduce Energy Consumption'),
              const SizedBox(height: 10),
              _buildTip(context, 'Minimize Transportation Emissions'),
              const SizedBox(height: 10),
              _buildTip(context, 'Adopt Sustainable Eating Habits'),
              const SizedBox(height: 10),
              _buildTip(
                  context, 'Support Renewable Energy and Carbon Offsetting'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildEmissionsCard(
      BuildContext context, String title, String value, String year) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                value,
                style: const TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF00BF63),
                ),
              ),
              Text(
                year,
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTip(BuildContext context, String tip) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF1791C8),
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.all(20),
      child: Row(
        children: [
          const Icon(
            Icons.check_circle_outline,
            color: Colors.white,
            size: 24,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              tip,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  LineChartData _buildLineChartData() {
    return LineChartData(
      gridData: const FlGridData(show: true),
      titlesData: const FlTitlesData(
        leftTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: true),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: true),
        ),
      ),
      borderData: FlBorderData(
        show: true,
        border: Border.all(
          color: Colors.black,
        ),
      ),
      lineBarsData: [
        LineChartBarData(
          spots: [
            const FlSpot(0, 3),
            const FlSpot(1, 1),
            const FlSpot(2, 4),
            const FlSpot(3, 2),
            const FlSpot(4, 5),
            const FlSpot(5, 3),
            const FlSpot(6, 4),
          ],
          isCurved: true,
          color: const Color(0xFF00BF63), // Corrected parameter
          barWidth: 4,
          isStrokeCapRound: true,
          dotData: const FlDotData(show: false),
        ),
      ],
    );
  }
}
