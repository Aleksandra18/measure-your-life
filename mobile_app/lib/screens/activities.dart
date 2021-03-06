import 'package:flutter/material.dart';
import 'package:measure_your_life_app/models/user.dart';
import 'package:measure_your_life_app/providers/activities_provider.dart';
import 'package:measure_your_life_app/widgets/activity_card.dart';
import 'package:measure_your_life_app/widgets/new_activity_view.dart';
import 'package:provider/provider.dart';

class ActivitiesPage extends StatefulWidget {
  final User user;

  ActivitiesPage({Key key, this.user}) : super(key: key);

  @override
  _ActivitiesPageState createState() => _ActivitiesPageState();
}

class _ActivitiesPageState extends State<ActivitiesPage> {
  @override
  Widget build(BuildContext context) {
    final activitiesProvider = Provider.of<ActivitiesProvider>(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height * 0.25,
              child: Stack(
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.23,
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(40.0),
                        bottomRight: Radius.circular(40.0),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        RaisedButton(
                          onPressed: () {
                            return showModalBottomSheet(
                              context: context,
                              isScrollControlled: true,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              builder: (BuildContext context) {
                                return NewActivityView();
                              },
                            );
                          },
                          color: Colors.white,
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.35,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Icon(
                                  Icons.add,
                                  size: 24,
                                ),
                                Text(
                                  'Add activity',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          elevation: 4.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                        ),
                        RaisedButton(
                          onPressed: () {
                            return showModalBottomSheet(
                              context: context,
                              isScrollControlled: true,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              builder: (BuildContext context) {
                                return NewActivityView();
                              },
                            );
                          },
                          color: Colors.white,
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.35,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Icon(
                                  Icons.assessment,
                                  size: 24,
                                ),
                                Text(
                                  'Summary',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18.0,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          elevation: 4.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              height: 600,
              child: activitiesProvider.isFetching
                  ? CircularProgressIndicator()
                  : ListView.builder(
                      itemCount: activitiesProvider.getActivites.length,
                      itemBuilder: (context, index) {
                        return ActivityCard(
                          activitiesProvider.getActivites[index],
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
