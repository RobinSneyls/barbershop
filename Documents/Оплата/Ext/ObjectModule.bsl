﻿
Процедура ОбработкаЗаполнения(ДанныеЗаполнения, СтандартнаяОбработка)
	//{{__КОНСТРУКТОР_ВВОД_НА_ОСНОВАНИИ
	// Данный фрагмент построен конструктором.
	// При повторном использовании конструктора, внесенные вручную изменения будут утеряны!!!
	Если ТипЗнч(ДанныеЗаполнения) = Тип("ДокументСсылка.Продажа") Тогда
		// Заполнение шапки
		Запись = ДанныеЗаполнения.Запись;
		Клиент = ДанныеЗаполнения.Клиент;
		Салон = ДанныеЗаполнения.Салон;
		Сумма = ДанныеЗаполнения.Сумма;
	КонецЕсли;
	//}}__КОНСТРУКТОР_ВВОД_НА_ОСНОВАНИИ
КонецПроцедуры

Процедура ОбработкаПроведения(Отказ, Режим)
	//{{__КОНСТРУКТОР_ДВИЖЕНИЙ_РЕГИСТРОВ
	// Данный фрагмент построен конструктором.
	// При повторном использовании конструктора, внесенные вручную изменения будут утеряны!!!

	// регистр Деньги Приход
	Движения.Деньги.Записывать = Истина;
	Движение = Движения.Деньги.Добавить();
	Движение.ВидДвижения = ВидДвиженияНакопления.Приход;
	Движение.Период = Дата;
	Движение.ТипДенежныхСредств = ТипДенежныхСредствПоСпособуОплаты(СпособОплаты);
	Движение.Сумма = Сумма;

	//}}__КОНСТРУКТОР_ДВИЖЕНИЙ_РЕГИСТРОВ
КонецПроцедуры


Функция ТипДенежныхСредствПоСпособуОплаты(СпособОплаты)
	
	Соответствие = Новый Соответствие;
	Соответствие.Вставить(Перечисления.СпособыОплаты.Наличные,Перечисления.ТипДенежныхСредств.Наличные);
	Соответствие.Вставить(Перечисления.СпособыОплаты.Карта,Перечисления.ТипДенежныхСредств.Безналичные);

	Возврат Соответствие[СпособОплаты];
КонецФункции
