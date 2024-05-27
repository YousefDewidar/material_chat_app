import 'package:flutter/material.dart';
import 'package:material_chat_app/views/setting/widgets/info_prof.dart';
import 'package:material_chat_app/widgets/setting_card.dart';

class SettingHomeView extends StatelessWidget {
  const SettingHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'Settings',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
        body: const Padding(
        padding: EdgeInsets.all(24.0),
        child: Column(
          children: [
            InfoProf(),
            SettingCard(
              cardName: 'profile',
              iconPre: Icons.person,
              iconSuf: Icons.arrow_forward_ios_rounded,
            ),
            SettingCard(
              cardName: 'Theme',
              iconPre: Icons.color_lens,
            ),
            SettingCard(
              cardName: 'Dark mode',
              iconPre: Icons.dark_mode,
              
            ),
            SettingCard(
              cardName: 'Signout',
              iconSuf: Icons.logout_outlined,
            ),
          ],
        ),
      ),
    );
  }
}

