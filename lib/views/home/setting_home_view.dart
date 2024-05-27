import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
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
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            const InfoProf(),
            SettingCard(
              cardName: 'profile',
              iconPre: Icons.person,
              iconSuf: Icons.arrow_forward_ios_rounded,
              onTap: () {},
            ),
            SettingCard(
              cardName: 'Theme',
              iconPre: Icons.color_lens,
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: const Text('Change Theme'),
                      content: SingleChildScrollView(
                        child: BlockPicker(
                          pickerColor: Colors.red,
                          onColorChanged: (v) {},
                        ),
                      ),
                      actions: [
                        ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child:const Text('Done'))
                      ],
                    );
                  },
                );
              },
            ),
            SettingCard(
              cardName: 'Dark mode',
              iconPre: Icons.dark_mode,
              onTap: () {},
            ),
            SettingCard(
              cardName: 'Signout',
              iconSuf: Icons.logout_outlined,
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
