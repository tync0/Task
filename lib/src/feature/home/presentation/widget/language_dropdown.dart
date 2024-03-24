import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task/src/config/l10n/locale_provider.dart';
import 'package:task/src/core/extension/extension.dart';

class LocaleDropDown extends StatefulWidget {
  const LocaleDropDown({super.key});

  @override
  State<LocaleDropDown> createState() => _LocaleDropDownState();
}

class _LocaleDropDownState extends State<LocaleDropDown> {
  String? _selectedLanguage;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            context.l10n.language,
            style: context.textTheme.headlineSmall,
          ),
          DropdownButton<String>(
            hint: Text(context.l10n.selectLanguage),
            value: _selectedLanguage,
            items: [
              'en',
              'az',
              'tr',
            ]
                .map(
                  (category) => DropdownMenuItem(
                    value: category,
                    child: Text(category),
                  ),
                )
                .toList(),
            onChanged: (newValue) {
              Provider.of<LocaleProvider>(
                context,
                listen: false,
              ).setLocale(
                Locale(newValue!),
              );
              setState(() {
                _selectedLanguage = newValue;
              });
            },
          ),
        ],
      ),
    );
  }
}
