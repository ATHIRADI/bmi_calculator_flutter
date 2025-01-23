import 'package:seeku_bmi/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:seeku_bmi/utils/providers/language_provider.dart';
import 'package:provider/provider.dart';

class LanguageSelector extends StatefulWidget {
  const LanguageSelector({super.key});

  @override
  State<LanguageSelector> createState() => _LanguageSelectorState();
}

class _LanguageSelectorState extends State<LanguageSelector> {
  @override
  Widget build(BuildContext context) {
    final languageProvider = Provider.of<LanguageProvider>(context);

    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: DropdownButton<Locale>(
        value: languageProvider.currentLocale,
        dropdownColor: Theme.of(context).cardColor,
        style: Theme.of(context).textTheme.bodyLarge,
        underline: const SizedBox(),
        icon: Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: Icon(
            Icons.language_outlined,
            color: Theme.of(context).iconTheme.color,
          ),
        ),
        items: [
          _buildLanguageDropdownItem(context, const Locale('en'), 'English'),
          _buildLanguageDropdownItem(context, const Locale('es'), 'Español'),
          _buildLanguageDropdownItem(context, const Locale('fr'), 'Français'),
          _buildLanguageDropdownItem(context, const Locale('hi'), 'हिन्दी'),
          _buildLanguageDropdownItem(context, const Locale('pt'), 'Português'),
          _buildLanguageDropdownItem(context, const Locale('de'), 'Deutsch'),
          _buildLanguageDropdownItem(context, const Locale('ar'), 'العربية'),
          _buildLanguageDropdownItem(context, const Locale('zh'), '中文'),
          _buildLanguageDropdownItem(context, const Locale('ru'), 'Русский'),
          _buildLanguageDropdownItem(context, const Locale('ja'), '日本語'),
          _buildLanguageDropdownItem(context, const Locale('ko'), '한국어'),
          _buildLanguageDropdownItem(context, const Locale('it'), 'Italiano'),
          _buildLanguageDropdownItem(context, const Locale('tr'), 'Türkçe'),
          _buildLanguageDropdownItem(
              context, const Locale('id'), 'Bahasa Indonesia'),
          _buildLanguageDropdownItem(context, const Locale('pl'), 'Polski'),
          _buildLanguageDropdownItem(context, const Locale('sq'), 'Shqip'),
          _buildLanguageDropdownItem(
              context, const Locale('az'), 'Azərbaycanca'),
          _buildLanguageDropdownItem(context, const Locale('bn'), 'বাংলা'),
          _buildLanguageDropdownItem(context, const Locale('my'), 'မြန်မာ'),
          _buildLanguageDropdownItem(context, const Locale('hr'), 'Hrvatski'),
          _buildLanguageDropdownItem(context, const Locale('cs'), 'Čeština'),
          _buildLanguageDropdownItem(context, const Locale('nl'), 'Nederlands'),
          _buildLanguageDropdownItem(context, const Locale('el'), 'Ελληνικά'),
          _buildLanguageDropdownItem(context, const Locale('gu'), 'ગુજરાતી'),
          _buildLanguageDropdownItem(context, const Locale('hu'), 'Magyar'),
          _buildLanguageDropdownItem(context, const Locale('kn'), 'ಕನ್ನಡ'),
          _buildLanguageDropdownItem(context, const Locale('ml'), 'മലയാളം'),
          _buildLanguageDropdownItem(context, const Locale('mr'), 'मराठी'),
          _buildLanguageDropdownItem(context, const Locale('no'), 'Norsk'),
          _buildLanguageDropdownItem(context, const Locale('or'), 'ଓଡ଼ିଆ'),
          _buildLanguageDropdownItem(context, const Locale('fa'), 'فارسی'),
          _buildLanguageDropdownItem(context, const Locale('pa'), 'ਪੰਜਾਬੀ'),
          _buildLanguageDropdownItem(context, const Locale('ro'), 'Română'),
          _buildLanguageDropdownItem(context, const Locale('sv'), 'Svenska'),
          _buildLanguageDropdownItem(context, const Locale('ta'), 'தமிழ்'),
          _buildLanguageDropdownItem(context, const Locale('te'), 'తెలుగు'),
          _buildLanguageDropdownItem(context, const Locale('th'), 'ไทย'),
          _buildLanguageDropdownItem(context, const Locale('uk'), 'Українська'),
          _buildLanguageDropdownItem(context, const Locale('ur'), 'اردو'),
          _buildLanguageDropdownItem(context, const Locale('vi'), 'Tiếng Việt'),
        ],
        onChanged: (locale) async {
          if (locale != null) {
            languageProvider.setLanguage(locale);
            S.load(locale);
          }
        },
        isExpanded: false,
        hint: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            'Select Language',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: Theme.of(context).iconTheme.color?.withOpacity(0.7),
                ),
          ),
        ),
      ),
    );
  }

  DropdownMenuItem<Locale> _buildLanguageDropdownItem(
    BuildContext context,
    Locale locale,
    String languageName,
  ) {
    return DropdownMenuItem<Locale>(
      value: locale,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Text(
          languageName,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: Theme.of(context).iconTheme.color,
              ),
        ),
      ),
    );
  }
}
