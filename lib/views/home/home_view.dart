import 'package:flutter/material.dart';
import 'package:the_basics/widgets/centered_view/centered_view.dart';
import 'package:the_basics/widgets/navigation_bar/navigation_bar.dart' as NavBar;

import '../../widgets/sample_chart/vertical_bar.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  String dropdownValue = 'Kiipeilyareena Kalasatama';
  final List<bool> isSelected = List.generate(7, (_) => false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CenteredView(
        child: Column(
          children: <Widget>[
            // NavBar.NavigationBar(),
            Expanded(
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.start,
                // crossAxisAlignment: CrossAxisAlignment.stretch,// Column(
                children: <Widget>[
                  // CourseDetails(),
                  // Expanded(
                  //   child: Center(
                  //     child: CallToAction('Join Course'),
                  // ),
                  // ),
                  DropdownButton<String>(
                    value: dropdownValue,
                   style: TextStyle(fontSize: 12),
                    // icon: const Icon(Icons.arrow_downward),
                    elevation: 16,
                    // style: const TextStyle(color: Colors.deepPurple),
                    // underline: Container(
                    //   height: 2,
                    // color: Colors.deepPurpleAccent,
                    // ),
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownValue = newValue!;
                      });
                    },
                    items: <String>['Kiipeilyareena Kalasatama', 'Kiipeilyareena Salmisaari', 'Kiipeilyareena Tammisto']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                  SizedBox(height: 16),
                  ToggleButtons(
                    children: <Widget>[
                      Text('Mon', style: TextStyle(fontSize: 12),),
                      Text('Tue', style: TextStyle(fontSize: 12),),
                      Text('Wed', style: TextStyle(fontSize: 12),),
                      Text('Thu', style: TextStyle(fontSize: 12),),
                      Text('Fri', style: TextStyle(fontSize: 12),),
                      Text('Sat', style: TextStyle(fontSize: 12),),
                      Text('Sun', style: TextStyle(fontSize: 12),),
                    ],
                    onPressed: (int index) {
                      setState(() {
                        for (int buttonIndex = 0; buttonIndex < isSelected.length; buttonIndex++) {
                          if (buttonIndex == index) {
                            isSelected[buttonIndex] = !isSelected[buttonIndex];
                          } else {
                            isSelected[buttonIndex] = false;
                          }
                        }
                      });
                    },
                    isSelected: isSelected,
                  ),

                  SizedBox(height: 16),
                  // SizedBox(height: 700.0, child: BarChartSample1()),
                  // SizedBox(height: 300.0, child: TimeSeriesBar.withSampleData()),
                  SizedBox(height: 200.0, child: VerticalBarLabelChart.withSampleData()),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
