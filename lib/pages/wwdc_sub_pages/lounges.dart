import 'package:flutter/cupertino.dart';

class DigitalLounges extends StatelessWidget {
  const DigitalLounges({Key? key}) : super(key: key);

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
          )),
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 50),
                const Center(
                  child: Icon(CupertinoIcons.lightbulb,
                      size: 100, color: CupertinoColors.white),
                ),
                const SizedBox(height: 20),
                Center(
                  child: Text('Digital Lounges',
                      textAlign: TextAlign.center,
                      style: CupertinoTheme.of(context)
                          .textTheme
                          .navLargeTitleTextStyle
                          .copyWith(
                              fontWeight: FontWeight.bold,
                              color: CupertinoColors.white)),
                ),
                const SizedBox(height: 20),
                Text(
                    'Join Apple engineers and designers throughout the week as they host text-based Q&As, session watch parties with the presenter, community icebreakers, and more.',
                    textAlign: TextAlign.center,
                    style: CupertinoTheme.of(context)
                        .textTheme
                        .textStyle
                        .copyWith(color: CupertinoColors.white)),
                const SizedBox(height: 20),
                const Center(
                  child: CupertinoButton.filled(
                      onPressed: null,
                      disabledColor: CupertinoColors.inactiveGray,
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      child: Text('Registrations opens May 31')),
                ),
                const SizedBox(height: 30),
                Text('Eligibility',
                    style: CupertinoTheme.of(context)
                        .textTheme
                        .navTitleTextStyle
                        .copyWith(
                            fontWeight: FontWeight.bold,
                            color: CupertinoColors.white)),
                const SizedBox(height: 10),
                Text(
                    'You can submit an appointment request if you’re a current member of the Apple Developer Program or the Apple Developer Enterprise Program, or a 2022 Swift Student Challenge winner.',
                    textAlign: TextAlign.justify,
                    style: CupertinoTheme.of(context)
                        .textTheme
                        .textStyle
                        .copyWith(color: CupertinoColors.white)),
                const SizedBox(height: 20),
                Text('Registration',
                    style: CupertinoTheme.of(context)
                        .textTheme
                        .navTitleTextStyle
                        .copyWith(
                            fontWeight: FontWeight.bold,
                            color: CupertinoColors.white)),
                const SizedBox(height: 10),
                Text(
                    'Register for Digital Lounges here or in the Apple Developer app. Make sure to register the week of May 31, so that you’ll be ready once lounges open on June 7.\n\nSign in with your Apple ID, choose one or more topics, enter your information, and submit. Once your registration is processed for the first time, you’ll receive an email with details on participating in the lounges. You can register for more lounges at any time.',
                    textAlign: TextAlign.justify,
                    style: CupertinoTheme.of(context)
                        .textTheme
                        .textStyle
                        .copyWith(color: CupertinoColors.white)),
                const SizedBox(height: 30),
                Text(
                  'All labs will be conducted in English.',
                  style: CupertinoTheme.of(context).textTheme.tabLabelTextStyle,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
