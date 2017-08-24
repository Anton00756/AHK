#NoEnv  ; Recommended for performance && compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed && reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#Include SAMP.ahk
#IfWinActive GTA:SA:MP
#SingleInstance Force
DIR = %A_MyDocuments%\GTA San Andreas User Files\Mafia by Tosha\
FileCreateDir, %DIR%
DIRSETTING = %DIR%\Settings.ini
Version = 1.1
FileDelete, %Dir%\VersionMafia.txt
FileDelete, %A_Temp%\VersionMafia.txt
FileDelete, %A_Temp%\DirMafia.txt
FileAppend, %Version%, %Dir%\VersionMafia.txt
FileAppend,, %A_Temp%\VersionMafia.txt
URLDownloadToFile, https://raw.githubusercontent.com/Anton00756/AHK/master/VersionMafia.txt, %A_Temp%\VersionMafia.txt
FileRead, readver1, %Dir%\VersionMafia.txt
FileRead, readver2, %A_Temp%\VersionMafia.txt
if (readver1 < readver2)
{
 MsgBox, , Mafia AHK by Tosha, Есть новая версия скрипта! Сейчас загрузим!
 FileAppend, %A_ScriptDir%, %A_Temp%\DirMafia.txt
 URLDownloadToFile, https://raw.githubusercontent.com/Anton00756/AHK/master/UpdateMafia.exe, %DIR%\UpdateMafia.exe
 Run, %DIR%UpdateMafia.exe
 ExitApp
}
SetTimer, Chat, 200
SetTimer, TakeGun, 2000
SetTimer, UnloadGun, 2000
SetTimer, Zarplatka, 2000
KolvoBomb := 0
IniRead, Name, %DIRSETTING%, Player, Name
IniRead, Name1, %DIRSETTING%, Player, Name1
IniRead, Org, %DIRSETTING%, Player, Org
IniRead, Role, %DIRSETTING%, Player, Role
IniRead, Numb, %DIRSETTING%, Player, Numb
IniRead, TegF, %DIRSETTING%, Player, TegF
IniRead, Pol, %DIRSETTING%, Player, Pol
IniRead, Str1, %DIRSETTING%, Addv, Str1
IniRead, Str2, %DIRSETTING%, Addv, Str2
IniRead, Str3, %DIRSETTING%, Addv, Str3
IniRead, Str4, %DIRSETTING%, Addv, Str4
IniRead, Str5, %DIRSETTING%, Addv, Str5
IniRead, Str6, %DIRSETTING%, Addv, Str6
IniRead, Str7, %DIRSETTING%, Addv, Str7
IniRead, Str8, %DIRSETTING%, Addv, Str8
IniRead, Str9, %DIRSETTING%, Addv, Str9
IniRead, Jarviscom, %DIRSETTING%, Dop, Jarviscom
IniRead, Ammo, %DIRSETTING%, Dop, Ammo
IniRead, Dostor, %DIRSETTING%, Dop, Dostor
IniRead, Masker, %DIRSETTING%, Dop, Masker
IniRead, Healmer, %DIRSETTING%, Dop, Healmer
IniRead, Finder, %DIRSETTING%, Dop, Finder
IniRead, Zarpl, %DIRSETTING%, Dop, Zarpl
IniRead, Racia, %DIRSETTING%, Dop, Racia
IniRead, Cam, %DIRSETTING%, Camera, Cam
IniRead, Key1, %DIRSETTING%, IniKey, Key1
IniRead, Key2, %DIRSETTING%, IniKey, Key2
IniRead, Key3, %DIRSETTING%, IniKey, Key3
IniRead, Key4, %DIRSETTING%, IniKey, Key4
IniRead, Key5, %DIRSETTING%, IniKey, Key5
IniRead, Key6, %DIRSETTING%, IniKey, Key6
IniRead, Key7, %DIRSETTING%, IniKey, Key7
IniRead, BlocknotText1, %DIRSETTING%, Block, BlocknotText1
If (BlocknotText1 = "ERROR")
{
IniWrite, Пусто, %DIRSETTING%, Block, BlocknotText1
IniWrite, Пусто, %DIRSETTING%, Block, BlocknotText2
IniWrite, Пусто, %DIRSETTING%, Block, BlocknotText3
IniWrite, Пусто, %DIRSETTING%, Block, BlocknotText4
IniWrite, Пусто, %DIRSETTING%, Block, BlocknotText5
IniRead, BlocknotText1, %DIRSETTING%, Block, BlocknotText1
IniRead, BlocknotText2, %DIRSETTING%, Block, BlocknotText2
IniRead, BlocknotText3, %DIRSETTING%, Block, BlocknotText3
IniRead, BlocknotText4, %DIRSETTING%, Block, BlocknotText4
IniRead, BlocknotText5, %DIRSETTING%, Block, BlocknotText5
}
IniRead, BlocknotText2, %DIRSETTING%, Block, BlocknotText2
IniRead, BlocknotText3, %DIRSETTING%, Block, BlocknotText3
IniRead, BlocknotText4, %DIRSETTING%, Block, BlocknotText4
IniRead, BlocknotText5, %DIRSETTING%, Block, BlocknotText5
Gui, Add, Tab2, x2 y-1 w500 h400 , Данные|Объявления|Клавиши|Другое
Gui, Tab, Данные
Gui, Add, Text, x372 y339 w80 h20 , VIP Version 1.1
Gui, Add, Button, x362 y355 w80 h20 gNew, Новое в 1.1
Gui, Add, Button, x162 y330 w150 h30 gGlavKey, Сохранить
Gui, Add, Text, x162 y360 w150 h30 , В игре: /ahelp 1 | /ahelp 2
;Gui, Add, Button, x2 y339 w100 h40 gObnova, Обновить УК, АК, Устав
Gui, Add, Text, x22 y20 w170 h30 , Ник (Без _)
Gui, Add, Text, x22 y50 w170 h30 , Короткое имя
Gui, Add, Text, x22 y80 w170 h30 , Организация
;Gui, Add, Text, x22 y110 w170 h30 , Звание
Gui, Add, Text, x22 y140 w170 h30 , Должность
Gui, Add, Text, x22 y170 w170 h30 , Номер
Gui, Add, Text, x22 y200 w170 h30 , Тэг /f
Gui, Add, Text, x100 y230 w450 h30 , Если нужно, то с ''[ ]:'' | Для отключения поставить ''-''.
Gui, Add, Text, x22 y260 w170 h30 , Пол (Boy/Girl)
Gui, Add, Edit, x232 y20 w230 h20 vName, %Name%
Gui, Add, Edit, x232 y50 w230 h20 vName1, %Name1%
Gui, Add, Edit, x232 y80 w230 h20 vOrg, %Org%
;Gui, Add, Edit, x232 y110 w230 h20 vRang, %Rang%
Gui, Add, Edit, x232 y140 w230 h20 vRole, %Role%
Gui, Add, Edit, x232 y170 w230 h20 vNumb, %Numb%
Gui, Add, Edit, x232 y200 w230 h20 vTegF, %TegF%
Gui, Add, Edit, x232 y260 w230 h20 vPol, %Pol%
Gui, Tab, Объявления
Gui, Add, Text, x372 y339 w80 h20 , VIP Version 1.1
Gui, Add, Button, x162 y339 w150 h30 gGlavKey, Сохранить
Gui, Add, Text, x12 y20 w100 h20 , Строка 1 № 1
Gui, Add, Text, x12 y50 w100 h20 , Строка 2 № 1
Gui, Add, Text, x12 y80 w100 h20 , Строка 3 № 1
Gui, Add, Text, x12 y140 w100 h20 , Строка 1 № 2
Gui, Add, Text, x12 y170 w100 h20 , Строка 2 № 2
Gui, Add, Text, x12 y200 w100 h20 , Строка 3 № 2
Gui, Add, Text, x12 y255 w100 h20 , Строка 1 № 3
Gui, Add, Text, x12 y285 w100 h20 , Строка 2 № 3
Gui, Add, Text, x12 y315 w100 h20 , Строка 3 № 3
Gui, Add, Edit, x122 y20 w340 h20 vStr1, %Str1%
Gui, Add, Edit, x122 y50 w340 h20 vStr2, %Str2%
Gui, Add, Edit, x122 y80 w340 h20 vStr3, %Str3%
Gui, Add, Edit, x122 y140 w340 h20 vStr4, %Str4%
Gui, Add, Edit, x122 y170 w340 h20 vStr5, %Str5%
Gui, Add, Edit, x122 y200 w340 h20 vStr6, %Str6%
Gui, Add, Edit, x122 y255 w340 h20 vStr7, %Str7%
Gui, Add, Edit, x122 y285 w340 h20 vStr8, %Str8%
Gui, Add, Edit, x122 y315 w340 h20 vStr9, %Str9%
Gui, Add, Text, x12 y110 w450 h20 , Вводить полностью строку (с /f, /n или вообще без). Если нужно, то с тегом.
Gui, Add, Text, x12 y230 w450 h20 , Вводить полностью строку (с /f, /n или вообще без). Если нужно, то с тегом.
Gui, Tab, Клавиши
Gui, Add, Text, x372 y339 w80 h20 , VIP Version 1.1
Gui, Add, Button, x162 y300 w150 h60 gOK, Сохранить клавиши
Gui, Add, Text, x12 y20 w100 h30 , Отыгровка для Fraps/Bandicam
Gui, Add, Text, x12 y60 w100 h30 , Рация /f
Gui, Add, Text, x12 y100 w100 h30 , RP-время
Gui, Add, Text, x12 y140 w100 h30 , Отпр. об. № 1
Gui, Add, Text, x12 y180 w100 h30 , Отпр. об. № 2
Gui, Add, Text, x12 y220 w100 h30 , Отпр. об. № 3
Gui, Add, Text, x12 y260 w100 h30 , Дом. авто
Gui, Add, Hotkey, x142 y20 w100 h30 vKey1, %Key1%
Gui, Add, Hotkey, x142 y60 w100 h30 vKey2, %Key2%
Gui, Add, Hotkey, x142 y100 w100 h30 vKey3, %Key3%
Gui, Add, Hotkey, x142 y140 w100 h30 vKey4, %Key4%
Gui, Add, Hotkey, x142 y180 w100 h30 vKey5, %Key5%
Gui, Add, Hotkey, x142 y220 w100 h30 vKey6, %Key6%
Gui, Add, Hotkey, x142 y260 w100 h30 vKey7, %Key7%
Gui, Tab, Другое
Gui, Add, Text, x372 y339 w80 h20 , VIP Version 1.1
Gui, Add, Button, x162 y339 w150 h30 gGlavKey, Сохранить
Gui, Add, CheckBox, x12 y20 w100 h40 vJarviscom Checked%Jarviscom%, Голосовые команды Jarvis (/jhelp)
Gui, Add, CheckBox, x122 y20 w100 h40 vAmmo Checked%Ammo%, Отыгровка команд с ammo
Gui, Add, CheckBox, x232 y20 w100 h40 vDostor Checked%Dostor%, Отыгровка оружия
Gui, Add, CheckBox, x342 y20 w100 h40 vMasker Checked%Masker%, Отыгровка маски
Gui, Add, CheckBox, x12 y60 w100 h40 vHealmer Checked%Healmer%, Отыгровка аптечки
Gui, Add, CheckBox, x122 y60 w100 h40 vFinder Checked%Finder%, Отыгровка /find
Gui, Add, CheckBox, x232 y60 w100 h40 vZarpl Checked%Zarpl%, Голос. озвучка перед ЗП
Gui, Add, CheckBox, x342 y60 w100 h40 vRacia Checked%Racia%, Отыгровка рации
Gui, Show, w479 h379, Mafia AHK by Tosha
Goto, OK
return

