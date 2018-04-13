﻿
&НаСервере
Процедура ПриСозданииНаСервере(Отказ, СтандартнаяОбработка)
	
	Если Параметры.Свойство("Вес") Тогда
		Вес = Параметры.Вес;
	КонецЕсли;
	
	Если Параметры.Свойство("Упражнение") Тогда
		Упражнение = Параметры.Упражнение;
	КонецЕсли;

	Если Параметры.Свойство("ЧислоПовторений") Тогда
		ЧислоПовторений = Параметры.ЧислоПовторений;
	КонецЕсли;
	
	Если Параметры.Свойство("КоличествоПодходов") Тогда
		КоличествоПодходов = Параметры.КоличествоПодходов;
		
		Попытка
			Вес = Вес / КоличествоПодходов;
		Исключение
			Вес = 0;
		КонецПопытки;
		
		Попытка
			ЧислоПовторений = ЧислоПовторений / КоличествоПодходов;
		Исключение
			ЧислоПовторений = 0;
		КонецПопытки;
	КонецЕсли;
		
КонецПроцедуры
