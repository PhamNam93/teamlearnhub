import 'package:LearnHub/utils/Utils.dart';
import 'package:flutter/material.dart';

import 'meeting_screen.dart';

class JoinWidget extends StatefulWidget {
  @override
  _JoinWidgetState createState() => _JoinWidgetState();
}

class _JoinWidgetState extends State<JoinWidget> {
  TextEditingController meetingIdController = TextEditingController();
  TextEditingController meetingPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // new page needs scaffolding!
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Join meeting'),
      ),
      body: Container(
        child: Container(
          padding: const EdgeInsets.symmetric(
            vertical: 8.0,
            horizontal: 32.0,
          ),
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width / 1.2,
                height: 55,
                margin: EdgeInsets.only(top: 32),
                padding:
                    EdgeInsets.only(top: 4, left: 16, right: 16, bottom: 4),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                    color: HexColor.fromHex('#F5F6F9'),
                    boxShadow: [
                      BoxShadow(color: Colors.black12, blurRadius: 5)
                    ]),
                child: TextFormField(
                  controller: meetingIdController,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Meeting ID',
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width / 1.2,
                height: 55,
                margin: EdgeInsets.only(top: 32),
                padding:
                    EdgeInsets.only(top: 4, left: 16, right: 16, bottom: 4),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                    color: HexColor.fromHex('#F5F6F9'),
                    boxShadow: [
                      BoxShadow(color: Colors.black12, blurRadius: 5)
                    ]),
                child: TextFormField(
                  controller: meetingPasswordController,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Password',
                  ),
                ),
              ),
              SizedBox(height: 50.0),
              InkWell(
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    joinMeeting(context);
                  }));
                },
                child: new Container(
                  height: 50,
                  width: MediaQuery.of(context).size.width / 2,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          HexColor.fromHex('#FAA244'),
                          HexColor.fromHex('#FF8400')
                        ],
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(0))),
                  child: Center(
                    child: Text(
                      'Vào học'.toUpperCase(),
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              )
              // Padding(
              //   padding: const EdgeInsets.all(16.0),
              //   child: Builder(
              //     builder: (context) {
              //       // The basic Material Design action button.
              //       return ElevatedButton(
              //         style: ElevatedButton.styleFrom(
              //           primary: Colors.blue, // background
              //           onPrimary: Colors.white, // foreground
              //         ),
              //         onPressed: () => startMeeting(context),
              //         child: Text('Start Meeting'),
              //       );
              //     },
              //   ),
              // ),
              // Padding(
              //   padding: const EdgeInsets.all(16.0),
              //   child: Builder(
              //     builder: (context) {
              //       // The basic Material Design action button.
              //       return ElevatedButton(
              //         style: ElevatedButton.styleFrom(
              //           primary: Colors.blue, // background
              //           onPrimary: Colors.white, // foreground
              //         ),
              //         onPressed: () => scheduleMeeting(context),
              //         child: Text('Schedule'),
              //       );
              //     },
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }

  joinMeeting(BuildContext context) {
    if (meetingIdController.text.isNotEmpty &&
        meetingPasswordController.text.isNotEmpty) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) {
            return MeetingWidget(
                meetingId: meetingIdController.text,
                meetingPassword: meetingPasswordController.text);
          },
        ),
      );
    } else {
      if (meetingIdController.text.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("Enter a valid meeting id to continue."),
        ));
      } else if (meetingPasswordController.text.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("Enter a meeting password to start."),
        ));
      }
    }
  }

// startMeeting(BuildContext context) {
//   Navigator.of(context).push(
//     MaterialPageRoute(
//       builder: (context) {
//         return StartMeetingWidget(meetingId: meetingIdController.text);
//       },
//     ),
//   );
// }

// scheduleMeeting(BuildContext context) {
//   Navigator.of(context).push(
//     MaterialPageRoute(
//       builder: (context) {
//         return ScheduleMeeting(meetingId: meetingIdController.text);
//       },
//     ),
//   );
// }
}