New:
Text =
(
1) Изменены тайминги при некоторых отыгровках.
2) Новая команда '/перчатки', чтобы надеть перчатки перед похищением/терактом, дабы не оставить отпечатков.
3) Новая команда '/камеры' для отключения камер в радиусе 1 км.
4) Новая команда '/бомба' для закладки взрывного заряда. ДОБАВИТЬ АНИМКУ ЗАКЛАДКИ БОМБЫ!!!!
5) Новая команда '/взрыв' для активации взрывного заряда и его детонирования.
6) Новая команда '/разминирование' для деактивации бомбы.
7) Новая команда '/хвост' для сообщения о преследовании сотрудниками PD.
8) Новая команда '/менты' для сообщения о задержании сотрудниками PD.
9) Новая команда '/растяжка', чтобы установить растяжку на дверной проём.
10) Новая команда '/сон [ID]', чтобы усыпить человека.
11) Новая команда '/убить [ID]', чтобы отыграть по RP убийство игрока, а затем убить из Desert Eagle.
12) Появилась RP отыгровка снятия Fraps/Bandicam во вкладке 'Клавиши'.
13) Команда '/cam' для включения/отключения RP отыгровки прямо в игре.
14) Изменено окно Jarvis по команде '/jhelp'.
15) Появился небольшой ручной блокнот для заметок в тестовой версии. Пока всего 5 ячеек для данных.
Используйте '/bl' для работы с ним.
16) Убраны команды: '/провоб 1', '/отпроб 1', '/провоб 2', '/отпроб 2', '/провоб 3', '/отпроб 3'.
Вместо них введена команда '/str'.
17) Добавлена кнопка на отправку объявления №3 во вкладке 'Клавиши'.
18) Изменена команда '/собес [1-3]'. Теперь она работает, как команда '/собес'.
19) Добавлена команда '/капсула'. RP отыгровка принятия неизвестного препарата, паралича и потери сознания.



Tosha: Хух, это было потное обновление! Не знаю даже, будет ли следующее обновление и каким содержательным. Тут всё новое, чего нет в AHK by Tony для МВД. Если есть желание как-то помочь мне, то можете кинуть на Blue Server'е на банковский счёт 60063 какую-то сумму. Буду благодарен. Ждите ещё чего-нибудь новенького! ;)

С уважением, Ваш покорный слуга, Tosha! ;) Skype: lom00756.
Хочу поблагодарить Martin Bartolomeo, который всегда выручает, какие бы проблемы у нас не были.
А также огромное спасибо хочу сказать Leonid Russak (Anthony Williams), который не бросил в трудный момент.
)
MsgBox, 0, Mafia AHK by Tosha, %Text%

return

OK:
{
HotKey, %Key1%, Off, UseErrorLevel
HotKey, %Key2%, Off, UseErrorLevel
HotKey, %Key3%, Off, UseErrorLevel
HotKey, %Key4%, Off, UseErrorLevel
HotKey, %Key5%, Off, UseErrorLevel
HotKey, %Key6%, Off, UseErrorLevel
HotKey, %Key7%, Off, UseErrorLevel
Gui, Submit, Nohide,
HotKey, %Key1%, Active1, On, UseErrorLevel
HotKey, %Key2%, Active2, On, UseErrorLevel
HotKey, %Key3%, Active3, On, UseErrorLevel
HotKey, %Key4%, Active4, On, UseErrorLevel
HotKey, %Key5%, Active5, On, UseErrorLevel
HotKey, %Key6%, Active6, On, UseErrorLevel
HotKey, %Key7%, Active7, On, UseErrorLevel
GuiControlGet, Key1
GuiControlGet, Key2
GuiControlGet, Key3
GuiControlGet, Key4
GuiControlGet, Key5
GuiControlGet, Key6
GuiControlGet, Key7
IniWrite, %Key1%, %DIRSETTING%, IniKey, Key1
IniWrite, %Key2%, %DIRSETTING%, IniKey, Key2
IniWrite, %Key3%, %DIRSETTING%, IniKey, Key3
IniWrite, %Key4%, %DIRSETTING%, IniKey, Key4
IniWrite, %Key5%, %DIRSETTING%, IniKey, Key5
IniWrite, %Key6%, %DIRSETTING%, IniKey, Key6
IniWrite, %Key7%, %DIRSETTING%, IniKey, Key7
}
return

GuiClose:
ExitApp
return

