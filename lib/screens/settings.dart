import 'package:flutter/material.dart';
import 'package:tourmate/screens/booking_list.dart';
import 'package:tourmate/widgets/custom_button.dart';

import '../widgets/setting.dart';
import 'login.dart';

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Padding(
        padding: const EdgeInsets.only(left: 30, right: 30, top: 50),
        child: Container(
          width: screenWidth,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CustomButton(
                    C_height: 65,
                    C_width: 70,
                    Col: Theme.of(context).cardColor,
                    onPress: () {},
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        height: 65,
                        width: 70,
                        'assets/images/splash2.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Evelyn",
                        style: Theme.of(context)
                            .textTheme
                            .displayLarge
                            ?.copyWith(
                                fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Jakarta Indonesia",
                        style: Theme.of(context)
                            .textTheme
                            .displayMedium
                            ?.copyWith(
                                fontSize: 12, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Setting(
                        customButton: CustomButton(
                            Col: Colors.transparent,
                            C_height: 50,
                            C_width: 50,
                            onPress: () {},
                            child: Icon(
                              Icons.arrow_forward_ios_sharp,
                              color: Theme.of(context).cardColor,
                            )),
                        settingName: "Your Profile",
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 2, right: 2),
                        child: Divider(
                            thickness: 1, color: Theme.of(context).cardColor),
                      ),
                      Setting(
                        customButton: CustomButton(
                            Col: Colors.transparent,
                            C_height: 50,
                            C_width: 50,
                            onPress: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => BookingList(),
                                  ));
                            },
                            child: Icon(
                              Icons.arrow_forward_ios_sharp,
                              color: Theme.of(context).cardColor,
                            )),
                        settingName: "Booking List",
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 2, right: 2),
                        child: Divider(
                            thickness: 1, color: Theme.of(context).cardColor),
                      ),
                      Setting(
                        customButton: CustomButton(
                            Col: Colors.transparent,
                            C_height: 50,
                            C_width: 50,
                            onPress: () {},
                            child: Icon(
                              Icons.arrow_forward_ios_sharp,
                              color: Theme.of(context).cardColor,
                            )),
                        settingName: "Promotion",
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 2, right: 2),
                        child: Divider(
                            thickness: 1, color: Theme.of(context).cardColor),
                      ),
                      Setting(
                        customButton: CustomButton(
                            Col: Colors.transparent,
                            C_height: 50,
                            C_width: 50,
                            onPress: () {},
                            child: Icon(
                              Icons.arrow_forward_ios_sharp,
                              color: Theme.of(context).cardColor,
                            )),
                        settingName: "Payment",
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 2, right: 2),
                        child: Divider(
                            thickness: 1, color: Theme.of(context).cardColor),
                      ),
                      Setting(
                        customButton: CustomButton(
                            Col: Colors.transparent,
                            C_height: 50,
                            C_width: 50,
                            onPress: () {},
                            child: Icon(
                              Icons.arrow_forward_ios_sharp,
                              color: Theme.of(context).cardColor,
                            )),
                        settingName: "Settings",
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 2, right: 2),
                        child: Divider(
                            thickness: 1, color: Theme.of(context).cardColor),
                      ),
                      Setting(
                        customButton: CustomButton(
                            Col: Colors.transparent,
                            C_height: 50,
                            C_width: 50,
                            onPress: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Login(),
                                  ));
                            },
                            child: Icon(
                              Icons.arrow_forward_ios_sharp,
                              color: Theme.of(context).cardColor,
                            )),
                        settingName: "Logout",
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
