///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import

import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:slang/generated.dart';
import 'strings.g.dart';

// Path: <root>
class TranslationsRu implements Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsRu({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
		    locale: AppLocale.ru,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <ru>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key);

	late final TranslationsRu _root = this; // ignore: unused_field

	// Translations
	@override String get Wait => 'Подождите...';
	@override String get To => 'Куда';
	@override String get From => 'От';
	@override String get SearchForAudiencesAndPlaces => 'Поиск аудиторий и мест';
	@override String get Language => 'Язык';
	@override String get Settings => 'Настройки';
	@override String get AreYouHavingAnyProblemsWithOurSite => 'У вас возникли проблемы? Хотите оставить комментарий или задать вопрос? Заполните форму.';
	@override String get Feedback => 'Обратная связь';
	@override String get PersonalDataProcessingPolicyAndPrivacyPolicy => 'Политика обработки персональных данных и Политика конфиденциальности';
	@override String get Contacts => 'Контакты';
	@override late final _TranslationsWcRu WC = _TranslationsWcRu._(_root);
	@override String get Cafe => 'Кафе';
	@override String get VendingMachine => 'Вендинг';
	@override String get Coworking => 'Коворкинг';
	@override String get ATM => 'Банкомат';
	@override String get Cloakroom => 'Гардероб';
	@override String get PublicPrinter => 'Печать';
	@override String get HeadOffice => 'Деканат';
	@override String get StudentUnion => 'Союз студентов';
	@override String get Canteen => 'Столовая';
	@override String get QuickSearch => 'Быстрый поиск';
	@override late final _TranslationsFabRu Fab = _TranslationsFabRu._(_root);
	@override late final _TranslationsSliderRu Slider = _TranslationsSliderRu._(_root);
	@override String get FoodTitle => 'Еда и напитки';
	@override String get SocietyPlacesTitle => 'Общественные места';
	@override String get ServicesTitle => 'Услуги';
	@override String get AdministrationTitle => 'Администрация';
	@override late final _TranslationsCategoryRu Category = _TranslationsCategoryRu._(_root);
	@override String get FeedbackTitle => 'Обратная связь';
	@override String get FeedbackSubtitle => 'Расскажите о своем опыте использования приложения';
	@override String get ReportSubtitle => 'Сообщите об ошибках в работе приложения или неточностях в картах';
	@override String get SettingsSubtitle => 'Смена языка, персонализация, уведомления';
	@override String get LanguageTitle => 'Язык';
	@override String get LanguageSubtitle => 'Выбор языка интерфейса';
	@override String get PersonalizationTitle => 'Персонализация';
	@override String get PersonalizationSubtitle => 'Порядок институтов на главном экране, кампус по умолчанию';
	@override String get NotificationTitle => 'Уведомления';
	@override String get NotificationSubtitle => 'Напоминания о начале пары, уведомления о новостях';
	@override String get NewsTitle => 'Новости';
	@override String get NewsSubtitle => 'Выбор источников новостей';
	@override String get ReportTitle => 'Сообщить об ошибке';
}

// Path: WC
class _TranslationsWcRu implements TranslationsWcEn {
	_TranslationsWcRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get W => 'Санузел (Ж)';
	@override String get M => 'Санузел (М)';
}

// Path: Fab
class _TranslationsFabRu implements TranslationsFabEn {
	_TranslationsFabRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get CampusTitle => 'Кампус';
	@override String get RouteTitle => 'Маршрут';
}

// Path: Slider
class _TranslationsSliderRu implements TranslationsSliderEn {
	_TranslationsSliderRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get HistoryTitle => 'История';
	@override String get CategoryTitle => 'Категория';
}

// Path: Category
class _TranslationsCategoryRu implements TranslationsCategoryEn {
	_TranslationsCategoryRu._(this._root);

	final TranslationsRu _root; // ignore: unused_field

