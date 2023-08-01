# 🔥 SocialApp 
 Это проект для демонстрации по типу социальной сети для общения людей, которые хотят показать что-то интересное и обсудить это со своими друзьями и другими пользователями.

 Для начала вам необходимо зарегистрировать свой аккаунт и разместить в нем свой первый пост. Это делается просто и понадобится фото или изображение и описание. Другие пользователи увидят и прокомментируют его. Вы можете написать человеку напрямую или позвонить. Социальные сети сегодня являются наиболее распространенными и востребованными СМИ.
  Если бы мы писали описание к проекту для пользователей, оно начиналось бы так...
  
## Но мы пишем для коллег, поэтому уделим больше внимания именно тому, что из себя представляет данная работа с точки зрения написания кода

> Пара слов о задании: оно было для меня интересным, достаточно объёмным, творческим и весьма нетривиальным. Позволило реализовать и попрактиковать навыки и знания, полученные на курсе, а также получить новые. Спасибо!

## ✨ Требования

* Устройство Mac или Mackbook 
* Операционная система  MacOS
* Xcode — интегрированная среда разработки (IDE) программного обеспечения для платформ macOS, iOS, watchOS и tvOS, разработанная корпорацией Apple.
* Небольшие знания Swift

## 📌 Прототип и вариант дизайна
В задании сказано :
"Проект можно доработать, используя этот вариант дизайна. Ваш проект может отличаться от предложенного варианта." Этот проект выполнен в очень приближенном к оригиналу
* [Вариант дизайна](https://www.figma.com/file/s1N2cHHSmLScPf5dhDX8Oc/мобильные-приложения?type=design&node-id=724-2347&mode=design&t=CrsAB7JXQvzqCgW4-0) 
* [Прототип приложения](https://www.figma.com/proto/s1N2cHHSmLScPf5dhDX8Oc/мобильные-приложения?node-id=724-2348&scaling=scale-down&page-id=724%3A2347&starting-point-node-id=724%3A2348&show-proto-sidebar=1) 

![Стартовый экран приложения](https://raw.githubusercontent.com/OlesyaU/SocialApp/feature-1-add-readme/Стартовый%20экран.png){ width=100px height=200px }
![Text](https://raw.githubusercontent.com/OlesyaU/SocialApp/feature-1-add-readme/Стартовый%20экран.png){ width=100px height=200px }

## 🔴 Функции, реализованные в проекте

*В данном проекте все данные генерируются в папке "Models" в файле "DataBase.swift"  и существуют только для демонстрации необходимого функционала приложения в рамках задания дипломного проекта исходя из макетов и прототипа.*

* Все начинается со стартового контроллера, где можно выбрать как необходимо выполнить вход в приложение. Для удобства был создан тестовый профиль с номером +7 999 999 99 99. Его можно использовать, чтобы войти как зарегистрированный пользователь.
* На текстовых полях ввода имеются маски для номера и проверочного кода, в которых осущетсвляется проверка на валидность ввода данных. При регистрации нового пользователя в консоль распечатывается подтверждающий  регистрацию код  и если он введен верно (по итогам проверки), в Firebase происходит регистрация нового пользователя.
* После авторизации/регистрации пользователя открывается лента постов тех, на кого подписан пользователью если пользователь новый, загружается лента постов рандомных пользователей, находящихся в базе.
* Есть возможность посмотреть профиль автора поста. Для этого необходимо коснуться хэдэра поста с краткой информацией автора.
*  
* По тапу на изображение (картинку/фото) поста происходит переход к контроллеру комментариев и просмотр всех комментариев к посту.
* На экране комментария реализовано отображение даты в коротоком формате(требование макета), можно поставить/убрать лайк комментарию.
* В данном проекте реализовано сохранение постов в CoreData. Для этого надо тапнуть на иконку в виде книжной закладки.
* Удаление сохранённых постов происходит по свайпу влево.
* Реализовано добавление и изменение данных пользователя.

## ⚠️ Архитектура и структура 

* Для выполнения задания и реализации данного проекта выбрано архитектурное решение MVVM.
* Папки структурированы по порядку пользовательских шагов, начинаясь с начального контроллера и далее по ходу двух Flow из макета. 
* Главным контроллером для всех вкладок после входа/ регистрации пользователя является TabBarController, расположенный в папке "Main".
* Проект SocialApp поддерживатеся на iPad, а для удобства вёрстки создан отдельный файл в папке "Helpers". Туда же вынесены все константы и расширения, используемые всем проектом. Наборы цветов, шрифтов, иконок и прочее.


## 💬 Примечание

  - Я буду ждать комментарии по этому проекту. 

## 🤓 Author

** Олеся Украинская **
[GitHub](https://github.com/OlesyaU?tab=repositories)
[Telegram](https://t.me/@OlesyaUkrainskaya)