GlavKey:
{
GuiControlGet, Name
GuiControlGet, Name1
GuiControlGet, Org
GuiControlGet, Role
GuiControlGet, Numb
GuiControlGet, TegF
GuiControlGet, Pol
GuiControlGet, Str1
GuiControlGet, Str2
GuiControlGet, Str3
GuiControlGet, Str4
GuiControlGet, Str5
GuiControlGet, Str6
GuiControlGet, Str7
GuiControlGet, Str8
GuiControlGet, Str9
GuiControlGet, Jarviscom
GuiControlGet, Ammo
GuiControlGet, Dostor
GuiControlGet, Masker
GuiControlGet, Healmer
GuiControlGet, Finder
GuiControlGet, Zarpl
GuiControlGet, Racia
IniWrite, %Name%, %DIRSETTING%, Player, Name
IniWrite, %Name1%, %DIRSETTING%, Player, Name1
IniWrite, %Org%, %DIRSETTING%, Player, Org
;IniWrite, %Rang%, %DIRSETTING%, Player, Rang
IniWrite, %Role%, %DIRSETTING%, Player, Role
IniWrite, %Numb%, %DIRSETTING%, Player, Numb
IniWrite, %TegF%, %DIRSETTING%, Player, TegF
IniWrite, %Pol%, %DIRSETTING%, Player, Pol
IniWrite, %Str1%, %DIRSETTING%, Addv, Str1
IniWrite, %Str2%, %DIRSETTING%, Addv, Str2
IniWrite, %Str3%, %DIRSETTING%, Addv, Str3
IniWrite, %Str4%, %DIRSETTING%, Addv, Str4
IniWrite, %Str5%, %DIRSETTING%, Addv, Str5
IniWrite, %Str6%, %DIRSETTING%, Addv, Str6
IniWrite, %Str7%, %DIRSETTING%, Addv, Str7
IniWrite, %Str8%, %DIRSETTING%, Addv, Str8
IniWrite, %Str9%, %DIRSETTING%, Addv, Str9
IniWrite, %Jarviscom%, %DIRSETTING%, Dop, Jarviscom
IniWrite, %Ammo%, %DIRSETTING%, Dop, Ammo
IniWrite, %Dostor%, %DIRSETTING%, Dop, Dostor
IniWrite, %Masker%, %DIRSETTING%, Dop, Masker
IniWrite, %Healmer%, %DIRSETTING%, Dop, Healmer
IniWrite, %Finder%, %DIRSETTING%, Dop, Finder
IniWrite, %Zarpl%, %DIRSETTING%, Dop, Zarpl
IniWrite, %Racia%, %DIRSETTING%, Dop, Racia
}
return

