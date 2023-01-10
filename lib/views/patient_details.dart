import 'package:doctor_app/models/cubit_models/getAllPatient.dart';
import 'package:flutter/material.dart';

import '../src/app_colors.dart';


class PatientDetailsScreen extends StatelessWidget {

  final Patients patients;


  PatientDetailsScreen({required this.patients});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.KGreenColor,
        title: Center(
          child: Text(
            'Patient Details',
            style: TextStyle(
                fontSize: 30
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          CircleAvatar(
              radius: 75,
              backgroundImage:
              NetworkImage('https://img.freepik.com/free-photo/waist-up-portrait-handsome-serious-unshaven-male-keeps-hands-together-dressed-dark-blue-shirt-has-talk-with-interlocutor-stands-against-white-wall-self-confident-man-freelancer_273609-16320.jpg')
          ),
          Text(patients.name!,
            style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.black

            ),
          ),
          SizedBox(
            height: 40,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Material(
              elevation: 15,
              borderRadius: BorderRadius.circular(20),
              child: Container(
                height: 300,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20)
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(

                    children: [

                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(patients.diagnosis!,
                          style: TextStyle(
                              fontSize: 20,
                              color: AppColors.KGreenColor
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.alarm),
                            Text(patients.visitTime!,
                              style: TextStyle(
                                  fontSize: 20
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Address:  ',
                              style: TextStyle(
                                  fontSize: 20
                              ),
                            ),
                            Text(patients.address!,
                              style: TextStyle(
                                  fontSize: 20
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Date of Birth:',style: TextStyle(
                                fontSize: 20
                            ),),
                            Text(patients.dateOfBirth!,
                              style: TextStyle(
                                  fontSize: 20
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text('Notes: ....................................................................................................................................................................................................',
                        style: TextStyle(
                            fontSize: 22
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          )

        ],
      ),
    );
  }
}
