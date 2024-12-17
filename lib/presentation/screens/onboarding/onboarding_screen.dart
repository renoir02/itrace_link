import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:itracelink/core/providers/language_provider.dart';
import 'package:itracelink/presentation/screens/auth/login_screen.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'iTraceLink',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 32),
              LanguageSelector(),
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const LoginScreen(),
                    ),
                  );
                },
                child: const Text('Get Started'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LanguageSelector extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<LanguageProvider>(
      builder: (context, languageProvider, child) {
        return Column(
          children: [
            _LanguageOption(
              languageCode: 'en',
              languageName: 'English',
              isSelected: languageProvider.currentLanguage == 'en',
            ),
            _LanguageOption(
              languageCode: 'fr',
              languageName: 'Français',
              isSelected: languageProvider.currentLanguage == 'fr',
            ),
            _LanguageOption(
              languageCode: 'rw',
              languageName: 'Kinyarwanda',
              isSelected: languageProvider.currentLanguage == 'rw',
            ),
          ],
        );
      },
    );
  }
}

class _LanguageOption extends StatelessWidget {
  final String languageCode;
  final String languageName;
  final bool isSelected;

  const _LanguageOption({
    required this.languageCode,
    required this.languageName,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return RadioListTile<String>(
      title: Text(languageName),
      value: languageCode,
      groupValue: context.watch<LanguageProvider>().currentLanguage,
      onChanged: (value) {
        if (value != null) {
          context.read<LanguageProvider>().setLanguage(value);
        }
      },
    );
  }
}