$~Enter::
if (isInChat() = 1)
if (isDialogOpen() = 0)
{
sleep 250
dwAddress := dwSAMP + 0x12D8F8
chatInput := readString(hGTA, dwAddress, 256)
if (chatinput = "/jhelp")
{
help =
(
{99FF99}                                                              ••••••••••••••••••••••
{99FF99}•══════════════════════════════• {ADFF2F}§ Jarvis Help: § {99FF99}•════════════════════════════•
{99FF99}║                                                             ••••••••••••••••••••••                                                          ║
{99FF99}║{FFBF00} Что ты такое? Сколько времени? Что делаешь? Привет. Кто твой создатель?   {99FF99}║
{99FF99}║{FFBF00} Что происходит в штате? Лучшая организация в штате? Как дела? Шанс...          {99FF99}║
{99FF99}║{FFBF00} Кто сейчас подаст гос. новость? Кто передо мной? Транспорт. Где я?                 {99FF99}║
{99FF99}•══════════════════════════════════════════════════════════════════════════•
{ADFF2F}Пример: {FF0000}Jarvis{32CD32}, кто твой создатель? {ADFF2F}| {FF0000}Jarvis{32CD32}, привет.
)
showDialog("0", "{ADFF2F}◄▓ Справка по Jarvis в AHK Mafia от Tosha ▓►", help, "Закрыть")
}

if (chatinput = "/ahelp 1")
{
help = 
(
{FF0000}/jhelp {32CD32}• Помощь по Jarvis System.
{FF0000}/ud {32CD32}• Показать удостоверение.
{FF0000}/viz {32CD32}• Дать визитку.
{FF0000}/машина {32CD32}• Открыть домашний транспорт.
{FF0000}/hold [ID] {32CD32}• Вести за собой.
{FF0000}/сон [ID] {32CD32}• Отключение камер в радиусе 1 км.
{FF0000}/хомут [ID] {32CD32}• Одеть РП отыгровкой хомут на руки человека.
{FF0000}/убить [ID] {32CD32}• RP убийство человека.
{FF0000}/захват [ID] {32CD32}• Похищение (/tie, /bag) с РП отыгровкой.
{FF0000}/свобода [ID] {32CD32}• Отпустить заложника.
{FF0000}/invite [ID] {32CD32}• Принять в орг.
{FF0000}/uninvite [ID] [Причина] {32CD32}• Уволить из орг.
{FF0000}/rang {32CD32}• Выдать новый титул.
{FF0000}/changeform {32CD32}• Сменить форму.
{FF0000}/перчатки {32CD32}• Одеть перчатки, чтобы не оставить отпечатков.
{FF0000}/камеры {32CD32}• Отключение камер в радиусе 1 км.
{FF0000}/растяжка {32CD32}• Установить разтяжку на дверной проём.
{FF0000}/бомба {32CD32}• Закладка взрывного устройства.
{FF0000}/взрыв {32CD32}• Активация и детонация взрывчатки.
{FF0000}/разминирование {32CD32}• Деактивация взрывчатки.
{FF0000}/хвост {32CD32}• Сообщенить о погоне сотрудников МВД.
{FF0000}/менты {32CD32}• Сообщенить о задержании сотрудниками МВД.
{FF0000}/капсула {32CD32}• Принятие капсулы.
)
showDialog("0", "{ADFF2F}◄▓ Справка по Mafia AHK от Tosha ▓►", help, "Закрыть")
}

if (chatinput = "/ahelp 2")
{
help = 
(
{FF0000}/fh (Текст) {32CD32}• OOC сообщение (/f).
{FF0000}/rep (Текст) {32CD32}• Сообщение в репорт.
{FF0000}/str {32CD32}• Меню "Три строки".
{FF0000}/собес {32CD32}• Проведение собеседования.
{FF0000}/cam {32CD32}• Включение и отключение RP отыгровки Fraps / Bandicam прямо в игре.
{FF0000}/bl {32CD32}• Блокнот.
)
showDialog("0", "{ADFF2F}◄▓ Справка Mafia AHK от Tosha ▓►", help, "Закрыть")
}

if (chatinput = "/капсула")
{
 ID := GetID()
 Nick := getPlayerNameById(id)
 Nick := RegExReplace(Nick, "_", A_Space)
 SendChat("/do На рукаве незаметно закреплена капсула.")
 sleep, 700
 SendChat("/me быстро закинул капсулу в рот и раскусил")
 sleep, 700
 SendChat("/do " Nick " парализован. " Nick " потерял сознание. ")
}

if (ChatInput = "/bl")
{
addChatMessage("{ADFF2F} Для выбора нужного пункта используйте клавишу Enter.")
addChatMessage("{FFFF99} Выберите пункт 'Выход', чтобы закрыть окно.")
Dialog3:
TextD =
(
%BlocknotText1%
%BlocknotText2%
%BlocknotText3% 
%BlocknotText4% 
%BlocknotText5% 
Выход
)
ShowDialog("2", "• Блокнот •", TextD, "")
KeyWait, Enter, D
Dial := getDialogIndex()
if (Dial = 6)
{
Exit
}
if (Dial = 1)
{
sleep, 200
Dialog4:
TextD =
(
Просмотр
Редактирование
Назад
Выход
)
ShowDialog("2", "• Блокнот •", TextD, "")
KeyWait, Enter, D
Dial := getDialogIndex()
if (Dial = 4)
{
Exit
}
if (Dial = 3)
{
sleep, 300
goto,Dialog3
}
if (Dial = 2)
{
sleep, 200
ShowDialog("1", "• Блокнот •", BlocknotText1, "Enter")
Input, Otv, V, {Enter}
FormatTime, TimeString,, dd MMMM yyyy, HH:mm:ss
BlocknotText =
(
[%TimeString%] %Otv%
)
IniWrite, %BlocknotText%, %DIRSETTING%, Block, BlocknotText1
AddChatMessage("{32CD32}Пункт №1 в блокноте изменён!")
IniRead, BlocknotText1, %DIRSETTING%, Block, BlocknotText1
}
if (Dial = 1)
{
sleep, 200
TextD =
(
%BlocknotText1%
)
ShowDialog("0", "• Блокнот •", TextD, "Enter")
KeyWait, Enter, D
}
sleep, 300
goto,Dialog4
}
if (Dial = 2)
{
sleep, 200
Dialog5:
TextD =
(
Просмотр
Редактирование
Назад
Выход
)
ShowDialog("2", "• Блокнот •", TextD, "")
KeyWait, Enter, D
Dial := getDialogIndex()
if (Dial = 4)
{
Exit
}
if (Dial = 3)
{
sleep, 300
goto,Dialog3
}
if (Dial = 2)
{
sleep, 200
ShowDialog("1", "• Блокнот •", BlocknotText2, "Enter")
Input, Otv, V, {Enter}
FormatTime, TimeString,, dd MMMM yyyy, HH:mm:ss
BlocknotText =
(
[%TimeString%] %Otv%
)
IniWrite, %BlocknotText%, %DIRSETTING%, Block, BlocknotText2
AddChatMessage("{32CD32}Пункт №2 в блокноте изменён!")
IniRead, BlocknotText2, %DIRSETTING%, Block, BlocknotText2
}
if (Dial = 1)
{
sleep, 200
TextD =
(
%BlocknotText2%
)
ShowDialog("0", "• Блокнот •", TextD, "Enter")
KeyWait, Enter, D
}
sleep, 300
goto,Dialog5
}
if (Dial = 3)
{
sleep, 200
Dialog6:
TextD =
(
Просмотр
Редактирование
Назад
Выход
)
ShowDialog("2", "• Блокнот •", TextD, "")
KeyWait, Enter, D
Dial := getDialogIndex()
if (Dial = 4)
{
Exit
}
if (Dial = 3)
{
sleep, 300
goto,Dialog3
}
if (Dial = 2)
{
sleep, 200
ShowDialog("1", "• Блокнот •", BlocknotText3, "Enter")
Input, Otv, V, {Enter}
FormatTime, TimeString,, dd MMMM yyyy, HH:mm:ss
BlocknotText =
(
[%TimeString%] %Otv%
)
IniWrite, %BlocknotText%, %DIRSETTING%, Block, BlocknotText3
AddChatMessage("{32CD32}Пункт №3 в блокноте изменён!")
IniRead, BlocknotText3, %DIRSETTING%, Block, BlocknotText3
}
if (Dial = 1)
{
sleep, 200
TextD =
(
%BlocknotText3%
)
ShowDialog("0", "• Блокнот •", TextD, "Enter")
KeyWait, Enter, D
}
sleep, 300
goto,Dialog6
}
if (Dial = 4)
{
sleep, 200
Dialog7:
TextD =
(
Просмотр
Редактирование
Назад
Выход
)
ShowDialog("2", "• Блокнот •", TextD, "")
KeyWait, Enter, D
Dial := getDialogIndex()
if (Dial = 4)
{
Exit
}
if (Dial = 3)
{
sleep, 300
goto,Dialog3
}
if (Dial = 2)
{
sleep, 200
ShowDialog("1", "• Блокнот •", BlocknotText4, "Enter")
Input, Otv, V, {Enter}
FormatTime, TimeString,, dd MMMM yyyy, HH:mm:ss
BlocknotText =
(
[%TimeString%] %Otv%
)
IniWrite, %BlocknotText%, %DIRSETTING%, Block, BlocknotText4
AddChatMessage("{32CD32}Пункт №4 в блокноте изменён!")
IniRead, BlocknotText4, %DIRSETTING%, Block, BlocknotText4
}
if (Dial = 1)
{
sleep, 200
TextD =
(
%BlocknotText4%
)
ShowDialog("0", "• Блокнот •", TextD, "Enter")
KeyWait, Enter, D
}
sleep, 300
goto,Dialog7
}
if (Dial = 5)
{
sleep, 200
Dialog8:
TextD =
(
Просмотр
Редактирование
Назад
Выход
)
ShowDialog("2", "• Блокнот •", TextD, "")
KeyWait, Enter, D
Dial := getDialogIndex()
if (Dial = 4)
{
Exit
}
if (Dial = 3)
{
sleep, 300
goto,Dialog3
}
if (Dial = 2)
{
sleep, 200
ShowDialog("1", "• Блокнот •", BlocknotText5, "Enter")
Input, Otv, V, {Enter}
FormatTime, TimeString,, dd MMMM yyyy, HH:mm:ss
BlocknotText =
(
[%TimeString%] %Otv%
)
IniWrite, %BlocknotText%, %DIRSETTING%, Block, BlocknotText5
AddChatMessage("{32CD32}Пункт №5 в блокноте изменён!")
IniRead, BlocknotText5, %DIRSETTING%, Block, BlocknotText5
}
if (Dial = 1)
{
sleep, 200
TextD =
(
%BlocknotText5%
)
ShowDialog("0", "• Блокнот •", TextD, "Enter")
KeyWait, Enter, D
}
sleep, 300
goto,Dialog8
}
sleep, 300
goto,Dialog3
}

if (chatinput = "/cam")
{
If (Cam = 1)
{
 AddChatMessage("{FF0000}RP отыгровка для Fraps / Bandicam отключена.")
 Cam := 0
}
else
{
 AddChatMessage("{32CD32}RP отыгровка для Fraps / Bandicam включена.")
 Cam := 1
}
IniWrite, %Cam%, %DIRSETTING%, Camera, Cam
}

if (RegExMatch(chatInput, "^\/убить ([0-9]*)", p))
{
 ID := GetID()
 Nick1 := getPlayerNameById(id)
 Nick1 := RegExReplace(Nick1, "_", A_Space)
 Nick := getPlayerNameById(p1)
 Nick := RegExReplace(Nick, "_", A_Space)
 SendChat("/do На поясе у " Nick1 " висит кобура. В кобуре Desert Eagle.")
 sleep, 700
 SendChat("/me быстро выхватил пистолет из кобуры")
 sleep, 700
 SendChat("/me передёрнул затвор и сделал несколько несмертельных выстрелов в " Nick)
 sleep, 700
 SendChat("/me сделал контрольный выстрел в голову " Nick)
}

if (RegExMatch(chatInput, "^\/сон ([0-9]*)", p))
{
 Nick := getPlayerNameById(p1)
 Nick := RegExReplace(Nick, "_", A_Space)
 SendChat("/do На поясе закреплён шприц.")
 sleep, 700
 SendChat("/me быстро схватил шприц и снял колпачок")
 sleep, 700
 SendChat("/me воткнул шприц в шею " Nick)
 sleep, 700
 SendChat("/me опустил поршень шприца, усыпив " Nick)
 sleep, 700
 SendChat("/me выбросил шприц с колпачком в сторону")
}

if (chatinput = "/менты")
{
 city := getPlayerCity()
 zone := getPlayerZone()
 SendChat("/f (( Ребят, менты вяжут в " City ", " Zone ". Помогите, пожалуйста! ))")
}

if (chatinput = "/хвост")
{
 city := getPlayerCity()
 zone := getPlayerZone()
 SendChat("/f (( Ребят, менты на хвосте в " City ", " Zone ". Помогите, пожалуйста! ))")
}

if (chatinput = "/камеры")
{
 SendChat("/do На поясе висит КПК.")
 sleep, 700
 SendChat("/me снял КПК с пояса и включил его")
 sleep, 700
 SendChat("/me запутил приложение JC")
 sleep, 700
 SendChat("/me нажал кнопку 'Свободная жизнь'")
 sleep, 700
 SendChat("/do Камеры в радиусе одного километра отключены.")
}

if (chatinput = "/перчатки")
{
 SendChat("/do На поясе висит пара новых перчаток.")
 sleep, 700
 SendChat("/me снял перчатки с пояса и одел их")
}

if (chatinput = "/растяжка")
{
 SendChat("/do На спине спец. рюкзак.")
 sleep, 700
 SendChat("/me быстро снял рюкзак и достал тонкую леску с гранатой 'Малыш' от JC")
 sleep, 700
 SendChat("/me одел рюкзак")
 sleep, 700
 SendChat("/me закрепил гранату на одной стороне проёма и протянул от неё леску к другой")
 sleep, 700
 SendChat("/me натянул леску и зафиксировал второй край")
 sleep, 700
 SendChat("/do Растяжка установлена.")
}

if (chatinput = "/бомба")
{
 SendChat("/do На спине спец. рюкзак.")
 sleep, 700
 SendChat("/me быстро снял рюкзак и достал непонятный куб с наклейкой 'JC'")
 sleep, 700
 SendChat("/me поставил куб на пол")
 sleep, 700
 SendChat("/anim 14")
 sleep, 700
 SendChat("/me нажал маленькую кнопку сбоку")
 sleep, 700
 SendChat("/do На кубе загорелся зелёный индикатор.")
 sleep, 300
 KolvoBomb := KolvoBomb + 1
 AddChatMessage("Бомб установлено: " KolvoBomb ".")
 sleep, 400
 SendChat("/me одел рюкзак на плечи и достал из кармана КПК")
 sleep, 700
 SendChat("/me включил КПК и зашёл в приложение 'Жаркий август'")
 sleep, 700
 SendChat("/me проверил связь между спец. блоком и КПК")
}

if (chatinput = "/взрыв")
{
 SendChat("/do КПК в руках с включённым приложением 'Жаркий август'.")
 sleep, 700
 SendChat("/me нажал кнопку 'Салют'")
 sleep, 700
 SendChat("/do КПК отправил данные на спец. куб.")
 sleep, 700
 SendChat("/do Заряд сдетонировал. Произошёл взрыв " KolvoBomb " бомб.")
 KolvoBomb := 0
}

if (chatinput = "/разминирование")
{
 SendChat("/do КПК в руках с включённым приложением 'Жаркий август'.")
 sleep, 700
 SendChat("/me нажал кнопку 'Спонсор'")
 sleep, 700
 SendChat("/do КПК отправил данные на спец. куб.")
 sleep, 700
 SendChat("/do Заряд деактивирован у " KolvoBomb " кубов. 'Кислота 5.47 JC' полностью уничтожила куб.")
 KolvoBomb := 0
}

if (chatinput = "/find")
{
 if (Finder = 1)
 {
 SendChat("/me достал КПК и включил его")
 Sleep, 600
 SendChat("/me проверил список сотрудников в штате")
 Sleep, 600
 SendChat("/me выключил КПК и убрал его")
 }
}

if (RegExMatch(chatInput, "^\/захват ([0-9]*)", p))
{
 SendChat("/do На спине висит спец. рюкзак.")
 sleep, 700
 SendChat("/me cнял рюкзак")
 sleep, 700
 SendChat("/me достал и распутал верёвку")
 sleep, 700
 SendChat("/tie " p1)
 sleep, 700
 SendChat("/me достал и открыл чёрный мешок")
 sleep, 700
 SendChat("/bag " p1)
 sleep, 700
 SendChat("/me обратно одел рюкзак")
}

if (RegExMatch(chatInput, "^\/свобода ([0-9]*)", p))
{
 SendChat("/do На спине висит спец. рюкзак.")
 sleep, 700
 SendChat("/me cнял рюкзак")
 sleep, 700
 SendChat("/bag " p1)
 sleep, 700
 SendChat("/me скомкал мешок и закинул в рюкзак")
 sleep, 700
 SendChat("/tie " p1)
 sleep, 700
 SendChat("/me собрал верёвку и положил в рюкзак")
 sleep, 700
 SendChat("/me повесил рюкзак на плечо")
}

if (RegExMatch(chatInput, "^\/rep (.*)", p))
{
 if p1 contains !
 {
 AddChatMessage("Не используйте знак восклицания!")
 }
 else
 {
 SendChat("/mn")
 Sleep, 300
 SendInput, {vk28 4}{Enter}
 Sleep, 300
 SendInput, %p1%{Enter}
 }
}

if (ChatInput = "/собес")
{
addChatMessage("{ADFF2F} Для выбора нужного пункта используйте клавишу Enter.")
addChatMessage("{FFFF99} Выберите пункт 'Выход', чтобы закрыть окно.")
Dialog2:
TextD =
(
Приветствие, просьба рассказать о себе
Проверка документов
Проверка RP термина
Выход
)
ShowDialog("2", "• Меню 'Собеседование' •", TextD, "")
KeyWait, Enter, D
Dial := getDialogIndex()
if (Dial = 4)
{
Exit
}
if (Dial = 1)
{
 SendChat("Приветствую. Представтесь и расскажите о себе.")
}
if (Dial = 2)
{
 SendChat("Отлично. Давайте глянем Ваши документы.")
 sleep, 600
 SendChat("Паспорт, лицензии и выписку, пожалуйста.")
}
if (Dial = 3)
{
 sleep, 200
 SendChat("{ADFF2F} После написания термина нажмите Enter.")
 ShowDialog("1", "Термин", "Напишите термин для проверки." , "Okey")
 Input, Otvet, V, {Enter}
 SendChat("/me достал карточку")
 sleep, 600
 SendChat("/me передал карточку человеку на против")
 sleep, 600
 SendChat("/do На карточке написано: " Otvet ".")
 sleep, 600
 SendChat("Как вы думаете, что это такое?")
}
 sleep, 300
 goto, Dialog2
}

if (RegExMatch(chatInput, "^\/hold ([0-9]*)", p))
{
Nick := getPlayerNameById(p1)
Nick := RegExReplace(Nick, "_", A_Space)
if (Pol = "Boy")
{
SendChat("/me заломал руку " Nick)
}
else
{
SendChat("/me заломала руку " Nick)
}
Sleep, 700
SendChat("/me ведёт " Nick " за собой")
}

if (chatinput = "/mask")
{
 if (Masker = 1)
 {
SendChat("/do В кармане лежит чёрная маска.")
Sleep, 700
if (Pol = "Boy")
{
SendChat("/me достал чёрную маску и одел её")
}
else
{
SendChat("/me достала чёрную маску и одела её")
}
}
}

if (chatinput = "/healme")
{
 If (healmer = 1)
 {
SendChat("/do На поясе висит спец. набор.")
Sleep, 700
if (Pol = "Boy")
{
SendChat("/me достал из набора шриц")
Sleep, 700
SendChat("/do В шприце 'Адреналин'.")
Sleep, 700
SendChat("/me вколол шприц в плечо и опустил поршень")
}
else
{
SendChat("/me достала из набора шриц")
Sleep, 700
SendChat("/do В шприце 'Адреналин'.")
Sleep, 700
SendChat("/me вколола шприц в плечо и опустила поршень")
}
}
}

if (chatinput = "/rang")
{
SendChat("/do На спине висит рюкзак.")
Sleep, 700
if (Pol = "Boy")
{
SendChat("/me снял рюкзак и достал новый бейдж")
Sleep, 700
SendChat("/me передал бейдж человеку")
Sleep, 700
SendInput, {F6}/rang{Space}
}
else
{
SendChat("/me сняла рюкзак и достала новый бейдж")
Sleep, 700
SendChat("/me передала бейдж человеку")
Sleep, 700
SendInput, {F6}/rang{Space}
}
}

if (chatinput = "/машина")
{
if (Pol = "Boy")
{
SendChat("/me достал брелок 'Jarvis System' и нажал кнопку [Open/Close]")
Sleep, 700
SendChat("/lock 1")
Sleep, 700
if (opencar = 1)
{
SendChat("/do Транспорт закрыт.")
opencar := 0
}
else
{
SendChat("/do Транспорт открыт.")
opencar := 1
}
}
else
{
SendChat("/me достала брелок 'Jarvis System' и нажала кнопку [Open/Close]")
Sleep, 700
SendChat("/lock 1")
Sleep, 700
if (opencar = 1)
{
SendChat("/do Транспорт закрыт.")
opencar := 0
}
else
{
SendChat("/do Транспорт открыт.")
opencar := 1
}
}
}

if (chatinput = "/changeform")
{
SendChat("/do На спине висит рюкзак.")
Sleep, 700
if (Pol = "Boy")
{
SendChat("/me снял рюкзак и достал новую форму")
Sleep, 700
SendChat("/me передал форму человеку")
}
else
{
SendChat("/me сняла рюкзак и достала новую форму")
Sleep, 700
SendChat("/me передала форму человеку")
}
Sleep, 700
SendInput, {F6}/changeskin{Space}
}

if (RegExMatch(chatInput, "^\/invite ([0-9]*)", p))
{
SendChat("/do На спине у " Name " висит рюкзак.")
Sleep, 700
if (Pol = "Boy")
{
SendChat("/me достал форму, рацию и бейдж из рюкзака")
Sleep, 700
SendChat("/me передал вещи человеку")
}
else
{
SendChat("/me достала форму, рацию и бейдж из рюкзака")
Sleep, 700
SendChat("/me передала вещи человеку")
}
Sleep, 700
Nick := getPlayerNameById(p1)
Nick := RegExReplace(Nick, "_", A_Space)
Sleep, 700
SendChat("/f " TegF " В наш коллектив был принят " nick ". Поздравим его!")
}

if (RegExMatch(chatInput, "^\/uninvite ([0-9]*) (.*)", p))
{
Nick := getPlayerNameById(p1)
Nick := RegExReplace(Nick, "_", A_Space)
if (Pol = "Boy")
{
SendChat("/me достал КПК и зашёл в базу данных предприятия")
Sleep, 700
SendChat("/me нашёл спец. дело нужного человека")
Sleep, 700
SendChat("/me поставил пометку 'Уволен'")
}
else
{
SendChat("/me достала КПК и зашла в базу данных предприятия")
Sleep, 700
SendChat("/me нашла спец. дело нужного человека")
Sleep, 700
SendChat("/me поставила пометку 'Уволен'")
}
Sleep, 700
SendChat("/f " TegF " Уволен сотрудник: " Nick ". Причина: " p2)
}

if (chatinput = "/viz")
{
 if (Pol = "Boy")
{
  SendChat("/do В верхнем кармашке лежит визитница.")
  sleep, 600
  SendChat("/me достал визитницу и вытащил визитку, затем передал её")
  sleep, 600
  SendChat("/do Написано: " Name " | № " Numb " | " Org " | " Role ".")
  sleep, 600
  SendChat("/me убрал визитницу обратно в кармашек")
}
else
{
  SendChat("/do В верхнем кармашке лежит визитница.")
  sleep, 600
  SendChat("/me достала визитницу и вытащила визитку, затем передала её")
  sleep, 600
  SendChat("/do Написано: " Name " | № " Numb " | " Org " | " Role ".")
  sleep, 600
  SendChat("/me убрал визитницу обратно в кармашек")
}
}

if (Ammo = 1)
{
if (chatinput = "/takeammo")
{
 sleep, 700
 if (Pol = "Boy")
{
  SendChat("/me напрягся и взял ящик")
}
else
{
  SendChat("/me напряглась и взяла ящик")
}
}

if (chatinput = "/putammo")
{
 sleep, 700
 if (Pol = "Boy")
{
  SendChat("/me облегчённо положил ящик")
}
else
{
  SendChat("/me облегчённо положила ящик")
}
}

if (chatinput = "/dropammo")
{
 sleep, 700
 if (Pol = "Boy")
{
  SendChat("/me собрался с силами и выбросил ящик")
}
else
{
  SendChat("/me собралась с силами и выбросила ящик")
}
}
}

if (chatinput = "/drive")
{
 if (Pol = "Boy")
{
 sleep, 700
 SendChat("/me достал КПК и нажал кнопку доставки транспорта")
 sleep, 400
 SendChat("/me убрал КПК обратно")
}
else
{
 sleep, 700
 SendChat("/me достала КПК и нажала кнопку доставки транспорта")
 sleep, 400
 SendChat("/me убрала КПК обратно")
}
}

if (chatinput = "/bomb")
{
 if (Pol = "Boy")
{
  SendChat("/me достал КПК и случайно уронил его")
  sleep, 500
  SendChat("/do Включённый КПК упал в лужу и стал искриться.")
  sleep, 500
  SendChat("/do Скоро будет взрыв КПК.")
 }
else
{
  SendChat("/me достала КПК и случайно уронила его")
  sleep, 500
  SendChat("/do Включённый КПК упал в лужу и стал искриться.")
  sleep, 500
  SendChat("/do Скоро будет взрыв КПК.")
}
}

if (chatinput = "/ud")
{
 if (Pol = "Boy")
{
  SendChat("/do В левом кармашке штанов лежит удостоверение.")
  sleep, 600
  SendChat("/me вытащил удостоверение и показал его")
  sleep, 600
  SendChat("/do Написано: " Name " | № " Numb " | " Org " | " Role ".")
  sleep, 600
  SendChat("/me закрыл удостоверение и положил обратно в карман")
}
else
{
  SendChat("/do В левом кармашке штанов лежит удостоверение.")
  sleep, 600
  SendChat("/me вытащил удостоверение и показал его")
  sleep, 600
  SendChat("/do Написано: " Name " | № " Numb " | " Org " | " Role ".")
  sleep, 600
  SendChat("/me закрыл удостоверение и положил обратно в карман")
}
}

if (RegExMatch(chatInput, "^\/fn (.*)", p))
{
SendChat("/f (( " p1 " ))")
}

if (RegExMatch(chatInput, "^\/хомут ([0-9]*)", p))
{
 Nick := getPlayerNameByID(p1)
 sleep, 300
 Nick := RegExReplace(Nick, "_", A_Space)
 SendChat("/do На поясе у " Name " весит нейлоновый хомут.")
 sleep, 600
  if (Pol = "Boy")
{
 SendChat("/me снял нейлоновый хомут и распрямил")
 sleep, 600
 SendChat("/me резко заломал " Nick " руки назад и закрепил хомутом")
}
else
{
 SendChat("/me сняла нейлоновый хомут и распрямила")
 sleep, 600
 SendChat("/me резко заломала " Nick " руки назад и закрепила хомутом")
}
 sleep, 600
 SendChat("/do Человек не может двигать руками.")
 sleep, 600
 SendChat("/me крепко держит " Nick " за плечо")
}

if (ChatInput = "/str")
{
addChatMessage("{ADFF2F} Для выбора нужного пункта используйте клавишу Enter.")
addChatMessage("{FFFF99} Выберите пункт 'Выход', чтобы закрыть окно.")
Dialog1:
TextD =
(
Проверить объявление № 1
Проверить объявление № 2
Проверить объявление № 3
Отправить объявление № 1
Отправить объявление № 2
Отправить объявление № 3
Выход
)
ShowDialog("2", "• Меню 'Три строки' •", TextD, "")
KeyWait, Enter, D
Dial := getDialogIndex()
if (Dial = 7)
{
Exit
}
if (Dial = 3)
{
AddchatMessage(Str7)
sleep, 400
AddchatMessage(Str8)
sleep, 400
AddchatMessage(Str9)
}
if (Dial = 6)
{
SendChat(Str7)
sleep, 400
SendChat(Str8)
sleep, 400
SendChat(Str9)
}
if (Dial = 2)
{
AddchatMessage(Str4)
sleep, 400
AddchatMessage(Str5)
sleep, 400
AddchatMessage(Str6)
}
if (Dial = 5)
{
SendChat(Str4)
sleep, 400
SendChat(Str5)
sleep, 400
SendChat(Str6)
}
if (Dial = 1)
{
AddchatMessage(Str1)
sleep, 400
AddchatMessage(Str2)
sleep, 400
AddchatMessage(Str3)
}
if (Dial = 4)
{
SendChat(Str1)
sleep, 400
SendChat(Str2)
sleep, 400
SendChat(Str3)
}
sleep, 300
goto,Dialog1
}
} ; Конец блока с нажатием "Enter".

