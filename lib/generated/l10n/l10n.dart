// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Clubland`
  String get appTitle {
    return Intl.message(
      'Clubland',
      name: 'appTitle',
      desc: 'The main title of the application',
      args: [],
    );
  }

  /// `Profile`
  String get profile {
    return Intl.message(
      'Profile',
      name: 'profile',
      desc: 'Profile page title',
      args: [],
    );
  }

  /// `Overview`
  String get overview {
    return Intl.message(
      'Overview',
      name: 'overview',
      desc: 'Overview tab title',
      args: [],
    );
  }

  /// `Activity`
  String get activity {
    return Intl.message(
      'Activity',
      name: 'activity',
      desc: 'Activity tab title',
      args: [],
    );
  }

  /// `Achievements`
  String get achievements {
    return Intl.message(
      'Achievements',
      name: 'achievements',
      desc: 'Achievements tab title',
      args: [],
    );
  }

  /// `More`
  String get more {
    return Intl.message(
      'More',
      name: 'more',
      desc: 'More tab title',
      args: [],
    );
  }

  /// `Quick Actions`
  String get quickActions {
    return Intl.message(
      'Quick Actions',
      name: 'quickActions',
      desc: 'Quick actions section title',
      args: [],
    );
  }

  /// `Favorite Clubs`
  String get favoriteClubs {
    return Intl.message(
      'Favorite Clubs',
      name: 'favoriteClubs',
      desc: 'Favorite clubs action title',
      args: [],
    );
  }

  /// `View your saved clubs`
  String get favoriteClubsSubtitle {
    return Intl.message(
      'View your saved clubs',
      name: 'favoriteClubsSubtitle',
      desc: 'Favorite clubs action subtitle',
      args: [],
    );
  }

  /// `Visit History`
  String get visitHistory {
    return Intl.message(
      'Visit History',
      name: 'visitHistory',
      desc: 'Visit history action title',
      args: [],
    );
  }

  /// `See where you've been`
  String get visitHistorySubtitle {
    return Intl.message(
      'See where you\'ve been',
      name: 'visitHistorySubtitle',
      desc: 'Visit history action subtitle',
      args: [],
    );
  }

  /// `My Reviews`
  String get myReviews {
    return Intl.message(
      'My Reviews',
      name: 'myReviews',
      desc: 'My reviews action title',
      args: [],
    );
  }

  /// `Manage your club reviews`
  String get myReviewsSubtitle {
    return Intl.message(
      'Manage your club reviews',
      name: 'myReviewsSubtitle',
      desc: 'My reviews action subtitle',
      args: [],
    );
  }

  /// `Share Profile`
  String get shareProfile {
    return Intl.message(
      'Share Profile',
      name: 'shareProfile',
      desc: 'Share profile action title',
      args: [],
    );
  }

  /// `Share with other members`
  String get shareProfileSubtitle {
    return Intl.message(
      'Share with other members',
      name: 'shareProfileSubtitle',
      desc: 'Share profile action subtitle',
      args: [],
    );
  }

  /// `Recent Activity`
  String get recentActivity {
    return Intl.message(
      'Recent Activity',
      name: 'recentActivity',
      desc: 'Recent activity section title',
      args: [],
    );
  }

  /// `View All`
  String get viewAll {
    return Intl.message(
      'View All',
      name: 'viewAll',
      desc: 'View all button text',
      args: [],
    );
  }

  /// `No recent activity`
  String get noRecentActivity {
    return Intl.message(
      'No recent activity',
      name: 'noRecentActivity',
      desc: 'Message when no recent activity',
      args: [],
    );
  }

  /// `Account`
  String get account {
    return Intl.message(
      'Account',
      name: 'account',
      desc: 'Account section title',
      args: [],
    );
  }

  /// `Edit Profile`
  String get editProfile {
    return Intl.message(
      'Edit Profile',
      name: 'editProfile',
      desc: 'Edit profile menu item',
      args: [],
    );
  }

  /// `Membership`
  String get membership {
    return Intl.message(
      'Membership',
      name: 'membership',
      desc: 'Membership menu item',
      args: [],
    );
  }

  /// `Manage your memberships`
  String get membershipSubtitle {
    return Intl.message(
      'Manage your memberships',
      name: 'membershipSubtitle',
      desc: 'Membership menu item subtitle',
      args: [],
    );
  }

  /// `Payment Methods`
  String get paymentMethods {
    return Intl.message(
      'Payment Methods',
      name: 'paymentMethods',
      desc: 'Payment methods menu item',
      args: [],
    );
  }

  /// `Privacy & Security`
  String get privacySecurity {
    return Intl.message(
      'Privacy & Security',
      name: 'privacySecurity',
      desc: 'Privacy and security menu item',
      args: [],
    );
  }

  /// `Social`
  String get social {
    return Intl.message(
      'Social',
      name: 'social',
      desc: 'Social section title',
      args: [],
    );
  }

  /// `Friends`
  String get friends {
    return Intl.message(
      'Friends',
      name: 'friends',
      desc: 'Friends menu item',
      args: [],
    );
  }

  /// `Connect with other members`
  String get friendsSubtitle {
    return Intl.message(
      'Connect with other members',
      name: 'friendsSubtitle',
      desc: 'Friends menu item subtitle',
      args: [],
    );
  }

  /// `Groups`
  String get groups {
    return Intl.message(
      'Groups',
      name: 'groups',
      desc: 'Groups menu item',
      args: [],
    );
  }

  /// `Join interest groups`
  String get groupsSubtitle {
    return Intl.message(
      'Join interest groups',
      name: 'groupsSubtitle',
      desc: 'Groups menu item subtitle',
      args: [],
    );
  }

  /// `Notifications`
  String get notifications {
    return Intl.message(
      'Notifications',
      name: 'notifications',
      desc: 'Notifications menu item',
      args: [],
    );
  }

  /// `Support`
  String get support {
    return Intl.message(
      'Support',
      name: 'support',
      desc: 'Support section title',
      args: [],
    );
  }

  /// `Help & Support`
  String get helpSupport {
    return Intl.message(
      'Help & Support',
      name: 'helpSupport',
      desc: 'Help and support menu item',
      args: [],
    );
  }

  /// `Send Feedback`
  String get sendFeedback {
    return Intl.message(
      'Send Feedback',
      name: 'sendFeedback',
      desc: 'Send feedback menu item',
      args: [],
    );
  }

  /// `About`
  String get about {
    return Intl.message(
      'About',
      name: 'about',
      desc: 'About menu item',
      args: [],
    );
  }

  /// `Sign Out`
  String get signOut {
    return Intl.message(
      'Sign Out',
      name: 'signOut',
      desc: 'Sign out menu item',
      args: [],
    );
  }

  /// `Sign Out`
  String get signOutConfirmTitle {
    return Intl.message(
      'Sign Out',
      name: 'signOutConfirmTitle',
      desc: 'Sign out confirmation dialog title',
      args: [],
    );
  }

  /// `Are you sure you want to sign out?`
  String get signOutConfirmMessage {
    return Intl.message(
      'Are you sure you want to sign out?',
      name: 'signOutConfirmMessage',
      desc: 'Sign out confirmation dialog message',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: 'Cancel button text',
      args: [],
    );
  }

  /// `Visits`
  String get visits {
    return Intl.message(
      'Visits',
      name: 'visits',
      desc: 'Visits stat label',
      args: [],
    );
  }

  /// `Reviews`
  String get reviews {
    return Intl.message(
      'Reviews',
      name: 'reviews',
      desc: 'Reviews stat label',
      args: [],
    );
  }

  /// `Clubs`
  String get clubs {
    return Intl.message(
      'Clubs',
      name: 'clubs',
      desc: 'Clubs stat label',
      args: [],
    );
  }

  /// `Points`
  String get points {
    return Intl.message(
      'Points',
      name: 'points',
      desc: 'Points stat label',
      args: [],
    );
  }

  /// `Profile sharing coming soon!`
  String get profileSharingComingSoon {
    return Intl.message(
      'Profile sharing coming soon!',
      name: 'profileSharingComingSoon',
      desc: 'Message for profile sharing feature',
      args: [],
    );
  }

  /// `Logout functionality coming soon!`
  String get logoutFunctionalityComingSoon {
    return Intl.message(
      'Logout functionality coming soon!',
      name: 'logoutFunctionalityComingSoon',
      desc: 'Message for logout functionality',
      args: [],
    );
  }

  /// `Activity Feed`
  String get activityFeed {
    return Intl.message(
      'Activity Feed',
      name: 'activityFeed',
      desc: 'Activity feed title',
      args: [],
    );
  }

  /// `Your activity history will appear here`
  String get activityHistoryPlaceholder {
    return Intl.message(
      'Your activity history will appear here',
      name: 'activityHistoryPlaceholder',
      desc: 'Placeholder text for empty activity feed',
      args: [],
    );
  }

  /// `First Visit`
  String get firstVisit {
    return Intl.message(
      'First Visit',
      name: 'firstVisit',
      desc: 'First visit achievement title',
      args: [],
    );
  }

  /// `Made your first club visit`
  String get firstVisitDescription {
    return Intl.message(
      'Made your first club visit',
      name: 'firstVisitDescription',
      desc: 'First visit achievement description',
      args: [],
    );
  }

  /// `Social Butterfly`
  String get socialButterfly {
    return Intl.message(
      'Social Butterfly',
      name: 'socialButterfly',
      desc: 'Social butterfly achievement title',
      args: [],
    );
  }

  /// `Connect with 10 members`
  String get socialButterflyDescription {
    return Intl.message(
      'Connect with 10 members',
      name: 'socialButterflyDescription',
      desc: 'Social butterfly achievement description',
      args: [],
    );
  }

  /// `Explorer`
  String get explorer {
    return Intl.message(
      'Explorer',
      name: 'explorer',
      desc: 'Explorer achievement title',
      args: [],
    );
  }

  /// `Visit 5 different clubs`
  String get explorerDescription {
    return Intl.message(
      'Visit 5 different clubs',
      name: 'explorerDescription',
      desc: 'Explorer achievement description',
      args: [],
    );
  }

  /// `Reviewer`
  String get reviewer {
    return Intl.message(
      'Reviewer',
      name: 'reviewer',
      desc: 'Reviewer achievement title',
      args: [],
    );
  }

  /// `Write 10 club reviews`
  String get reviewerDescription {
    return Intl.message(
      'Write 10 club reviews',
      name: 'reviewerDescription',
      desc: 'Reviewer achievement description',
      args: [],
    );
  }

  /// `Earned {timeAgo}`
  String earnedAgo(String timeAgo) {
    return Intl.message(
      'Earned $timeAgo',
      name: 'earnedAgo',
      desc: 'Achievement earned message with time',
      args: [timeAgo],
    );
  }

  /// `Settings`
  String get settings {
    return Intl.message(
      'Settings',
      name: 'settings',
      desc: 'Settings page title',
      args: [],
    );
  }

  /// `Language`
  String get language {
    return Intl.message(
      'Language',
      name: 'language',
      desc: 'Language setting title',
      args: [],
    );
  }

  /// `Choose your preferred language`
  String get languageSubtitle {
    return Intl.message(
      'Choose your preferred language',
      name: 'languageSubtitle',
      desc: 'Language setting subtitle',
      args: [],
    );
  }

  /// `English`
  String get english {
    return Intl.message(
      'English',
      name: 'english',
      desc: 'English language option',
      args: [],
    );
  }

  /// `Swedish`
  String get swedish {
    return Intl.message(
      'Swedish',
      name: 'swedish',
      desc: 'Swedish language option',
      args: [],
    );
  }

  /// `Select Language`
  String get selectLanguage {
    return Intl.message(
      'Select Language',
      name: 'selectLanguage',
      desc: 'Language selection dialog title',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'sv'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
