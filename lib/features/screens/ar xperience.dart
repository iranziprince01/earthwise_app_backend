import 'package:flutter/material.dart';


class ARExperienceScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Get the width of the screen
    final double screenWidth = MediaQuery.of(context).size.width;


    return Scaffold(
      appBar: AppBar(
        // Set the background color of the app bar
        backgroundColor: const Color(0xFF00BF63),
        automaticallyImplyLeading: false, // Remove the default back arrow
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 75, // Set the width of the back button container
              height: 30, // Set the height of the back button container
              margin:
                  const EdgeInsets.all(4.0), // Add margin around the container
              child: TextButton.icon(
                style: TextButton.styleFrom(
                  padding: EdgeInsets.zero, // Remove padding
                  backgroundColor: Colors.white, // Set background color
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(8.0), // Set border radius
                  ),
                ),
                icon: const Icon(Icons.arrow_back,
                    color: Color(0xFF00BF63)), // Set back icon color
                label: const Text(
                  'Back',
                  style: TextStyle(color: Color(0xFF00BF63)), // Set label color
                ),
                onPressed: () {
                  Navigator.pop(context); // Go back to the previous screen
                },
              ),
            ),
            const Spacer(), // Add space between elements
            const Text(
              'AR Experience',
              style: TextStyle(color: Colors.white), // Set text color
            ),
            const Spacer(), // Add space between elements
            Container(width: 66), // Placeholder container to balance the layout
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0), // Add padding to the content
          child: Column(
            children: [
              Container(
                width:
                    screenWidth * 0.7, // Set the width relative to screen width
                alignment: Alignment.center, // Center align the text
                margin: const EdgeInsets.symmetric(
                    vertical: 16.0), // Add vertical margin
                child: const Text(
                  'AR Experience Launch',
                  style: TextStyle(
                    color: Color(0xFF00BF63), // Set text color
                    fontSize: 24, // Set font size
                    fontWeight: FontWeight.bold, // Set font weight
                  ),
                ),
              ),
              // Call the _buildInfoContainer method for each information container
              _buildInfoContainer(
                screenWidth,
                'It is the permanent destruction of forests for other uses. This process involves the clearing, cutting, and removal of trees.',
                'assets/images/deforestation.png',
                'Deforestation',
              ),
              const SizedBox(height: 16), // Add vertical spacing
              _buildInfoContainer(
                screenWidth,
                'Mammals, birds, amphibians, reptiles, fish have seen a devastating 69% drop on average since 1970, according to WWF\'s Living Planet Report (LPR) 2022.',
                'assets/images/populations.png',
                'Wildlife populations',
              ),
              const SizedBox(height: 16), // Add vertical spacing
              _buildInfoContainer(
                screenWidth,
                'Burning fossil fuels is one of the causes of global warming which causes the increase of the level of the world\'s oceans.',
                'assets/images/sea_level.png',
                'Sea level rise',
              ),
              const SizedBox(height: 16), // Add vertical spacing
              _buildInfoContainer(
                screenWidth,
                'The energy derived from natural sources can reduce carbon emissions and air pollution from energy production. Enhance reliability, security, and resilience of the power grid.',
                'assets/images/renewable_energy.png',
                'Renewable Energy',
              ),
              const SizedBox(height: 40), // Add vertical spacing
              Container(
                width:
                    screenWidth * 0.6, // Set the width relative to screen width
                alignment: Alignment.center, // Center align the text
                margin: const EdgeInsets.symmetric(
                    vertical: 16.0), // Add vertical margin
                child: const Text(
                  'Impacts of Deforestation',
                  style: TextStyle(
                    color: Color(0xFF1791C8), // Set text color
                    fontSize: 20, // Set font size
                    fontWeight: FontWeight.bold, // Set font weight
                  ),
                ),
              ),
              const SizedBox(height: 1), // Add vertical spacing
              // Call the _buildImpactRow method for each impact row
              _buildImpactRow(screenWidth, 'Loss of habitat and biodiversity',
                  'assets/images/animal.png'),
              const SizedBox(height: 16), // Add vertical spacing
              _buildImpactRow(
                  screenWidth,
                  'Disruption of global climate patterns',
                  'assets/images/global_warming.png'),
              const SizedBox(height: 16), // Add vertical spacing
              _buildImpactRow(
                  screenWidth,
                  'Soil erosion, degradation, and desertification',
                  'assets/images/Erosion.png'),
              const SizedBox(height: 16), // Add vertical spacing
              _buildImpactRow(
                  screenWidth,
                  'Contribution to greenhouse gas emissions',
                  'assets/images/greenhouse.png'),
              const SizedBox(height: 16), // Add vertical spacing
              Row(
                mainAxisAlignment:
                    MainAxisAlignment.center, // Center align the row
                children: [
                  const Text(
                    'Share:',
                    style: TextStyle(
                      fontSize: 16, // Set font size
                      fontWeight: FontWeight.bold, // Set font weight
                    ),
                  ),
                  const SizedBox(
                    width: 18, // Set the width of the sized box
                    height: 24, // Set the height of the sized box
                  ),
                  Image.asset(
                    'assets/images/facebook_earthwise_app.png',
                    width: 20, // Set image width
                    height: 19.92, // Set image height
                  ),
                  const SizedBox(width: 16), // Add horizontal spacing
                  Image.asset(
                    'assets/images/instagram_earthwise_app.png',
                    width: 20, // Set image width
                    height: 20, // Set image height
                  ),
                  const SizedBox(width: 16), // Add horizontal spacing
                  Image.asset(
                    'assets/images/linkedin_earthwise_app.png',
                    width: 18, // Set image width
                    height: 18, // Set image height
                  ),
                  const SizedBox(width: 16), // Add horizontal spacing
                  Image.asset(
                    'assets/images/twitter_earthwise_app.png',
                    width: 28, // Set image width
                    height: 28, // Set image height
                  ),
                ],
              ),
              const SizedBox(height: 16), // Add vertical spacing
              const Center(child: Text('')), // Placeholder text
            ],
          ),
        ),
      ),
    );
  }


  Widget _buildInfoContainer(
      double screenWidth, String text, String imagePath, String title) {
    return Container(
      width: screenWidth * 0.9, // Set the width relative to screen width
      padding: const EdgeInsets.all(16.0), // Add padding to the container
      decoration: BoxDecoration(
        color: const Color(0xFF1791C8), // Set background color
        borderRadius: BorderRadius.circular(8.0), // Set border radius
      ),
      alignment: Alignment.center, // Center align the content
      child: Row(
        children: [
          Image.asset(
            imagePath,
            width:
                screenWidth * 0.2, // Set image width relative to screen width
            height:
                screenWidth * 0.2, // Set image height relative to screen width
          ),
          const SizedBox(width: 16), // Add horizontal spacing
          Expanded(
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start, // Align children to the start
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white, // Set text color
                    fontSize: 16, // Set font size
                    fontWeight: FontWeight.bold, // Set font weight
                  ),
                ),
                const SizedBox(height: 8), // Add vertical spacing
                Text(
                  text,
                  style: const TextStyle(
                    color: Colors.white, // Set text color
                    fontSize: 16, // Set font size
                    height: 1.5, // Set line height
                  ),
                  textAlign: TextAlign.left, // Align text to the left
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }


  Widget _buildImpactRow(double screenWidth, String text, String imagePath) {
    return Row(
      children: [
        Image.asset(
          imagePath,
          width: screenWidth * 0.2, // Set image width relative to screen width
          height:
              screenWidth * 0.2, // Set image height relative to screen width
        ),
        const SizedBox(width: 16), // Add horizontal spacing
        Expanded(
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.black, // Set text color
              fontSize: 16, // Set font size
              height: 1.5, // Set line height
            ),
          ),
        ),
      ],
    );
  }
}