Takegun:
if (Dostor = 1)
{
TempWeapon := getPlayerWeaponId()
if (Pol = "Boy")
{
if ((TempWeapon = 24)  && (GunHade != 2))
{
SendChat("/me достал пистолет из кобуры")
GunHade:=2
}
if ((TempWeapon = 3) && (GunHade != 3))
{
SendChat("/me снял дубинку с поясного держателя")
GunHade:=3
}
if ((TempWeapon = 23) && (GunHade != 4))
{
SendChat("/me достал пистолет из кобуры")
GunHade:=4
}
if ((TempWeapon = 25)  && (GunHade != 5))
{
SendChat("/me достал Shotgun из-за спины")
GunHade:=5
}
if ((TempWeapon = 29)  && (GunHade != 6))
{
SendChat("/me взял MP-5 в руки")
GunHade:=6
}
if ((TempWeapon = 31)  && (GunHade != 7))
{
SendChat("/me взял карабин М4А1 в руки")
GunHade:=7
}
if ((TempWeapon = 17)  && (GunHade != 8))
{
SendChat("/me надел противогаз")
Sleep 2000
SendChat("/me достал светошумовую гранату")
GunHade:=8
}
if ((TempWeapon = 1)  && (GunHade != 9))
{
SendChat("/me надел кастет на руку")
GunHade:=9
}
if ((TempWeapon = 5)  && (GunHade != 10))
{
SendChat("/me взял биту в руку")
GunHade:=10
}
if ((TempWeapon = 14)  && (GunHade != 11))
{
SendChat("/me развернул букет цветов")
GunHade:=11
}
if ((TempWeapon = 30)  && (GunHade != 12))
{
SendChat("/me взял автомат АК-47 в руки")
GunHade:=12
}
if ((TempWeapon = 33)  && (GunHade != 13))
{
SendChat("/me взял винтовку в руки")
GunHade:=13
}
if ((TempWeapon = 34)  && (GunHade != 14))
{
SendChat("/me взял снайперскую винтовку в руки")
GunHade:=14
}
if ((TempWeapon = 43)  && (GunHade != 15))
{
SendChat("/me достал фотоаппарат")
GunHade:=15
}
if ((TempWeapon = 46)  && (GunHade != 16))
{
SendChat("/me одел парашют на плечи")
GunHade:=16
}
if ((TempWeapon = 15)  && (GunHade != 17))
{
SendChat("/me достал элегантную трость")
GunHade:=17
}
}
else
{
if ((TempWeapon = 24)  && (GunHade != 2))
{
SendChat("/me достала пистолет из кобуры")
GunHade:=2
}
if ((TempWeapon = 3) && (GunHade != 3))
{
SendChat("/me сняла дубинку с поясного держателя")
GunHade:=3
}
if ((TempWeapon = 23) && (GunHade != 4))
{
SendChat("/me достала пистолет из кобуры")
GunHade:=4
}
if ((TempWeapon = 25)  && (GunHade != 5))
{
SendChat("/me достала Shotgun из-за спины")
GunHade:=5
}
if ((TempWeapon = 29)  && (GunHade != 6))
{
SendChat("/me взяла MP-5 в руки")
GunHade:=6
}
if ((TempWeapon = 31)  && (GunHade != 7))
{
SendChat("/me взяла карабин М4А1 в руки")
GunHade:=7
}
if ((TempWeapon = 17)  && (GunHade != 8))
{
SendChat("/me надела противогаз")
Sleep 2000
SendChat("/me достала светошумовую гранату")
GunHade:=8
}
if ((TempWeapon = 1)  && (GunHade != 9))
{
SendChat("/me надела кастет на руку")
GunHade:=9
}
if ((TempWeapon = 5)  && (GunHade != 10))
{
SendChat("/me взяла биту в руку")
GunHade:=10
}
if ((TempWeapon = 14)  && (GunHade != 11))
{
SendChat("/me развернула букет цветов")
GunHade:=11
}
if ((TempWeapon = 30)  && (GunHade != 12))
{
SendChat("/me взяла автомат АК-47 в руки")
GunHade:=12
}
if ((TempWeapon = 33)  && (GunHade != 13))
{
SendChat("/me взяла винтовку в руки")
GunHade:=13
}
if ((TempWeapon = 34)  && (GunHade != 14))
{
SendChat("/me взяла снайперскую винтовку в руки")
GunHade:=14
}
if ((TempWeapon = 43)  && (GunHade != 15))
{
SendChat("/me достала фотоаппарат")
GunHade:=15
}
if ((TempWeapon = 46)  && (GunHade != 16))
{
SendChat("/me одела парашют на плечи")
GunHade:=16
}
if ((TempWeapon = 15)  && (GunHade != 17))
{
SendChat("/me достала элегантную трость")
GunHade:=17
}
}
}
else
{
 SetTimer, Takegun, off
}
return

