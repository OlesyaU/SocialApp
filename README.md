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
"Проект можно доработать, используя этот вариант дизайна. Ваш проект может отличаться от предложенного варианта." Этот проект выполнен в очень приближенном к оригинальному дизайну варианте. 
* [Вариант дизайна](https://www.figma.com/file/s1N2cHHSmLScPf5dhDX8Oc/мобильные-приложения?type=design&node-id=724-2347&mode=design&t=CrsAB7JXQvzqCgW4-0) 
* [Прототип приложения](https://www.figma.com/proto/s1N2cHHSmLScPf5dhDX8Oc/мобильные-приложения?node-id=724-2348&scaling=scale-down&page-id=724%3A2347&starting-point-node-id=724%3A2348&show-proto-sidebar=1)

<table>
  <tr>
    <td>Стартовый экран</td>
     <td>Экран регистрации</td>
     <td>Переход на экран подтверждения</td>
  </tr>
  <tr>
    <td><img src="https://raw.githubusercontent.com/OlesyaU/SocialApp/feature-1-add-readme/Стартовый%20экран.png"width="250" height="500"></td>
    <td><img src="https://raw.githubusercontent.com/OlesyaU/SocialApp/feature-1-add-readme/Экран%20регистрации.png" width="250" height="500"></td>
    <td><img src="https://raw.githubusercontent.com/OlesyaU/SocialApp/feature-1-add-readme/Переход%20на%20экран%20подтверждения.png" width="250" height="500"></td>
  </tr>
 </table>
 
 <table>
  <tr>
     <td>Подтверждение кодом</td>
    <td>Ввод проверочного кода</td>
     <td>Лента нового пользователя</td>
  </tr>
  <tr>
     <td><img src="https://raw.githubusercontent.com/OlesyaU/SocialApp/feature-1-add-readme/Подтверждение%20кодом.png" width="250" height="500"></td>
    <td><img src="https://raw.githubusercontent.com/OlesyaU/SocialApp/feature-1-add-readme/Ввод%20проверочного%20кода.png" width="250" height="500"></td>
    <td><img src="https://raw.githubusercontent.com/OlesyaU/SocialApp/feature-1-add-readme/Лента%20нового%20пользователя.png" width="250" height="500"></td>
  </tr>
 </table>

## 👨🏻‍💻 Взять себе копию проекта просто
* проходим по [ссылке](https://github.com/OlesyaU/SocialApp)
* ищем кнопку <img width="80" alt="кнопка код" src="https://github.com/OlesyaU/SocialApp/assets/53311515/6ecf32b4-4adb-4865-adf2-ba5a69086968"> , не сдерживаем себя, тапаем
* выбираем любой понравившийся вариант из этого списка
            <p float="left">
            <img width="250" alt="меню кнопки код" src="https://github.com/OlesyaU/SocialApp/assets/53311515/61cd7033-b0db-4e19-a4c1-3e64809723ff">
            <figure>
* готово ✔️


## 🔴 Функции, реализованные в проекте

*В данном проекте все данные генерируются в папке "Models" в файле "DataBase.swift"  и существуют только для демонстрации необходимого функционала приложения в рамках задания дипломного проекта исходя из макетов и прототипа.*

* Все начинается со стартового контроллера, где можно выбрать как необходимо выполнить вход в приложение. Для удобства был создан тестовый профиль с номером +7 999 999 99 99. Его можно использовать, чтобы войти как зарегистрированный пользователь.
    <table>
    <tr>
       <td>Экран входа зарегистрированного пользователя.png</td>
      <td>Экран зарегистрированного пользователя с некорректным номером</td>
       <td>Экран с сообщением о некорректном номере</td>
    </tr>
    <tr>
       <td><img src="https://raw.githubusercontent.com/OlesyaU/SocialApp/feature-1-add-readme/экран%20входа%20для%20зарегистрированного%20пользователя.png"     width="250" height="500"></td>
      <td><img src="https://raw.githubusercontent.com/OlesyaU/SocialApp/feature-1-add-readme/экран%20зарегистрированного%20пользователя%20с%20некорректным%20номером%20.png" width="250" height="500"></td>
      <td><img src="https://raw.githubusercontent.com/OlesyaU/SocialApp/feature-1-add-readme/экран%20с%20алертом%20о%20некорректном%20номере.png" width="250" height="500"></td>
     </tr>
    </table>
 * На текстовых полях ввода имеются маски для номера и проверочного кода, в которых осущетсвляется проверка на валидность ввода данных. При регистрации нового пользователя в консоль распечатывается подтверждающий  регистрацию код  и если он введен верно (по итогам проверки), в Firebase происходит регистрация нового пользователя.

     <table>
    <tr>
       <td>Экран регистрации нового пользователя</td>
        <td>Экран подтверждения регистрации</td>
       <td>Экран регистрации с некорректно введённым номером</td>
    </tr>
    <tr>
       <td><img src="https://raw.githubusercontent.com/OlesyaU/SocialApp/feature-1-add-readme/экран%20регистрации%C2%A02.png" width="250" height="500"></td>
      <td><img src="https://raw.githubusercontent.com/OlesyaU/SocialApp/feature-1-add-readme/экран%20подтверждения%20регистрации%20с%20введенным%20кодом.png" width="250" height="500"></td>
      <td><img src="https://raw.githubusercontent.com/OlesyaU/SocialApp/feature-1-add-readme/экран%20регистрации%20с%20алертом.png" width="250" height="500"></td>
    </tr>
   </table>

* После авторизации/регистрации пользователя открывается лента постов тех, на кого подписан пользователью если пользователь новый, загружается лента постов рандомных пользователей, находящихся в базе.
  
     <table>
    <tr>
       <td>Лента нового пользователя</td>
        <td>Лента нового пользователя с меню к посту</td>
       <td>Лента зарегистрированного пользователя</td>
    </tr>
    <tr>
       <td><img src="https://raw.githubusercontent.com/OlesyaU/SocialApp/feature-1-add-readme/лента%20нового%20пользователя%C2%A02.png" width="250" height="500"></td>
      <td><img src="https://raw.githubusercontent.com/OlesyaU/SocialApp/feature-1-add-readme/лента%20нового%20пользователя%20с%20меню%20к%20посту.png" width="250" height="500"></td>
      <td><img src="https://raw.githubusercontent.com/OlesyaU/SocialApp/feature-1-add-readme/лента%20зарегистрированного%20пользователя.png" width="250" height="500"></td>
    </tr>
   </table>
* Есть возможность посмотреть профиль автора поста. Для этого необходимо коснуться хэдэра поста с краткой информацией автора. Оттуда можно перейти на экран с подробной информацией, в фотогалерею автора у поста также есть меню.
  
   <table>
    <tr>
     <td>Профиль автора по тапу на хэдэр поста</td>
     <td>Подробная информация профиля автора</td>
     <td>Фотогалерея выбранного профиля</td>
    </tr>
    <tr>
       <td><img src="https://raw.githubusercontent.com/OlesyaU/SocialApp/feature-1-add-readme/профиль%20друга%20по%20тапу%20на%20хэдэр%20поста.png" width="250" height="500"></td>
      <td><img src="https://raw.githubusercontent.com/OlesyaU/SocialApp/feature-1-add-readme/подробная%20информация%20профиля%20друга.png" width="250" height="500">       </td>
      <td><img src="https://raw.githubusercontent.com/OlesyaU/SocialApp/feature-1-add-readme/фото%20галерея%20выбранного%20профиля%20.png" width="250" height="500">       </td>
    </tr>
   </table>

* По тапу на изображение (картинку/фото) поста происходит переход к контроллеру комментариев и просмотр всех комментариев к посту.

  <table>
    <tr>
     <td>Профиль автора по тапу на хэдэр поста</td>
     <td>Подробная информация профиля автора</td>
     <td>Фотогалерея выбранного профиля</td>
    </tr>
    <tr>
       <td><img src="https://raw.githubusercontent.com/OlesyaU/SocialApp/feature-1-add-readme/профиль%20друга%20по%20тапу%20на%20хэдэр%20поста.png" width="250" height="500"></td>
      <td><img src="https://raw.githubusercontent.com/OlesyaU/SocialApp/feature-1-add-readme/подробная%20информация%20профиля%20друга.png" width="250" height="500">       </td>
      <td><img src="https://raw.githubusercontent.com/OlesyaU/SocialApp/feature-1-add-readme/фото%20галерея%20выбранного%20профиля%20.png" width="250" height="500">       </td>
    </tr>
   </table>


  
* На экране комментария реализовано отображение даты в коротоком формате(требование макета), можно поставить/убрать лайк комментарию.
* В данном проекте реализовано сохранение постов в CoreData. Для этого надо тапнуть на иконку в виде книжной закладки.
* Строки приложения локализованы.
  <table>
    <tr>
     <td>Start screen</td>
     <td>Welcome Back screen</td>
     <td>Welcome back screen with error aleart</td>
    </tr>
    <tr>
       <td><img src="https://raw.githubusercontent.com/OlesyaU/SocialApp/feature-1-add-readme/start%20vc%20.png" width="250" height="500"></td>
      <td><img src="https://raw.githubusercontent.com/OlesyaU/SocialApp/feature-1-add-readme/welcome%20Back%20vc.png" width="250" height="500">       </td>
      <td><img src="https://raw.githubusercontent.com/OlesyaU/SocialApp/feature-1-add-readme/welcome%20back%20vc%20with%20error%20aleart.png" width="250" height="500">       </td>
    </tr>
   </table>
    <table>
    <tr>
     <td>Registered user feed</td>
     <td>User dots menu</td>
     <td>User photo collection</td>
    </tr>
    <tr>
       <td><img src="https://raw.githubusercontent.com/OlesyaU/SocialApp/feature-1-add-readme/registered%20user%20feed.png" width="250" height="500"></td>
      <td><img src="https://raw.githubusercontent.com/OlesyaU/SocialApp/feature-1-add-readme/registered%20user%20dots%20menu.png" width="250" height="500">         
      </td>
      <td><img src="https://raw.githubusercontent.com/OlesyaU/SocialApp/feature-1-add-readme/user%20photo%20collection%20.png" width="250" height="500">       </td>
    </tr>
   </table>

* Удаление сохранённых постов происходит по свайпу влево.
* Реализовано добавление и изменение данных пользователя.
    <table>
    <tr>
     <td>Profile detailed information screen</td>
     <td>Saved post screen</td>
     <td>Correct user data screen</td>
    </tr>
    <tr>
       <td><img src="https://raw.githubusercontent.com/OlesyaU/SocialApp/feature-1-add-readme/friend%20profile%20detailed%20information%20VC.png" width="250" height="500"></td>
      <td><img src="https://raw.githubusercontent.com/OlesyaU/SocialApp/feature-1-add-readme/saved%20post%20vc.png" width="250" height="500">       </td>
      <td><img src="https://raw.githubusercontent.com/OlesyaU/SocialApp/feature-1-add-readme/correct%20user%20data%20controller.png" width="250" height="500">       </td>
    </tr>
   </table>


## ⚠️ Архитектура и структура 

* Для выполнения задания и реализации данного проекта выбрано архитектурное решение MVVM.
* Папки структурированы по порядку пользовательских шагов, начинаясь с начального контроллера и далее по ходу двух Flow из макета. 
* Главным контроллером для всех вкладок после входа/ регистрации пользователя является TabBarController, расположенный в папке "Main".
* Проект SocialApp поддерживатеся на iPad, а для удобства вёрстки создан отдельный файл в папке "Helpers". Туда же вынесены все константы и расширения, используемые всем проектом. Наборы цветов, шрифтов, иконок и прочее.


## 💬 Примечание

  - Я буду ждать замечания, правки и комментарии по этому проекту. 

## 🤓 Author

**Олеся Украинская**
* [GitHub](https://github.com/OlesyaU?tab=repositories)    
* [Telegram](https://t.me/@OlesyaUkrainskaya)
  
  <p align="center">
  <img width="50" src="https://github.com/OlesyaU/SocialApp/assets/53311515/d5de75f3-0aaf-4ffc-a466-b177cddcc2da">   
  </p>
           
                                                                                      
