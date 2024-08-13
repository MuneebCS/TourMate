import 'package:flutter/material.dart';
import 'package:tourmate/widgets/custom_button.dart';
import 'package:tourmate/widgets/service.dart';

class TermsOfServices extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Padding(
        padding:
            const EdgeInsets.only(left: 30, right: 30, bottom: 30, top: 50),
        child: Container(
          width: screenWidth,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CustomButton(
                    c_height: 60,
                    c_width: 65,
                    col: Theme.of(context).cardColor,
                    onPress: () {},
                    child: Icon(
                      Icons.rule_sharp,
                      size: 28,
                      color: Theme.of(context).hintColor,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Terms of Service",
                        style: Theme.of(context)
                            .textTheme
                            .displayLarge
                            ?.copyWith(
                                fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Last updated July 2019",
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
              const SizedBox(height: 70),
              Divider(
                color: Theme.of(context).cardColor,
              ),
              const Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Service(
                        count: "1.",
                        head: "YOUR AGREEMENT",
                        desc:
                            "By using this Site, you agree to be bound by, and to comply with, these Terms and Conditions. If you do not agree to these Terms and Conditions, please do not use this site.\n\n"
                            "PLEASE NOTE: We reserve the right, at our sole discretion, to change, modify or otherwise alter these Terms and Conditions at any time. Unless otherwise indicated, amendments will become effective immediately. Please review these Terms and Conditions periodically. Your continued use of the Site following the posting of changes and/or modifications will itute your acceptance of the revised Terms and Conditions and the reasonableness of these standards for notice of changes. For your information, this page was last updated as of the date at the top of these terms and conditions.",
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Service(
                        count: "2.",
                        head: "PRIVACY",
                        desc:
                            "Please review our Privacy Policy, which also governs your visit to this Site, to understand our practices.",
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Service(
                        count: "3.",
                        head: "COMMUNICATIONS",
                        desc:
                            "When you visit this Site or send emails to us, you are communicating with us electronically. You consent to receive communications from us electronically. We will communicate with you by email or by posting notices on this Site. You agree that all agreements, notices, disclosures, and other communications that we provide to you electronically satisfy any legal requirement that such communications be in writing.",
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      const Service(
                        count: "4.",
                        head: "COPYRIGHT",
                        desc:
                            "All content included on this Site, such as text, graphics, logos, button icons, images, audio clips, digital downloads, data compilations, and software, is the property of this Site or its content suppliers and protected by international copyright laws. The compilation of all content on this Site is the exclusive property of this Site, with copyright authorship for this collection by this Site, and protected by international copyright laws.",
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Service(
                        count: "5.",
                        head: "TRADEMARKS",
                        desc:
                            "This Site's trademarks and trade dress may not be used in connection with any product or service that is not this Site's, in any manner that is likely to cause confusion among customers, or in any manner that disparages or discredits this Site. All other trademarks not owned by this Site or its subsidiaries that appear on this Site are the property of their respective owners, who may or may not be affiliated with, connected to, or sponsored by this Site or its subsidiaries.",
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