UnloadGun:
if (Dostor = 1)
{
TempWeapon := getPlayerWeaponId()
if (Pol = "Boy")
{
if ((TempWeapon != 24) && (GunHade = 2))
{
SendChat("/me убрал оружие в кобуру")
GunHade:=0
}
if ((TempWeapon != 3)  && (GunHade = 3))
{
SendChat("/me повесил дубинку на пояс")
GunHade:=0
}
if ((TempWeapon != 23)  && (GunHade = 4))
{
SendChat("/me убрал оружие в кобуру")
GunHade:=0
}
if ((TempWeapon != 25)  && (GunHade = 5))
{
SendChat("/me убрал Shotgun за спину")
GunHade:=0
}
if ((TempWeapon != 29)  && (GunHade = 6))
{
SendChat("/me повесил MP-5 на плечо")
GunHade:=0
}
if ((TempWeapon != 31)  && (GunHade = 7))
{
SendChat("/me убрал карабин М4А1 за спину")
GunHade:=0
}
if ((TempWeapon != 1)  && (GunHade = 9))
{
SendChat("/me снял кастет")
GunHade:=0
}
if ((TempWeapon != 5)  && (GunHade = 10))
{
SendChat("/me спрятал биту")
GunHade:=0
}
if ((TempWeapon != 14)  && (GunHade = 11))
{
SendChat("/do Цветы не в руках")
GunHade:=0
}
if ((TempWeapon != 30)  && (GunHade = 12))
{
SendChat("/me убрал АК-47 за спину")
GunHade:=0
}
if ((TempWeapon != 33)  && (GunHade = 13))
{
SendChat("/me убрал винтовку")
GunHade:=0
}
if ((TempWeapon != 34)  && (GunHade = 14))
{
SendChat("/me свернул снайперскую винтовку в чехол")
GunHade:=0
}
if ((TempWeapon != 43)  && (GunHade = 15))
{
SendChat("/me закрыл крышечкой объектив фотоаппарата")
GunHade:=0
}
if ((TempWeapon != 46)  && (GunHade = 16))
{
SendChat("/me снял парашют")
GunHade:=0
}
}
else
{
if ((TempWeapon != 24) && (GunHade = 2))
{
SendChat("/me убрала оружие в кобуру")
GunHade:=0
}
if ((TempWeapon != 3)  && (GunHade = 3))
{
SendChat("/me повесила дубинку на пояс")
GunHade:=0
}
if ((TempWeapon != 23)  && (GunHade = 4))
{
SendChat("/me убрала оружие в кобуру")
GunHade:=0
}
if ((TempWeapon != 25)  && (GunHade = 5))
{
SendChat("/me убрала Shotgun за спину")
GunHade:=0
}
if ((TempWeapon != 29)  && (GunHade = 6))
{
SendChat("/me повесила MP-5 на плечо")
GunHade:=0
}
if ((TempWeapon != 31)  && (GunHade = 7))
{
SendChat("/me убрала карабин М4А1 за спину")
GunHade:=0
}
if ((TempWeapon != 1)  && (GunHade = 9))
{
SendChat("/me сняла кастет")
GunHade:=0
}
if ((TempWeapon != 5)  && (GunHade = 10))
{
SendChat("/me спрятала биту")
GunHade:=0
}
if ((TempWeapon != 30)  && (GunHade = 12))
{
SendChat("/me убрала АК-47 за спину")
GunHade:=0
}
if ((TempWeapon != 33)  && (GunHade = 13))
{
SendChat("/me убрала винтовку")
GunHade:=0
}
if ((TempWeapon != 34)  && (GunHade = 14))
{
SendChat("/me свернула снайперскую винтовку в чехол")
GunHade:=0
}
if ((TempWeapon != 43)  && (GunHade = 15))
{
SendChat("/me закрыла крышечкой объектив фотоаппарата")
GunHade:=0
}
if ((TempWeapon != 46)  && (GunHade = 16))
{
SendChat("/me сняла парашют")
GunHade:=0
}
}
}
else
{
 SetTimer, UnloadGun, off
}
return

