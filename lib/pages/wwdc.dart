import 'package:add_2_calendar/add_2_calendar.dart';
import 'package:flutter/cupertino.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:not_apple_developer/pages/wwdc_sub_pages/developer_labs.dart';
import 'package:not_apple_developer/pages/wwdc_sub_pages/lounges.dart';

class WWDCPage extends StatelessWidget {
  const WWDCPage({super.key});

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      headerSliverBuilder: (context, innerBoxIsScrolled) {
        return <Widget>[
          const CupertinoSliverNavigationBar(
            largeTitle:
                Text('WWDC', style: TextStyle(color: CupertinoColors.white)),
            backgroundColor: CupertinoColors.black,
          ),
        ];
      },
      body: SafeArea(
        top: false,
        child: SingleChildScrollView(
          child: DecoratedBox(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
              colors: [Color.fromRGBO(4, 11, 22, 1), CupertinoColors.black],
              stops: [0.1, 1.0],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            )),
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.4,
                  width: double.infinity,
                  child: Image.asset(
                    'assets/wwdc22.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
                Text(
                  'Swiftly approaching.',
                  style: CupertinoTheme.of(context)
                      .textTheme
                      .dateTimePickerTextStyle
                      .copyWith(
                          color: CupertinoColors.white,
                          fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                const Text(
                    'Join developers worldwide from June 6 to 10 for an inspiring week of technology and community.\n\nGet a first look at Apple’s latest platforms and technologies in sessions, explore the newest tools and tips, and connect with Apple experts in labs and digital lounges.\n\nAll online and at no cost.',
                    textAlign: TextAlign.center,
                    style:
                        TextStyle(fontSize: 18, color: CupertinoColors.white)),
                const SizedBox(height: 30),
                Text('Watch the Keynote and Platforms State of the Union',
                    style: CupertinoTheme.of(context)
                        .textTheme
                        .navTitleTextStyle
                        .copyWith(
                            color: CupertinoColors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 25)),
                const SizedBox(height: 10),
                Text(
                    'The Apple Worldwide Developers Conference kicks off with exciting reveals, inspiration, and new opportunities. Join the worldwide developer community for an in-depth look at the future of Apple platforms, directly from Apple Park.',
                    style: CupertinoTheme.of(context)
                        .textTheme
                        .textStyle
                        .copyWith(color: CupertinoColors.white)),
                const SizedBox(height: 10),
                CupertinoListTile.notched(
                    title: Text('Apple Keynote',
                        style: CupertinoTheme.of(context)
                            .textTheme
                            .textStyle
                            .copyWith(color: CupertinoColors.white)),
                    subtitle: Text('June 6, 10 a.m. PT',
                        style: CupertinoTheme.of(context)
                            .textTheme
                            .textStyle
                            .copyWith(color: CupertinoColors.systemGrey)),
                    trailing: GestureDetector(
                      child: const Icon(CupertinoIcons.calendar_badge_plus),
                      onTap: () async {
                        final Event event = Event(
                          title: 'Apple Keynote',
                          startDate:
                              DateTime.parse('2022-06-06T10:00:00-07:00'),
                          endDate: DateTime.parse('2022-06-06T12:30:00-07:00'),
                          description:
                              'The Apple Worldwide Developers Conference kicks off with exciting reveals, inspiration, and new opportunities. Join the worldwide developer community for an in-depth look at the future of Apple platforms, directly from Apple Park.',
                          location: 'Apple Park',
                          iosParams:
                              const IOSParams(reminder: Duration(minutes: 30)),
                        );
                        await Add2Calendar.addEvent2Cal(event);
                      },
                    )),
                const SizedBox(height: 10),
                CupertinoListTile.notched(
                    title: Text('Platforms State of the Union',
                        style: CupertinoTheme.of(context)
                            .textTheme
                            .textStyle
                            .copyWith(color: CupertinoColors.white)),
                    subtitle: Text('June 6, 1 p.m. PT',
                        style: CupertinoTheme.of(context)
                            .textTheme
                            .textStyle
                            .copyWith(color: CupertinoColors.systemGrey)),
                    trailing: GestureDetector(
                        onTap: () async {
                          final Event event = Event(
                            title: 'Platforms State of the Union',
                            startDate:
                                DateTime.parse('2022-06-06T13:00:00-07:00'),
                            endDate:
                                DateTime.parse('2022-06-06T14:30:00-07:00'),
                            description:
                                'Take a deeper dive into the new tools, technologies, and advances across Apple platforms that will help you create even better apps.',
                            location: 'Apple Park',
                            iosParams: const IOSParams(
                                reminder: Duration(minutes: 30)),
                          );
                          await Add2Calendar.addEvent2Cal(event);
                        },
                        child: const Icon(CupertinoIcons.calendar_badge_plus))),
                CupertinoListTile.notched(
                  leading: const Icon(CupertinoIcons.person,
                      color: CupertinoColors.white),
                  title: Text('1-on-1 Developer Labs',
                      style: CupertinoTheme.of(context)
                          .textTheme
                          .textStyle
                          .copyWith(color: CupertinoColors.white)),
                  trailing: const CupertinoListTileChevron(),
                  onTap: () => showCupertinoModalBottomSheet(
                    context: context,
                    builder: (_) => const DeveloperLabs(),
                    expand: true,
                    useRootNavigator: true,
                    backgroundColor: CupertinoColors.white,
                    transitionBackgroundColor:
                        const Color.fromRGBO(4, 11, 22, 1),
                  ),
                ),
                CupertinoListTile.notched(
                  leading: const Icon(CupertinoIcons.lightbulb,
                      color: CupertinoColors.white),
                  title: Text('Digital Lounges',
                      style: CupertinoTheme.of(context)
                          .textTheme
                          .textStyle
                          .copyWith(color: CupertinoColors.white)),
                  trailing: const CupertinoListTileChevron(),
                  onTap: () => showCupertinoModalBottomSheet(
                    context: context,
                    builder: (_) => const DigitalLounges(),
                    expand: true,
                    useRootNavigator: true,
                    backgroundColor: CupertinoColors.white,
                    transitionBackgroundColor:
                        const Color.fromRGBO(4, 11, 22, 1),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
