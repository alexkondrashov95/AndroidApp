﻿
&НаСервере
Процедура ПриСозданииНаСервере(Отказ, СтандартнаяОбработка)
	
	Если Параметры.Свойство("ГруппаМышц") Тогда
		
		Владелец = Параметры.ГруппаМышц;	
		ОбновитьСписокУпражнений(Владелец);
		
	КонецЕсли;

	
КонецПроцедуры

&НаКлиенте
Процедура ДобавитьУпражнение(Команда)
	
	ПараметрыФормы = Новый Структура("Владелец",Владелец);
	ОткрытьФорму("Справочник.Упражнения.ФормаОбъекта", ПараметрыФормы, ЭтаФорма);
	
КонецПроцедуры

&НаКлиенте
Процедура ОбработкаОповещения(ИмяСобытия, Параметр, Источник)
	
	Если ИмяСобытия = "ЗаписаноУпражнение" Тогда
		Элементы.Список.Обновить();
		ОбновитьСписокУпражнений(Владелец);
	КонецЕсли;
	
КонецПроцедуры

&НаСервере
Процедура ОбновитьСписокУпражнений(ГруппаМышц)
	
	Запрос = Новый Запрос;
	Запрос.Текст = "ВЫБРАТЬ
	               |	УпражненияИГруппыМышц.Упражнение
	               |ИЗ
	               |	РегистрСведений.УпражненияИГруппыМышц КАК УпражненияИГруппыМышц
				   |ГДЕ
				   |	УпражненияИГруппыМышц.ГруппаМышц = &ГруппаМышц";
				   
	Запрос.УстановитьПараметр("ГруппаМышц",ГруппаМышц);
	
	РЗ = Запрос.Выполнить().Выгрузить();
	
	СписокСсылок = Новый СписокЗначений;
	
	Для Каждого ТекСтрока Из РЗ Цикл
		СписокСсылок.Добавить(ТекСтрока.Упражнение,ТекСтрока.Упражнение);
	КонецЦикла;

	Список.Отбор.Элементы.Очистить();
	
	ЭлементОтбора = Список.Отбор.Элементы.Добавить(Тип("ЭлементОтбораКомпоновкиДанных"));
	
	ЭлементОтбора.ЛевоеЗначение = Новый ПолеКомпоновкиДанных("Ссылка");
	ЭлементОтбора.ВидСравнения = ВидСравненияКомпоновкиДанных.ВСписке;
	ЭлементОтбора.Использование = Истина;
	ЭлементОтбора.ПравоеЗначение = СписокСсылок;		
	
КонецПроцедуры