Zarplatka:
{
 ZapTime := 60-A_Min
 if (Zaptime = 2)
 {
 if (Zarpl = 1)
 {
 Voice := ComObjCreate("SAPI.SpVoice")
 Voice.Speak("Зарплата через две минуты")
 }
 addChatMessage("{0099FF}Через 2 минуты ожидается зарплата! Будьте внимательны и не выходите в AFK.")
 Sleep, 60000
 }
}
return

Active1:
{
If (Cam = 1)
{
SendChat("/do На одежде установлена скрытая камера.")
sleep, 400
if (Camera = 1)
{
if (Pol = "Boy")
{
SendChat("/me щёлкнул два раза пальцами, остановив камеру")
}
else
{
SendChat("/me щёлкнула два раза пальцами, остановив камеру")
}
Camera := 0
}
else
{
if (Pol = "Boy")
{
SendChat("/me щёлкнул два раза пальцами, запустив камеру")
}
else
{
SendChat("/me щёлкнула два раза пальцами, запустив камеру")
}
Camera := 1
}
}
}
return

Active2:
{
if (TegF != "-")
{
SendInput, {F6}/f %TegF%{Space}
if (Racia = 1)
{
if (Pol = "Boy")
{
SendChat("/me сказал что-то в беcпроводную гарнитуру")
}
else
{
SendChat("/me сказала что-то в беспроводную гарнитуру")
}
}
}
}
return

