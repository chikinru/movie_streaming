import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../screens/ranking.dart';
import '../screens/thisseason.dart';
import '../screens/upcoming.dart';

class SeeAll extends StatelessWidget {
  int caseSee;
  SeeAll({required this.caseSee});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: (caseSee == 0)
            ? Center(child: Text('Ranking'))
            : (caseSee == 1)
                ? Center(child: Text('This season'))
                : Center(child: Text('Upcoming')),
      ),
      body: (caseSee == 0)
          ? Ranking()
          : (caseSee == 1)
              ? ThisSeason()
              : UpComing(),
    );
  }
}
