import 'package:flutter/material.dart';
import 'Profilesize.dart';
import 'date.dart';

class PetWeight extends StatefulWidget {
  @override
  _PetWeightState createState() => _PetWeightState();
}

class _PetWeightState extends State<PetWeight> {
  double _currentWeightKg = 0.0; // Default weight in kg
  double _currentWeightLb = 0.0 * 2.20462; // Initial conversion to lb
  bool _isKg = true; // Toggle between kg and lb
  ScrollController _scrollController = ScrollController();
  double _maxKg = 1000; // Maximum weight in kg
  double _maxLb = 20000; // Maximum weight in lb
  double _rulerItemWidth = 16; // Width of each tick mark on the ruler

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      setState(() {
        // Update the weight based on the scroll position
        double scrollOffset = _scrollController.offset;

        // Map the scroll offset to the weight in kg (1 unit of scroll = 0.1kg)
        _currentWeightKg = (scrollOffset / _rulerItemWidth).clamp(0, _maxKg);
        _currentWeightLb = _currentWeightKg * 2.20462;

        // Clamp the weight in pounds
        if (_currentWeightLb > _maxLb) {
          _currentWeightLb = _maxLb; // Limit lb to max value
        }
      });
    });

    WidgetsBinding.instance.addPostFrameCallback((_) {
      // Align the initial scroll position to the current weight in kg
      _scrollController.jumpTo(_currentWeightKg * _rulerItemWidth);
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  // Function to build the ruler
  Widget _buildRuler() {
    return ListView.builder(
      controller: _scrollController,
      scrollDirection: Axis.horizontal,
      // Update the itemCount to reflect the actual number of ruler ticks
      // Multiplying by 10 allows for more granular tick marks (0.1 kg per tick)
      itemCount: (_isKg ? _maxKg * 10 : _maxLb * 10).toInt(),
      itemBuilder: (context, index) {
        bool isMajorTick = index % 10 == 0;
        return Container(
          width: _rulerItemWidth,
          alignment: Alignment.bottomCenter,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                width: 2,
                height: isMajorTick ? 60 : 20, // Longer line every 10th tick
                color: Colors.grey,
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('Add Pet Profile',
                  style: TextStyle(color: Colors.black, fontSize: 18)),
              Text('Weight', style: TextStyle(color: Colors.grey, fontSize: 14)),
            ],
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Column(
              children: [
                Text(
                  'Step',
                  style: TextStyle(color: Colors.black),
                ),
                Row(
                  children: [
                    Text(
                      '6',
                      style: TextStyle(color: Colors.black),
                    ),
                    Text(
                      '/9',
                      style: TextStyle(color: Colors.grey),
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          // Progress Bar
          Container(
            margin: EdgeInsets.symmetric(horizontal: 16.0),
            child: LinearProgressIndicator(
              value: 6 / 9, // Step 6 of 9
              backgroundColor: Colors.grey[200],
              valueColor: AlwaysStoppedAnimation<Color>(Colors.yellow[700]!),
            ),
          ),
          SizedBox(height: 80),
          Container(
            width: 200,
            height: 130,
            child: CircleAvatar(
              backgroundImage: AssetImage('assets/images/Border Collie.jpeg'),
              radius: 70,
            ),
          ),
          SizedBox(height: 40),
          Column(
            children: [
              Text(
                'What’s your pet’s weight?',
                style: TextStyle(fontSize: 20, color: Colors.black),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(top: 10.0, left: 20.0),
                child: Column(
                  children: [
                    Text(
                      'Automatic selection based on your pet’s breed.',
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                    Text(
                      'Adjust according to reality',
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                    SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            _isKg
                                ? _currentWeightKg
                                .toStringAsFixed(1)
                                .replaceAll('.', ',')
                                : _currentWeightLb
                                .toStringAsFixed(1)
                                .replaceAll('.', ','),
                            style: TextStyle(
                              fontSize: 70,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue,
                            ),
                          ),
                          SizedBox(height: 5),
                          Container(
                            height: 70, // Adjust height of ruler
                            child: _buildRuler(),
                          ),
                          SizedBox(height: 20),
                          // Custom Toggle for kg/lb
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      _isKg = true;
                                    });
                                  },
                                  child: Container(
                              decoration: BoxDecoration(
                               borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                       color: Colors.grey.shade400, width: 1.5
                                ),),
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 50, vertical: 10),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Radio(
                                            value: true,
                                            groupValue: _isKg,
                                            onChanged: (value) {
                                              setState(() {
                                                _isKg = true;
                                              });
                                            },
                                            activeColor: Colors.black,
                                          ),
                                          Text(
                                            'kg',
                                            style: TextStyle(
                                              color: _isKg
                                                  ? Colors.black
                                                  : Colors.grey,
                                              fontSize: 16,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 15),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      _isKg = false;
                                    });
                                  },
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 50, vertical: 10),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                          color: Colors.grey.shade400, width: 1.5
                                      ),),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Row(
                                        children: [
                                          Radio(
                                            value: false,
                                            groupValue: _isKg,
                                            onChanged: (value) {
                                              setState(() {
                                                _isKg = false;
                                              });
                                            },
                                            activeColor: Colors.black,
                                          ),
                                          Text(
                                            'lb',
                                            style: TextStyle(
                                              color: !_isKg
                                                  ? Colors.black
                                                  : Colors.grey,
                                              fontSize: 16,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 10),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 40.0, right: 20.0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.lightBlue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          minimumSize: Size(
                              double.infinity, 60), // Full-width button
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AddPetProfileScreen()),
                          );
                        },
                        child: Text(
                          'Continue',
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