Active3:
{
FormatTime, TimeString,, dd MMMM yyyy, HH:mm:ss
ZpTime := 60-A_Min
SendChat("/c 60")
sleep, 400
if (Pol = "Boy")
{
SendChat("/me взглянул на часы марки 'Tosha Time'.")
}
else
{
SendChat("/me взглянула на часы марки 'Tosha Time'.")
}
sleep, 600
SendChat("/do На часах: [" TimeString "].")
sleep, 600
SendChat("/do До зарплаты: " ZpTime " мин. Текущее местоположение: " getPlayerZone())
}
return

Active4:
{
SendChat(Str1)
sleep, 400
SendChat(Str2)
sleep, 400
SendChat(Str3) 
}
return

Active5:
{
SendChat(Str4)
sleep, 400
SendChat(Str5)
sleep, 400
SendChat(Str6) 
}
return

Active6:
{
SendChat(Str7)
sleep, 400
SendChat(Str8)
sleep, 400
SendChat(Str9) 
}
return

Active7:
{
if (Pol = "Boy")
{
SendChat("/me достал брелок 'Jarvis System' и нажал кнопку [Open/Close]")
Sleep, 700
SendChat("/lock 1")
Sleep, 700
if (opencar = 1)
{
SendChat("/do Транспорт закрыт.")
opencar := 0
}
else
{
SendChat("/do Транспорт открыт.")
opencar := 1
}
}
else
{
SendChat("/me достала брелок 'Jarvis System' и нажала кнопку [Open/Close]")
Sleep, 700
SendChat("/lock 1")
Sleep, 700
if (opencar = 1)
{
SendChat("/do Транспорт закрыт.")
opencar := 0
}
else
{
SendChat("/do Транспорт открыт.")
opencar := 1
}
}
}
return

Chat:
{
if (Jarviscom = 1)
{
GlPlayerID := GetID()
GlPlayerName := GetPlayerNameById(GlPlayerID)
if IsChatLineText(GlPlayerName , "0")
{
If IsChatLineText("Jarvis, сколько времени?", "0")
{
 FormatTime, TimeString,, dd MMMM yyyy, HH:mm:ss
 ZpTime := 60-A_Min
 SendChat("/c 60")
 sleep, 100
 SendInput, {Enter}
 sleep, 600
 SendChat("/do [Jarvis System]: Секундочку.. Считываю данные с часов марки 'Tony Time'.")
 sleep, 600
 SendChat("/do На часах: [" TimeString "].")
 sleep, 600
 SendChat("/do До зарплаты: " ZpTime " мин. Текущее местоположение: " getPlayerZone())
}
If IsChatLineText("Jarvis, что делаешь?", "0")
{
if (Pol = "Boy")
{
 SendChat("/do [Jarvis System]: Выполняю ваши поручения, хозяин.")
}
else
{
 SendChat("/do [Jarvis System]: Выполняю ваши поручения, хозяйка.")
}
}
If IsChatLineText("Jarvis, как дела?", "0")
{
if (Pol = "Boy")
{
 SendChat("/do [Jarvis System]: Супер! Сам как?")
}
else
{
 SendChat("/do [Jarvis System]: Супер! Сама как?")
}
}
If IsChatLineText("Jarvis, что ты такое?", "0")
{
 SendChat("/do [Jarvis System]: Я-искуственный интеллект, созданный Испанцем.")
}
If IsChatLineText("Jarvis, где я?", "0")
{
 city := getPlayerCity()
 zone := getPlayerZone()
 SendChat("/do [Jarvis System]: Местоположение: " City ", " Zone ".")
}
If IsChatLineText("Jarvis, транспорт.", "0")
{
 SendChat("/do [Jarvis System]: Я подключился к управлению Т/C.")
 sleep, 400
 if (opencar = 1)
{
 SendChat("/do [Jarvis System]: Владелец, Ваш агрегат закрыт!")
opencar := 0
}
else
{
 SendChat("/do [Jarvis System]: Владелец, Ваш агрегат открыт!")
opencar := 1
}
 sleep, 400
 SendChat("/lock 1") 
}
If IsChatLineText("Jarvis, привет.", "0")
{
 SendChat("/do [Jarvis System]: Приветствую Вас, мой дорогой пользователь!")
}
If IsChatLineText("Jarvis, кто твой создатель?", "0")
{
 SendChat("/do [Jarvis System]: Anthony Versetti - Испанец. Да-да, он хороший человек!")
}
If IsChatLineText("Jarvis, что происходит в штате?", "0")
{
 SendChat("/do [Jarvis System]: В мире творится УЖАСНЫЙ ХАОС!")
}
If IsChatLineText("Jarvis, лучшая организация в штате?", "0")
{
 SendChat("/do [Jarvis System]: Конечно же " Org "!")
}
If IsChatLineText("Jarvis, кто сейчас подаст гос. новость?", "0")
{
 SendChat("/do [Jarvis System]: Какой-нибудь раздолбай или семья Versetti.")
}
If (IsChatLineText("Jarvis, шанс", "0")) or (IsChatLineText("Jarvis шанс", "0"))
{
 Random, randch1, 1,2
 Random, randch, 0,100
 Sleep, 300
 If (randch1 = 1)
 {
 SendChat("/do [Jarvis System]: Шанс состовляет " randch ", если считать в процентах.")
 }
 If (randch1 = 2)
 {
 SendChat("/do [Jarvis System]: " randch " является вероятностью для этого события, в процентах.")
 }
}
If (IsChatLineText("Jarvis, кто передо мной?", "0")) or (IsChatLineText("Кто передо мной, Jarvis?", "0"))
{
 GetPED := getClosestPlayerPed()
 ID := getIdByPed(GetPED)
 Nick := getPlayerNameById(ID)
 Score := getPlayerScoreById(ID) 
 Scin := getTargetPlayerSkinIdById(ID) 
 if ID =-1
 return
 Nick := RegExReplace(Nick, "_", A_Space)
 SendChat("/do [Jarvis System]: Перед вами " Nick ". Жетон человека: " ID ".")
 sleep 400
 SendChat("/do [Jarvis System]: В штате уже " Score " лет. Идентификатор одежды: " Scin ".")
}
}
}
If (IsChatLineText("Jarvis, доложи местоположение объекта №" ,"0")) && (IsChatLineText("Tosha_Russak" ,"0")) or (IsChatLineText("Jarvis, доложи местоположение объекта №" ,"0")) && (IsChatLineText("| Отправитель: Tosha_Russak" ,"0"))
{
 id := getID()
 SelectedFile = %A_MyDocuments%\GTA San Andreas User Files\SAMP\chatlog.txt
 fileread, read, %SelectedFile%
 RegExMatch(read, "\Qобъекта №\E([0-9]*)\Q.\E", p)
 if (id = p1)
 {
 city := getPlayerCity()
 zone := getPlayerZone()
 SendChat("/sms 1519 [Jarvis System]: " City ", " Zone ".")
 Sleep, 400
 SendChat("/do [Jarvis System]: Отправлены данные о местоположении по приказу Испанца.")
 }
 FileDelete, %SelectedFile%
 FileAppend, , %SelectedFile%
}
}
return

IsChatLineText(Text, Line)
{
	GetChatLine(Line, GetText)
if (inStr(GetText, Text))
    return true
else
	return false
}
return