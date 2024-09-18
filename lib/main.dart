import 'package:flutter/material.dart';

void main() {
  runApp(const FuelCalculator());
}

class FuelCalculator extends StatelessWidget {
  const FuelCalculator({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: CalculatorScreen(),
    );
  }
}

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  _CalculatorScreen createState() => _CalculatorScreen();
}

class _CalculatorScreen extends State<CalculatorScreen> {
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _distanceController = TextEditingController();
  final TextEditingController _efficiencyController = TextEditingController();
  final TextEditingController _daysController = TextEditingController();

  double _totalCost = 0.0;

  void _calculateCost() {
    double price = double.tryParse(_priceController.text) ?? 0;
    double distance = double.tryParse(_distanceController.text) ?? 0;
    double efficiency = double.tryParse(_efficiencyController.text) ?? 0;
    int days = int.tryParse(_daysController.text) ?? 1;

    setState(() {
      _totalCost = ((distance / efficiency) * price) * days;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fuel Cost Calculator'),
      ),
      body: Padding(padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          TextField(
            controller: _priceController,
            decoration: const InputDecoration(
              labelText: 'Current Fuel Price (per litre)'
            ),
            keyboardType: TextInputType.number,
          ),
          TextField(
            controller: _distanceController,
            decoration: const InputDecoration(
              labelText: 'Distance (in KM)'
            ),
            keyboardType: TextInputType.number,
          ),
          TextField(
            controller: _efficiencyController,
            decoration: const InputDecoration(
              labelText: 'Km/ltr'
            ),
            keyboardType: TextInputType.number,
          ),
          TextField(
            controller: _daysController,
            decoration: const InputDecoration(
              labelText: 'Days'
            ),
            keyboardType: TextInputType.number,
          ),
          const SizedBox(height: 20),
          ElevatedButton(onPressed: _calculateCost, child: const Text('Calculate Cost'),
          ),
          const SizedBox(height: 20),
          Text('Total Cost: AED ${_totalCost.toStringAsFixed(2)}')
        ],
      ),
      ),
    );
  }
}
