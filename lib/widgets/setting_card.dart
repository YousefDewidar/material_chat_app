import 'package:flutter/material.dart';
import 'package:material_chat_app/provider/provider.dart';
import 'package:provider/provider.dart';

class SettingCard extends StatelessWidget {
  final String cardName;
  final IconData? iconPre;
  final IconData? iconSuf;
  final bool hasSwitch;
  final void Function() onTap;
  const SettingCard({
    super.key,
    required this.cardName,
    this.iconPre,
    this.iconSuf,
    this.hasSwitch = false,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<MyProvider>(context);
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        height: 70,
        child: Card(
          margin: const EdgeInsets.only(top: 10),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Icon(iconPre),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  cardName,
                  style: const TextStyle(fontSize: 16),
                ),
                const Spacer(),
                Icon(
                  iconSuf,
                  size: 18,
                ),
                hasSwitch
                    ? Switch(
                        value: prov.mode == ThemeMode.dark,
                        onChanged: (value) {
                          prov.changeMode(value);
                        },
                      )
                    : const SizedBox(
                        height: 0,
                      )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
