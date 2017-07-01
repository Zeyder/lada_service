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
        link(href="https://fonts.googleapis.com/css?family=Roboto:300,400,700&amp;subset=cyrillic", rel="stylesheet")
        link(href="{{mix('css/admin/styles.css')}}", rel="stylesheet")
        title Admin Panel
    body
        #app
        script window.__INITIAL_STATE__ = {!!$data!!};
        script(src="{{mix('js/admin/app.js')}}")