	// Translations
	@override String get CoffeeTitle => 'Кофейня';
	@override String get CoffeemachineTitle => 'Кофемашина';
	@override String get VendingTitle => 'Вендинг';
	@override String get DinningTitle => 'Столовая';
	@override String get ToiletmTitle => 'Санузел (М)';
	@override String get ToiletwTitle => 'Санузел (Ж)';
	@override String get WardrobeTitle => 'Гардероб';
	@override String get CoworkingTitle => 'Коворкинг';
	@override String get PrintTitle => 'Печать';
	@override String get WaterpumpTitle => 'Водомат';
	@override String get ChargerTitle => 'Зарядка';
	@override String get AtmTitle => 'Банкомат';
	@override String get StudentsTitle => 'Союз студентов';
	@override String get DeaneryTitle => 'Деканат';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.
extension on TranslationsRu {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'Wait': return 'Подождите...';
			case 'To': return 'Куда';
			case 'From': return 'От';
			case 'SearchForAudiencesAndPlaces': return 'Поиск аудиторий и мест';
			case 'Language': return 'Язык';
			case 'Settings': return 'Настройки';
			case 'AreYouHavingAnyProblemsWithOurSite': return 'У вас возникли проблемы? Хотите оставить комментарий или задать вопрос? Заполните форму.';
			case 'Feedback': return 'Обратная связь';
			case 'PersonalDataProcessingPolicyAndPrivacyPolicy': return 'Политика обработки персональных данных и Политика конфиденциальности';
			case 'Contacts': return 'Контакты';
			case 'WC.W': return 'Санузел (Ж)';
			case 'WC.M': return 'Санузел (М)';
			case 'Cafe': return 'Кафе';
			case 'VendingMachine': return 'Вендинг';
			case 'Coworking': return 'Коворкинг';
			case 'ATM': return 'Банкомат';
			case 'Cloakroom': return 'Гардероб';
			case 'PublicPrinter': return 'Печать';
			case 'HeadOffice': return 'Деканат';
			case 'StudentUnion': return 'Союз студентов';
			case 'Canteen': return 'Столовая';
			case 'QuickSearch': return 'Быстрый поиск';
			case 'Fab.CampusTitle': return 'Кампус';
			case 'Fab.RouteTitle': return 'Маршрут';
			case 'Slider.HistoryTitle': return 'История';
			case 'Slider.CategoryTitle': return 'Категория';
			case 'FoodTitle': return 'Еда и напитки';
			case 'SocietyPlacesTitle': return 'Общественные места';
			case 'ServicesTitle': return 'Услуги';
			case 'AdministrationTitle': return 'Администрация';
			case 'Category.CoffeeTitle': return 'Кофейня';
			case 'Category.CoffeemachineTitle': return 'Кофемашина';
			case 'Category.VendingTitle': return 'Вендинг';
			case 'Category.DinningTitle': return 'Столовая';
			case 'Category.ToiletmTitle': return 'Санузел (М)';
			case 'Category.ToiletwTitle': return 'Санузел (Ж)';
			case 'Category.WardrobeTitle': return 'Гардероб';
			case 'Category.CoworkingTitle': return 'Коворкинг';
			case 'Category.PrintTitle': return 'Печать';
			case 'Category.WaterpumpTitle': return 'Водомат';
			case 'Category.ChargerTitle': return 'Зарядка';
			case 'Category.AtmTitle': return 'Банкомат';
			case 'Category.StudentsTitle': return 'Союз студентов';
			case 'Category.DeaneryTitle': return 'Деканат';
			case 'FeedbackTitle': return 'Обратная связь';
			case 'FeedbackSubtitle': return 'Расскажите о своем опыте использования приложения';
			case 'ReportSubtitle': return 'Сообщите об ошибках в работе приложения или неточностях в картах';
			case 'SettingsSubtitle': return 'Смена языка, персонализация, уведомления';
			case 'LanguageTitle': return 'Язык';
			case 'LanguageSubtitle': return 'Выбор языка интерфейса';
			case 'PersonalizationTitle': return 'Персонализация';
			case 'PersonalizationSubtitle': return 'Порядок институтов на главном экране, кампус по умолчанию';
			case 'NotificationTitle': return 'Уведомления';
			case 'NotificationSubtitle': return 'Напоминания о начале пары, уведомления о новостях';
			case 'NewsTitle': return 'Новости';
			case 'NewsSubtitle': return 'Выбор источников новостей';
			case 'ReportTitle': return 'Сообщить об ошибке';
			default: return null;
		}
	}
}

