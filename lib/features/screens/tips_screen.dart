import 'package:flutter/material.dart';

class TipsScreen extends StatefulWidget {
  const TipsScreen({Key? key}) : super(key: key);

  @override
  _TipsScreenState createState() => _TipsScreenState();
}

class _TipsScreenState extends State<TipsScreen> {
  final TextEditingController tipController = TextEditingController();
  final List<String> tips = [
    '1. Carbon footprint tracking',
    '2. Sustainable transportation',
    '3. Waste reduction and recycling',
    '4. Sustainable consumption',
    '5. Community engagement',
    '6. Daily habits',
    '7. Advocacy and education',
    '8. Support urban green spaces',
    '9. Lifestyle inspiration',
    '10. Sustainable investing',
  ];

  @override
  void dispose() {
    tipController.dispose();
    super.dispose();
  }

  void _submitTip() {
    final tip = tipController.text;
    if (tip.isNotEmpty) {
      setState(() {
        tips.add(tip);
      });
      tipController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF00BF63),
        automaticallyImplyLeading: false, // Remove the default back arrow
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            const SizedBox(width: 10), // Add space between back icon and title
            const Text(
              'Sustainable Living Practices',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            const Text(
              'Lifestyle Tips',
              style: TextStyle(
                color: Color(0xFF00BF63),
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Container(
              width: 356,
              decoration: BoxDecoration(
                color: const Color(0xFFD800DC),
                borderRadius: BorderRadius.circular(12.0),
              ),
              padding: const EdgeInsets.all(16.0),
              child: Text(
                tips.join('\n'),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              width: 356,
              decoration: BoxDecoration(
                color: const Color(0xFF00BF63),
                borderRadius: BorderRadius.circular(12.0),
              ),
              padding: const EdgeInsets.all(16.0),
              child: const Text(
                'Stay informed and get involved in local climate initiatives. '
                'Together, we can make a difference in the community and beyond '
                'in order to increase the standard of living among the people.',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Environmental Organizations:',
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Container(
              width: 356,
              decoration: BoxDecoration(
                color: const Color(0xFF1791C8),
                borderRadius: BorderRadius.circular(12.0),
              ),
              padding: const EdgeInsets.all(16.0),
              child: const Text(
                '1. Green peace\n'
                '2. Earth Island Institute\n'
                '3. Earth Justice\n'
                '4. Environmental defense fund\n'
                '5. Fauna and flora International(FFI)\n'
                '6. Global footprint network\n',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 38,
                    width: 38,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage('assets/images/profile.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Container(
                      height: 80,
                      decoration: BoxDecoration(
                        color: const Color(0xFF00BF63),
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: tipController,
                        decoration: const InputDecoration(
                          hintText: 'Add your tips here......',
                          hintStyle: TextStyle(color: Colors.white),
                          border: InputBorder.none,
                        ),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                  const SizedBox(width: 6),
                  ElevatedButton(
                    onPressed: _submitTip,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFFC0D38),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100.0),
                      ),
                    ),
                    child: const Text(
                      'Submit',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20), // Add some spacing at the bottom
          ],
        ),
      ),
    );
  }
}
