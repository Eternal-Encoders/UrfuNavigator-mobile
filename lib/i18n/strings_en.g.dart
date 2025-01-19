///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import

part of 'strings.g.dart';

// Path: <root>
typedef TranslationsEn = Translations; // ignore: unused_element
class Translations implements BaseTranslations<AppLocale, Translations> {
	/// Returns the current translations of the given [context].
	///
	/// Usage:
	/// final t = Translations.of(context);
	static Translations of(BuildContext context) => InheritedLocaleData.of<AppLocale, Translations>(context).translations;

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	Translations({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
		    locale: AppLocale.en,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <en>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	dynamic operator[](String key) => $meta.getTranslation(key);

	late final Translations _root = this; // ignore: unused_field

	// Translations
	String get Wait => 'Wait...';
	String get To => 'To';
	String get From => 'From';
	String get SearchForAudiencesAndPlaces => 'Search for audiences and places';
	String get Language => 'Language';
	String get Settings => 'Settings';
	String get AreYouHavingAnyProblemsWithOurSite => 'Are you having any problems with our site? Want to leave a comment or ask a question? Fill out this form!';
	String get Feedback => 'Feedback';
	String get PersonalDataProcessingPolicyAndPrivacyPolicy => 'Personal Data Processing Policy and Privacy Policy';
	String get Contacts => 'Contacts';
	late final TranslationsWcEn WC = TranslationsWcEn._(_root);
	String get Cafe => 'Cafe';
	String get VendingMachine => 'Vending Machine';
	String get Coworking => 'Coworking';
	String get ATM => 'ATM';
	String get Cloakroom => 'Cloakroom';
	String get PublicPrinter => 'Public Printer';
	String get HeadOffice => 'Head Office';
	String get StudentUnion => 'Student Union';
	String get Canteen => 'Canteen';
	String get QuickSearch => 'Quick search';
	late final TranslationsFabEn Fab = TranslationsFabEn._(_root);
	late final TranslationsSliderEn Slider = TranslationsSliderEn._(_root);
	String get FoodTitle => 'Food and Drinks';
	String get SocietyPlacesTitle => 'Public Places';
	String get ServicesTitle => 'Services';
	String get AdministrationTitle => 'Administration';
	late final TranslationsCategoryEn Category = TranslationsCategoryEn._(_root);
	String get FeedbackTitle => 'Feedback';
	String get FeedbackSubtitle => 'Share your experience using the app';
	String get ReportSubtitle => 'Report issues in the app or inaccuracies on the maps';
	String get SettingsSubtitle => 'Change language, personalization, notifications';
	String get LanguageTitle => 'Language';
	String get LanguageSubtitle => 'Interface language selection';
	String get PersonalizationTitle => 'Personalization';
	String get PersonalizationSubtitle => 'Order of institutes on the main screen, default campus';
	String get NotificationTitle => 'Notifications';
	String get NotificationSubtitle => 'Class start reminders, news notifications';
	String get NewsTitle => 'News';
	String get NewsSubtitle => 'Select news sources';
	String get ReportTitle => 'Report an Issue';
}

// Path: WC
class TranslationsWcEn {
	TranslationsWcEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get W => 'WC (W)';
	String get M => 'WC (M)';
}

// Path: Fab
class TranslationsFabEn {
	TranslationsFabEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get CampusTitle => 'Campus';
	String get RouteTitle => 'Route';
}

// Path: Slider
class TranslationsSliderEn {
	TranslationsSliderEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get HistoryTitle => 'History';
	String get CategoryTitle => 'Category';
}

// Path: Category
class TranslationsCategoryEn {
	TranslationsCategoryEn._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get CoffeeTitle => 'Coffee Shop';
	String get CoffeemachineTitle => 'Coffee Machine';
	String get VendingTitle => 'Vending';
	String get DinningTitle => 'Canteen';
	String get ToiletmTitle => 'Restroom (M)';
	String get ToiletwTitle => 'Restroom (F)';
	String get WardrobeTitle => 'Wardrobe';
	String get CoworkingTitle => 'Coworking';
	String get PrintTitle => 'Print';
	String get WaterpumpTitle => 'Water Dispenser';
	String get ChargerTitle => 'Charger';
	String get AtmTitle => 'ATM';
	String get StudentsTitle => 'Student Union';
	String get DeaneryTitle => 'Dean\'s Office';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.
extension on Translations {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'Wait': return 'Wait...';
			case 'To': return 'To';
			case 'From': return 'From';
			case 'SearchForAudiencesAndPlaces': return 'Search for audiences and places';
			case 'Language': return 'Language';
			case 'Settings': return 'Settings';
			case 'AreYouHavingAnyProblemsWithOurSite': return 'Are you having any problems with our site? Want to leave a comment or ask a question? Fill out this form!';
			case 'Feedback': return 'Feedback';
			case 'PersonalDataProcessingPolicyAndPrivacyPolicy': return 'Personal Data Processing Policy and Privacy Policy';
			case 'Contacts': return 'Contacts';
			case 'WC.W': return 'WC (W)';
			case 'WC.M': return 'WC (M)';
			case 'Cafe': return 'Cafe';
			case 'VendingMachine': return 'Vending Machine';
			case 'Coworking': return 'Coworking';
			case 'ATM': return 'ATM';
			case 'Cloakroom': return 'Cloakroom';
			case 'PublicPrinter': return 'Public Printer';
			case 'HeadOffice': return 'Head Office';
			case 'StudentUnion': return 'Student Union';
			case 'Canteen': return 'Canteen';
			case 'QuickSearch': return 'Quick search';
			case 'Fab.CampusTitle': return 'Campus';
			case 'Fab.RouteTitle': return 'Route';
			case 'Slider.HistoryTitle': return 'History';
			case 'Slider.CategoryTitle': return 'Category';
			case 'FoodTitle': return 'Food and Drinks';
			case 'SocietyPlacesTitle': return 'Public Places';
			case 'ServicesTitle': return 'Services';
			case 'AdministrationTitle': return 'Administration';
			case 'Category.CoffeeTitle': return 'Coffee Shop';
			case 'Category.CoffeemachineTitle': return 'Coffee Machine';
			case 'Category.VendingTitle': return 'Vending';
			case 'Category.DinningTitle': return 'Canteen';
			case 'Category.ToiletmTitle': return 'Restroom (M)';
			case 'Category.ToiletwTitle': return 'Restroom (F)';
			case 'Category.WardrobeTitle': return 'Wardrobe';
			case 'Category.CoworkingTitle': return 'Coworking';
			case 'Category.PrintTitle': return 'Print';
			case 'Category.WaterpumpTitle': return 'Water Dispenser';
			case 'Category.ChargerTitle': return 'Charger';
			case 'Category.AtmTitle': return 'ATM';
			case 'Category.StudentsTitle': return 'Student Union';
			case 'Category.DeaneryTitle': return 'Dean\'s Office';
			case 'FeedbackTitle': return 'Feedback';
			case 'FeedbackSubtitle': return 'Share your experience using the app';
			case 'ReportSubtitle': return 'Report issues in the app or inaccuracies on the maps';
			case 'SettingsSubtitle': return 'Change language, personalization, notifications';
			case 'LanguageTitle': return 'Language';
			case 'LanguageSubtitle': return 'Interface language selection';
			case 'PersonalizationTitle': return 'Personalization';
			case 'PersonalizationSubtitle': return 'Order of institutes on the main screen, default campus';
			case 'NotificationTitle': return 'Notifications';
			case 'NotificationSubtitle': return 'Class start reminders, news notifications';
			case 'NewsTitle': return 'News';
			case 'NewsSubtitle': return 'Select news sources';
			case 'ReportTitle': return 'Report an Issue';
			default: return null;
		}
	}
}

