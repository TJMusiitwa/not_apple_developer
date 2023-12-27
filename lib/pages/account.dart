import 'package:flutter/cupertino.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return NestedScrollView(
      headerSliverBuilder: (context, innerBoxIsScrolled) => [
        const CupertinoSliverNavigationBar(
          largeTitle: Text('Account'),
        )
      ],
      body: SafeArea(
        top: false,
        child: ColoredBox(
          color: CupertinoColors.systemBackground.resolveFrom(context),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CupertinoListTile(
                    title: Text('Sign In',
                        style: CupertinoTheme.of(context)
                            .textTheme
                            .actionTextStyle),
                    onTap: () {},
                    backgroundColor: CupertinoColors.secondarySystemBackground
                        .resolveFrom(context),
                  ),
                  const SizedBox(height: 5),
                  Text(
                      'Sign in with your Apple ID to manage your Apple Developer account and more.',
                      style: CupertinoTheme.of(context)
                          .textTheme
                          .tabLabelTextStyle),
                  const SizedBox(height: 20),
                  Text('APPLE DEVELOPER PROGRAM',
                      style: CupertinoTheme.of(context)
                          .textTheme
                          .tabLabelTextStyle),
                  const SizedBox(height: 8),
                  CupertinoListTile(
                    title: Text('Enroll Now',
                        style: CupertinoTheme.of(context)
                            .textTheme
                            .actionTextStyle),
                    onTap: () {},
                    backgroundColor: CupertinoColors.secondarySystemBackground
                        .resolveFrom(context),
                  ),
                  const SizedBox(height: 20),
                  CupertinoListTile(
                    title: const Text('Notifications'),
                    trailing: const CupertinoListTileChevron(),
                    backgroundColor: CupertinoColors.secondarySystemBackground
                        .resolveFrom(context),
                  ),
                  const SizedBox(height: 10),
                  Text(
                      'Customise how you receive updates about your account,announcements, WWDC and more.',
                      style: CupertinoTheme.of(context)
                          .textTheme
                          .tabLabelTextStyle),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
