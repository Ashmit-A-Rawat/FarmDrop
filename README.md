Project For SIH-2024
I have added Weather forecast and pest alert in separate repos:
Also added farmer_education feature in readme file of weather and pest
I am providing code for 1. Demand trends and forecasting 
main.dart:
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Agriculture Insights',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Agriculture Insights'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HeaderSection(),
          NavigationOptionsSection(),
        ],
      ),
      bottomNavigationBar: FooterSection(),
    );
  }
}

class HeaderSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Text(
            'Agriculture Insights',
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
          ),
          Text(
            'Empowering Farmers with Data-Driven Decisions',
            style: TextStyle(fontSize: 18),
          ),
        ],
      ),
    );
  }
}

class NavigationOptionsSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          NavigationButton(
            label: 'Real-Time Demand Forecasting',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => RealTimeDemandForecastingSection()),
              );
            },
          ),
          NavigationButton(
            label: 'Crop Planning Recommendations',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => CropPlanningRecommendationsSection()),
              );
            },
          ),
          NavigationButton(
            label: 'Profitability Estimations',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ProfitabilityEstimationsSection()),
              );
            },
          ),
          NavigationButton(
            label: 'Market Alerts',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MarketAlertsSection()),
              );
            },
          ),
        ],
      ),
    );
  }
}

class NavigationButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;

  NavigationButton({required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ElevatedButton(
        onPressed: onTap,
        child: Text(label),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.teal,
          foregroundColor: Colors.white,
        ),
      ),
    );
  }
}

class RealTimeDemandForecastingSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Real-Time Demand Forecasting'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Real-Time Demand Forecasting',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Container(
              height: 400,
              child: charts.BarChart(
                [
                  charts.Series<Map<String, dynamic>, String>(
                    id: 'Demand',
                    data: [
                      {'crop': 'Apple', 'value': 50},
                      {'crop': 'Banana', 'value': 60},
                      {'crop': 'Carrot', 'value': 45},
                      {'crop': 'Tomato', 'value': 55},
                      {'crop': 'Broccoli', 'value': 40},
                      {'crop': 'Grapes', 'value': 65},
                      {'crop': 'Sugarcane', 'value': 70},
                      {'crop': 'Potato', 'value': 80},
                      {'crop': 'Onion', 'value': 75},
                      {'crop': 'Garlic', 'value': 50},
                      {'crop': 'Spinach', 'value': 60},
                      {'crop': 'Cucumber', 'value': 45},
                      {'crop': 'Lettuce', 'value': 55},
                      {'crop': 'Pumpkin', 'value': 30},
                      {'crop': 'Beetroot', 'value': 40},
                      {'crop': 'Cauliflower', 'value': 35},
                      {'crop': 'Bell Pepper', 'value': 50},
                      {'crop': 'Cabbage', 'value': 45},
                      {'crop': 'Chilli', 'value': 55},
                      {'crop': 'Radish', 'value': 30},
                      {'crop': 'Mango', 'value': 70},
                      {'crop': 'Pineapple', 'value': 65},
                      {'crop': 'Strawberry', 'value': 75},
                      {'crop': 'Pear', 'value': 60},
                    ],
                    domainFn: (Map<String, dynamic> data, _) => data['crop'],
                    measureFn: (Map<String, dynamic> data, _) => data['value'],
                    colorFn: (_, __) =>
                        charts.MaterialPalette.teal.shadeDefault,
                  ),
                ],
                animate: true,
                vertical: false,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CropPlanningRecommendationsSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Crop Planning Recommendations'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: DataTable(
            columns: [
              DataColumn(
                  label: Text('Crop',
                      style: TextStyle(fontWeight: FontWeight.bold))),
              DataColumn(
                  label: Text('Recommendation',
                      style: TextStyle(fontWeight: FontWeight.bold))),
              DataColumn(
                  label: Text('Planting Time',
                      style: TextStyle(fontWeight: FontWeight.bold))),
            ],
            rows: [
              DataRow(cells: [
                DataCell(Text('Apple')),
                DataCell(
                    Text('Requires cool temperatures, plant in early spring')),
                DataCell(Text('March - April')),
              ]),
              DataRow(cells: [
                DataCell(Text('Banana')),
                DataCell(
                    Text('Thrives in tropical climates, plant year-round')),
                DataCell(Text('Anytime')),
              ]),
              DataRow(cells: [
                DataCell(Text('Carrot')),
                DataCell(Text('Requires loose soil, plant in early spring')),
                DataCell(Text('March - April')),
              ]),
              DataRow(cells: [
                DataCell(Text('Tomato')),
                DataCell(Text('Needs warm temperatures, plant after frost')),
                DataCell(Text('April - May')),
              ]),
              DataRow(cells: [
                DataCell(Text('Broccoli')),
                DataCell(Text(
                    'Requires cool weather, plant in early spring or fall')),
                DataCell(Text('March - May, August - September')),
              ]),
              DataRow(cells: [
                DataCell(Text('Grapes')),
                DataCell(
                    Text('Prefers sunny locations, plant in early spring')),
                DataCell(Text('March - April')),
              ]),
              DataRow(cells: [
                DataCell(Text('Sugarcane')),
                DataCell(
                    Text('Requires tropical climate, plant during dry season')),
                DataCell(Text('October - March')),
              ]),
              DataRow(cells: [
                DataCell(Text('Potato')),
                DataCell(
                    Text('Needs well-drained soil, plant in early spring')),
                DataCell(Text('March - April')),
              ]),
              DataRow(cells: [
                DataCell(Text('Onion')),
                DataCell(
                    Text('Prefers sunny locations, plant in early spring')),
                DataCell(Text('March - April')),
              ]),
              DataRow(cells: [
                DataCell(Text('Garlic')),
                DataCell(
                    Text('Requires well-drained soil, plant in late fall')),
                DataCell(Text('October - November')),
              ]),
              DataRow(cells: [
                DataCell(Text('Spinach')),
                DataCell(Text(
                    'Prefers cool weather, plant in early spring or fall')),
                DataCell(Text('March - May, August - September')),
              ]),
              DataRow(cells: [
                DataCell(Text('Cucumber')),
                DataCell(Text('Needs warm temperatures, plant after frost')),
                DataCell(Text('April - May')),
              ]),
              DataRow(cells: [
                DataCell(Text('Lettuce')),
                DataCell(Text(
                    'Prefers cool weather, plant in early spring or fall')),
                DataCell(Text('March - May, August - September')),
              ]),
              DataRow(cells: [
                DataCell(Text('Pumpkin')),
                DataCell(Text('Requires full sun, plant in late spring')),
                DataCell(Text('May - June')),
              ]),
              DataRow(cells: [
                DataCell(Text('Beetroot')),
                DataCell(
                    Text('Needs well-drained soil, plant in early spring')),
                DataCell(Text('March - April')),
              ]),
              DataRow(cells: [
                DataCell(Text('Cauliflower')),
                DataCell(Text(
                    'Requires cool weather, plant in early spring or fall')),
                DataCell(Text('March - May, August - September')),
              ]),
              DataRow(cells: [
                DataCell(Text('Bell Pepper')),
                DataCell(Text('Needs warm temperatures, plant after frost')),
                DataCell(Text('April - May')),
              ]),
              DataRow(cells: [
                DataCell(Text('Cabbage')),
                DataCell(Text(
                    'Prefers cool weather, plant in early spring or fall')),
                DataCell(Text('March - May, August - September')),
              ]),
              DataRow(cells: [
                DataCell(Text('Chilli')),
                DataCell(Text('Requires warm temperatures, plant after frost')),
                DataCell(Text('April - May')),
              ]),
              DataRow(cells: [
                DataCell(Text('Radish')),
                DataCell(Text('Grows quickly, plant in early spring or fall')),
                DataCell(Text('March - April, August - September')),
              ]),
              DataRow(cells: [
                DataCell(Text('Mango')),
                DataCell(
                    Text('Thrives in tropical climates, plant year-round')),
                DataCell(Text('Anytime')),
              ]),
              DataRow(cells: [
                DataCell(Text('Pineapple')),
                DataCell(Text('Requires tropical climate, plant year-round')),
                DataCell(Text('Anytime')),
              ]),
              DataRow(cells: [
                DataCell(Text('Strawberry')),
                DataCell(Text('Prefers cool weather, plant in early spring')),
                DataCell(Text('March - April')),
              ]),
              DataRow(cells: [
                DataCell(Text('Pear')),
                DataCell(
                    Text('Needs cool temperatures, plant in early spring')),
                DataCell(Text('March - April')),
              ]),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfitabilityEstimationsSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profitability Estimations'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: DataTable(
            columns: [
              DataColumn(
                  label: Text('Crop',
                      style: TextStyle(fontWeight: FontWeight.bold))),
              DataColumn(
                  label: Text('Estimated Cost (INR)',
                      style: TextStyle(fontWeight: FontWeight.bold))),
              DataColumn(
                  label: Text('Estimated Profit (INR)',
                      style: TextStyle(fontWeight: FontWeight.bold))),
            ],
            rows: [
              DataRow(cells: [
                DataCell(Text('Apple')),
                DataCell(Text('₹1,200')),
                DataCell(Text('₹3,000')),
              ]),
              DataRow(cells: [
                DataCell(Text('Banana')),
                DataCell(Text('₹1,000')),
                DataCell(Text('₹2,500')),
              ]),
              DataRow(cells: [
                DataCell(Text('Carrot')),
                DataCell(Text('₹600')),
                DataCell(Text('₹1,800')),
              ]),
              DataRow(cells: [
                DataCell(Text('Tomato')),
                DataCell(Text('₹800')),
                DataCell(Text('₹2,000')),
              ]),
              DataRow(cells: [
                DataCell(Text('Broccoli')),
                DataCell(Text('₹1,000')),
                DataCell(Text('₹2,200')),
              ]),
              DataRow(cells: [
                DataCell(Text('Grapes')),
                DataCell(Text('₹2,000')),
                DataCell(Text('₹4,000')),
              ]),
              DataRow(cells: [
                DataCell(Text('Sugarcane')),
                DataCell(Text('₹2,500')),
                DataCell(Text('₹5,500')),
              ]),
              DataRow(cells: [
                DataCell(Text('Potato')),
                DataCell(Text('₹800')),
                DataCell(Text('₹2,200')),
              ]),
              DataRow(cells: [
                DataCell(Text('Onion')),
                DataCell(Text('₹700')),
                DataCell(Text('₹1,800')),
              ]),
              DataRow(cells: [
                DataCell(Text('Garlic')),
                DataCell(Text('₹1,000')),
                DataCell(Text('₹2,500')),
              ]),
              DataRow(cells: [
                DataCell(Text('Spinach')),
                DataCell(Text('₹500')),
                DataCell(Text('₹1,400')),
              ]),
              DataRow(cells: [
                DataCell(Text('Cucumber')),
                DataCell(Text('₹600')),
                DataCell(Text('₹1,800')),
              ]),
              DataRow(cells: [
                DataCell(Text('Lettuce')),
                DataCell(Text('₹700')),
                DataCell(Text('₹1,900')),
              ]),
              DataRow(cells: [
                DataCell(Text('Pumpkin')),
                DataCell(Text('₹1,000')),
                DataCell(Text('₹2,400')),
              ]),
              DataRow(cells: [
                DataCell(Text('Beetroot')),
                DataCell(Text('₹800')),
                DataCell(Text('₹2,000')),
              ]),
              DataRow(cells: [
                DataCell(Text('Cauliflower')),
                DataCell(Text('₹1,200')),
                DataCell(Text('₹2,800')),
              ]),
              DataRow(cells: [
                DataCell(Text('Bell Pepper')),
                DataCell(Text('₹1,500')),
                DataCell(Text('₹3,500')),
              ]),
              DataRow(cells: [
                DataCell(Text('Cabbage')),
                DataCell(Text('₹900')),
                DataCell(Text('₹2,100')),
              ]),
              DataRow(cells: [
                DataCell(Text('Chilli')),
                DataCell(Text('₹1,200')),
                DataCell(Text('₹3,000')),
              ]),
              DataRow(cells: [
                DataCell(Text('Radish')),
                DataCell(Text('₹600')),
                DataCell(Text('₹1,700')),
              ]),
              DataRow(cells: [
                DataCell(Text('Mango')),
                DataCell(Text('₹2,500')),
                DataCell(Text('₹5,000')),
              ]),
              DataRow(cells: [
                DataCell(Text('Pineapple')),
                DataCell(Text('₹2,000')),
                DataCell(Text('₹4,500')),
              ]),
              DataRow(cells: [
                DataCell(Text('Strawberry')),
                DataCell(Text('₹2,200')),
                DataCell(Text('₹4,800')),
              ]),
              DataRow(cells: [
                DataCell(Text('Pear')),
                DataCell(Text('₹1,800')),
                DataCell(Text('₹4,000')),
              ]),
            ],
          ),
        ),
      ),
    );
  }
}

class MarketAlertsSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Market Alerts'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Market Alerts',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            ListView(
              shrinkWrap: true,
              children: [
                ListTile(
                  title: Text('Apple prices are expected to rise next week.'),
                  subtitle: Text('Alert: 01/09/2024'),
                ),
                ListTile(
                  title:
                      Text('Banana market has stabilized with steady demand.'),
                  subtitle: Text('Alert: 02/09/2024'),
                ),
                ListTile(
                  title: Text('Broccoli prices drop due to oversupply.'),
                  subtitle: Text('Alert: 03/09/2024'),
                ),
                ListTile(
                  title:
                      Text('Pear prices expected to rise due to high demand.'),
                  subtitle: Text('Alert: 04/09/2024'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class FooterSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.teal,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          '©️ 2024 Agriculture Insights. All rights reserved.',
          style: TextStyle(color: Colors.white, fontSize: 14),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

pubspec.yaml:
name: farmer_education
description: A new Flutter project.

version: 1.0.0+1

environment:
  sdk: ">=3.0.0 <4.0.0"

dependencies:
  flutter:
    sdk: flutter
  url_launcher: ^6.0.0

dev_dependencies:
  flutter_test:
    sdk: flutter
  flutter_lints: ^2.0.2

flutter:
  uses-material-design: true
  # assets:
  #  - images/a_dot_burr.jpeg
  #  - images/a_dot_ham.jpeg
  # fonts:
  #   - family: Schyler
  #     fonts:
  #       - asset: fonts/Schyler-Regular.ttf
  #       - asset: fonts/Schyler-Italic.ttf
  #         style: italic
  #   - family: Trajan Pro
  #     fonts:
  #       - asset: fonts/TrajanPro.ttf
  #       - asset: fonts/TrajanPro_Bold.ttf
  #         weight: 700

   
