import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:material_chat_app/provider/provider.dart';
import 'package:material_chat_app/views/setting/widgets/info_prof.dart';
import 'package:material_chat_app/views/setting/widgets/sign_out_dialog.dart';
import 'package:material_chat_app/widgets/setting_card.dart';
import 'package:provider/provider.dart';

class SettingHomeView extends StatelessWidget {
  const SettingHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<MyProvider>(context);
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
                pickerCol(context, prov);
              },
            ),
            SettingCard(
              cardName: 'Dark mode',
              iconPre: Icons.dark_mode,
              hasSwitch: true,
              onTap: () {},
            ),
            SettingCard(
              cardName: 'Signout',
              iconSuf: Icons.logout_outlined,
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) =>const SignOutDialog(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Future<dynamic> pickerCol(BuildContext context, MyProvider prov) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Change Theme'),
          content: SingleChildScrollView(
            child: BlockPicker(
              pickerColor: prov.themeCol,
              onColorChanged: (v) {
                prov.changeTheme(v);
              },
            ),
          ),
          actions: [
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Done'))
          ],
        );
      },
    );
  }
}
