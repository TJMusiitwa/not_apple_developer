import 'package:flutter/cupertino.dart';

class DeveloperLabs extends StatelessWidget {
  const DeveloperLabs({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: CupertinoColors.black,
      child: SafeArea(
        top: false,
        child: DecoratedBox(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color.fromRGBO(4, 11, 22, 1), CupertinoColors.black],
              stops: [0.2, 1.0],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 50),
                const Center(
                  child: Icon(
                    CupertinoIcons.person,
                    size: 100,
                    color: CupertinoColors.white,
                  ),
                ),
                const SizedBox(height: 20),
                Center(
                  child: Text(
                    '1-on-1 Developer Labs',
                    textAlign: TextAlign.center,
                    style: CupertinoTheme.of(context)
                        .textTheme
                        .navLargeTitleTextStyle
                        .copyWith(
                          fontWeight: FontWeight.bold,
                          color: CupertinoColors.white,
                        ),
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  'Throughout the week of the conference, you can request an appointment with an Apple engineer, designer, or other expert for one-on-one guidance. Get answers to your questions about implementing, optimizing, or debugging technologies you’re using in your app. Learn about the latest design principles, best practices, and design patterns. Find support for making the most of your presence on the App Store, and much more.',
                  textAlign: TextAlign.center,
                  style: CupertinoTheme.of(
                    context,
                  ).textTheme.textStyle.copyWith(color: CupertinoColors.white),
                ),
                const SizedBox(height: 20),
                const Center(
                  child: CupertinoButton.filled(
                    onPressed: null,
                    disabledColor: CupertinoColors.inactiveGray,
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    child: Text('Requests open June 6'),
                  ),
                ),
                const SizedBox(height: 30),
                Text(
                  'Eligibility',
                  style: CupertinoTheme.of(context).textTheme.navTitleTextStyle
                      .copyWith(
                        fontWeight: FontWeight.bold,
                        color: CupertinoColors.white,
                      ),
                ),
                const SizedBox(height: 10),
                Text(
                  'You can submit an appointment request if you’re a current member of the Apple Developer Program or the Apple Developer Enterprise Program, or a 2022 Swift Student Challenge winner.',
                  textAlign: TextAlign.justify,
                  style: CupertinoTheme.of(
                    context,
                  ).textTheme.textStyle.copyWith(color: CupertinoColors.white),
                ),
                const SizedBox(height: 20),
                Text(
                  'Dates and times',
                  style: CupertinoTheme.of(context).textTheme.navTitleTextStyle
                      .copyWith(
                        fontWeight: FontWeight.bold,
                        color: CupertinoColors.white,
                      ),
                ),
                const SizedBox(height: 10),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Technology, App Review, and App Store labs: ',
                        style: CupertinoTheme.of(context).textTheme.textStyle
                            .copyWith(
                              color: CupertinoColors.white,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      TextSpan(
                        text:
                            'Requests are accepted starting June 6 after the keynote until 6:00 p.m. PT the day before the lab starts.\n\n',
                        style: CupertinoTheme.of(context).textTheme.textStyle
                            .copyWith(color: CupertinoColors.white),
                      ),
                      TextSpan(
                        text: 'Design labs: ',
                        style: CupertinoTheme.of(context).textTheme.textStyle
                            .copyWith(
                              color: CupertinoColors.white,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      TextSpan(
                        text:
                            'Requests are accepted starting June 6 after the keynote until 6:00 p.m. PT for Tuesday’s labs. For the rest of the week, requests are accepted 6:00 a.m. to 6:00 p.m. PT the day before the lab starts.',
                        style: CupertinoTheme.of(context).textTheme.textStyle
                            .copyWith(color: CupertinoColors.white),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  'Submission',
                  style: CupertinoTheme.of(context).textTheme.navTitleTextStyle
                      .copyWith(
                        fontWeight: FontWeight.bold,
                        color: CupertinoColors.white,
                      ),
                ),
                const SizedBox(height: 10),
                Text(
                  'You can submit your request here or in the Apple Developer app. Sign in with your Apple ID, choose a lab from the schedule, and enter your information. If you’ve filed a related report using Feedback Assistant, include the Feedback Assistant ID in your submission.\n\nSince availability is limited, requests will be reviewed and you’ll receive an email with your status at 10:00 p.m. PT the night before your lab.',
                  textAlign: TextAlign.justify,
                  style: CupertinoTheme.of(
                    context,
                  ).textTheme.textStyle.copyWith(color: CupertinoColors.white),
                ),
                const SizedBox(height: 30),
                Text(
                  'All labs will be conducted in English.',
                  style: CupertinoTheme.of(context).textTheme.tabLabelTextStyle,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
