doctype html
html(lang="{{ config('app.locale') }}")
    head
        base(href="/")
        meta(charset="utf-8")
        meta(name="viewport", content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no, minimal-ui")
        meta(http-equiv="X-UA-Compatible", content="IE=edge,chrome=1")
        meta(name="mobile-web-app-capable", content="yes")
        meta(name="robots", content="index, follow")
        meta(name="format-detection", content="telephone=no")
        meta(name="csrf-token", content="{{ csrf_token() }}")
        link(href="{{mix('css/admin/styles.css')}}", rel="stylesheet")
        title Панель управления
    body: .container.container_xs: form.form.form_login(action="{{ route('login') }}", method="POST")
        {{ csrf_field() }}
        .form__header: h2.form__title Авторизация
        .form__group
            label.label(for="login") Логин
            input.input#login(type="text", placeholder="Логин", name="login")
        .form__group
            label.label(for="password") Пароль
            input.input#password(type="password", placeholder="Пароль", name="password")
        .form__group
            label.label
                input.checkbox(type="checkbox", name="remember") 
                span.label__text Запомнить меня
        button.btn.btn_primary.btn_block Войти