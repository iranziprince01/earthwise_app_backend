// tracker_screen.dart
import 'package:flutter/material.dart'; // Import the Flutter material package
import 'package:fl_chart/fl_chart.dart'; // Import the fl_chart package for charts and graphs
import '/features/screens/AR_visualization_screen.dart'; // Import AR visualization screen
import '/features/screens/learning_modules_screen.dart'; // Import the learning modules screen

class TrackerScreen extends StatelessWidget { // Define a stateless widget called TrackerScreen
  @override
  Widget build(BuildContext context) { // Override the build method
    return Scaffold(
      backgroundColor: Colors.white, // Set background color to white
      body: Padding(
        padding: const EdgeInsets.all(16.0), // Add padding around the body
        child: SingleChildScrollView( // Make the body scrollable
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start, // Align children to the start
            children: [
              const Text(
                'Carbon Footprint Tracker', // Title text
                style: TextStyle(
                  fontSize: 24, // Set font size
                  fontWeight: FontWeight.bold, // Set font weight to bold
                  color: Color(0xFF00BF63), // Set text color
                ),
              ),
              const SizedBox(height: 20), // Add vertical spacing
              Container(
                padding: const EdgeInsets.all(16.0), // Add padding inside the container
                decoration: BoxDecoration(
                  color: const Color(0xFF1791C8), // Set background color
                  borderRadius: BorderRadius.circular(10), // Set border radius
                ),
                child: const Row(
                  children: [
                    Icon(
                      Icons.info_outline, // Info icon
                      color: Colors.white, // Set icon color to white
                      size: 24, // Set icon size
                    ),
                    SizedBox(width: 10), // Add horizontal spacing
                    Expanded(
                      child: Text(
                        'Your carbon footprint is higher than average. Consider taking actions to reduce it.', // Info text
                        style: TextStyle(
                          fontSize: 16, // Set font size
                          color: Colors.white, // Set text color to white
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20), // Add vertical spacing
              _buildEmissionsCard(
                context,
                'Annual footprint (CO2)', // Title for annual footprint
                '58.1 tons', // Value for annual footprint
                '2024', // Year
              ),
              const SizedBox(height: 20), // Add vertical spacing
              _buildEmissionsCard(
                context,
                'Monthly', // Title for monthly footprint
                '29.7 kg', // Value for monthly footprint
                '2024', // Year
              ),
              const SizedBox(height: 20), // Add vertical spacing
              _buildEmissionsCard(
                context,
                'Weekly', // Title for weekly footprint
                '10.4 kg', // Value for weekly footprint
                '2024', // Year
              ),
              const SizedBox(height: 20), // Add vertical spacing
              _buildEmissionsCard(
                context,
                'Daily', // Title for daily footprint
                '2.1 kg', // Value for daily footprint
                '2024', // Year
              ),
              const SizedBox(height: 30), // Add vertical spacing
              const Text(
                'Emission Trends', // Title for emission trends section
                style: TextStyle(
                  fontSize: 20, // Set font size
                  fontWeight: FontWeight.bold, // Set font weight to bold
                  color: Color(0xFF00BF63), // Set text color
                ),
              ),
              const SizedBox(height: 20), // Add vertical spacing
              AspectRatio(
                aspectRatio: 1.7, // Set aspect ratio for the chart
                child: LineChart(
                  _buildLineChartData(), // Build the line chart data
                ),
              ),
              const SizedBox(height: 30), // Add vertical spacing
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly, // Distribute space evenly
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LearningModulesScreen(), // Navigate to learning modules screen
                        ),
                      );
                    },
                    child: const Text(
                      'Learn more', // Button text
                      style: TextStyle(color: Colors.white), // Button text color
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF00BF63), // Set button background color
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15), // Set button padding
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ARVisualizationsScreen(), // Navigate to AR visualizations screen
                        ),
                      );
                    },
                    child: const Text(
                      'AR/VR', // Button text
                      style: TextStyle(color: Colors.white), // Button text color
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF1791C8), // Set button background color
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15), // Set button padding
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30), // Add vertical spacing
              const Text(
                'REDUCTION TIPS:', // Title for reduction tips section
                style: TextStyle(
                  fontSize: 20, // Set font size
                  fontWeight: FontWeight.bold, // Set font weight to bold
                  color: Color(0xFF00BF63), // Set text color
                ),
              ),
              const SizedBox(height: 10), // Add vertical spacing
              _buildTip(context, 'Reduce Energy Consumption'), // Build a tip card
              const SizedBox(height: 10), // Add vertical spacing
              _buildTip(context, 'Minimize Transportation Emissions'), // Build a tip card
              const SizedBox(height: 10), // Add vertical spacing
              _buildTip(context, 'Adopt Sustainable Eating Habits'), // Build a tip card
              const SizedBox(height: 10), // Add vertical spacing
              _buildTip(context, 'Support Renewable Energy and Carbon Offsetting'), // Build a tip card
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildEmissionsCard(BuildContext context, String title, String value, String year) { // Function to build emissions card
    return Container(
      decoration: BoxDecoration(
        color: Colors.white, // Set background color to white
        borderRadius: BorderRadius.circular(10), // Set border radius
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3), // Set shadow color with opacity
            spreadRadius: 2, // Set shadow spread radius
            blurRadius: 5, // Set shadow blur radius
            offset: const Offset(0, 3), // Set shadow offset
          ),
        ],
      ),
      padding: const EdgeInsets.all(20), // Add padding inside the container
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start, // Align children to the start
        children: [
          Text(
            title, // Emission type title
            style: const TextStyle(
              fontSize: 18, // Set font size
              fontWeight: FontWeight.bold, // Set font weight to bold
              color: Colors.black, // Set text color
            ),
          ),
          const SizedBox(height: 10), // Add vertical spacing
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween, // Distribute space between elements
            children: [
              Text(
                value, // Emission value
                style: const TextStyle(
                  fontSize: 36, // Set font size
                  fontWeight: FontWeight.bold, // Set font weight to bold
                  color: Color(0xFF00BF63), // Set text color
                ),
              ),
              Text(
                year, // Emission year
                style: const TextStyle(
                  fontSize: 18, // Set font size
                  color: Colors.grey, // Set text color
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTip(BuildContext context, String tip) { // Function to build a tip card
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF1791C8), // Set background color
        borderRadius: BorderRadius.circular(10), // Set border radius
      ),
      padding: const EdgeInsets.all(20), // Add padding inside the container
      child: Row(
        children: [
          const Icon(
            Icons.check_circle_outline, // Check circle icon
            color: Colors.white, // Set icon color to white
            size: 24, // Set icon size
          ),
          const SizedBox(width: 10), // Add horizontal spacing
          Expanded(
            child: Text(
              tip, // Tip text
              style: const TextStyle(
                fontSize: 16, // Set font size
                color: Colors.white, // Set text color to white
              ),
            ),
          ),
        ],
      ),
    );
  }

  LineChartData _buildLineChartData() { // Function to build line chart data
    return LineChartData(
      gridData: const FlGridData(show: true), // Show grid
      titlesData: const FlTitlesData(
        leftTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: true), // Show left titles
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: true), // Show bottom titles
        ),
      ),
      borderData: FlBorderData(
        show: true, // Show border
        border: Border.all(
          color: Colors.black, // Set border color
        ),
      ),
      lineBarsData: [
        LineChartBarData(
          spots: [
            const FlSpot(0, 3), // Data point
            const FlSpot(1, 1), // Data point
            const FlSpot(2, 4), // Data point
            const FlSpot(3, 2), // Data point
            const FlSpot(4, 5), // Data point
            const FlSpot(5, 3), // Data point
            const FlSpot(6, 4), // Data point
          ],
          isCurved: true, // Make the line curved
          color: const Color(0xFF00BF63), // Set line color
          barWidth: 4, // Set line width
          isStrokeCapRound: true, // Set stroke cap to round
          dotData: const FlDotData(show: false), // Hide data points
        ),
      ],
    );
  }
}
