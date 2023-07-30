# SocialApp - это проект по типу социальной сети для общения людей, которые хотят показать что-то интересное и обсудить это со своими друзьями и другими пользователями.

#### Для начала вам необходимо зарегистрировать свой аккаунт и разместить в нем свой первый пост. Это делается просто и понадобится фото или изображение и описание. Другие пользователи увидят и прокомментируют его. Вы можете написать человеку напрямую или позвонить ему/ей. Социальные сети сегодня являются наиболее распространенными и востребованными СМИ. Если бы мы писали описание к проекту для пользователей, оно начиналось бы так...

#  SocialApp - project like social network for communication people who want to show something interesting and discuss for their friends and other one users.

#### For start you have to create an account and post with photo or image and description for it. Other users will see and will comment the one. You can write directly for person or call him/her. Social media is the most widespread and demanded media today.

_______

# Но мы пишем для коллег, поэтому уделим больше внимания именно тому, что из себя представляет данная работа.

> Пара слов о задании: оно было для меня интересным, достаточно объёмным, творческим и весьма нетривиальным. Позволило реализовать и прокачать навыки и  знания, полученные на курсе. Спасибо!

В этом проекте все данные генерируются в папке "Models" в файле "DataBase.swift"  и существуют только для демонстрации необходимого функционала приложения в рамках задания дипломного проекта исходя из макетов и прототипа.
Все начинается со стартового контроллера , где можно выбрать как именно мы хотим войти в приложение. Для удобства был создан профиль с номером +7 999 999 99 99. Это если нам необходимо протестировать и войти не как новый пользователь, а как уже зарегистрированный. На полях имеются маски для ввода номеров и проверочного кода, проверка на валидность ввода данных в эти поля. При регистрации нового пользователя в консоль распечатывается подтверждающий  регистрацию код  и если он введен верно по итогам проверки, в Firebase происходит регистрация нового пользователя.
Проект SocialApp поддерживатеся на iPad, а для удобства вёрстки создан отдельный файл в папке "Helpers". Туда же вынесены все константы и расширения, используемые всем проектом. Наборы цветов, шрифтов, иконок и прочее.

Для выполнения задания и реализации данного проекта выбрано архитектурное решение MVVM. Папки структурированы по порядку, начинаясь с начального контроллера и далее по ходу двух Flow из макета. А главным контроллером для всех вкладок является, естественно - TabBarController, расположенный в папке "Main".

В данном проекте реализовано сохранение постов в CoreData. Для этого надо тапнуть на иконку в виде книжной закладки.

Для перехода в профиль пользователя, который сделал публикацию нужно произвести тап на хэдэр поста. После этого откроется контроллер с  профилем этого пользователя, с его галереей фотографий, постами этого пользователя и прочей информацией. По тапу на картинку поста откроется контроллер самой публикации, где можно увидеть количество комметариев, их владельцев, дату, и отметить комментарий как понравившийся, либо наоборот - убрать ранее поставленный проектом рандомно.

По нажатию на три точки в хэдэре поста откроется меню самой публикации.

При преходе на вкладку профиль заданного аккаунта (профиль с номером +7 999 999 99 99) мы увидим галерею фотографий, количество подпиок, подписчиков, публикаций. В шапке профиля есть переходы на контроллер с подробной информацией о пользователе, экран с редактированием информации о себе, и контоллер для расширения функционала проекта. 

# But we write for colleagues, so we will pay more attention to exactly what this work is.

> A couple of words about the task: it was interesting for me, quite voluminous, creative and very non-trivial. Allowed to implement and upgrade the skills and knowledge gained in the course. Thank you!

In this project, all data is generated in the 'Models' folder in the 'DataBase.swift' file and exists only to demonstrate the necessary functionality of the application as part of the assignment of the graduation project based on layouts and prototype.
It all starts with the start controller, where we can choose how exactly we want to enter the application. For convenience, a profile was created with the number +7 999 999 99 99. This is if we need to test and log in not as a new user, but as an already registered one. There are masks on the fields for entering numbers and a verification code, checking for the validity of entering data into these fields. When a new user registers, a registration confirmation code is printed to the console, and if it is entered correctly after verification, a new user is registered in Firebase.
The SocialApp project is supported on the iPad, and for the convenience of layout, a separate file has been created in the 'Helpers' folder. All constants and extensions used by the entire project are also placed there. Sets of colors, fonts, icons and more.

To complete the task and implement this project, the architectural solution MVVM was chosen. The folders are structured in order, starting with the initial controller and continuing down the two Flows from the layout. And the main controller for all tabs is, of course, the TabBarController located in the 'Main' folder.

In this project, saving posts in CoreData is implemented. To do this, tap on the icon in the form of a bookmark.
To go to the profile of the user who made the publication, you need to tap on the header of the post. After that, a controller will open with this user's profile, with his photo gallery, this user's posts and other information. By tapping on the image of the post, the controller of the publication itself will open, where you can see the number of comments, their owners, the date, and mark the comment as liked, or vice versa - remove the previously set randomly by the project.
By clicking on the three dots in the header of the post, the menu of the publication itself will open.

When you go to the profile tab of a given account (profile number +7 999 999 99 99), we will see a gallery of photos, the number of subscriptions, subscribers, publications. In the profile header there are transitions to the controller with detailed information about the user, a screen with editing information about yourself, and a controller to expand the functionality of the project.












