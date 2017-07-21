<template lang="jade">
form.form(@submit.prevent="submit")
    .form-state-default
        .form-group: h2.text-size-h3.text-color-red Узнайте про ваш автомобиль
        .form-group: p Если он находится на нашей <br> специализированной стоянке, вы можете узнать дату поступления и номер жетона ГИБДД
        .form-group: p Введите государственный регистрационный номер
        .form-group: input.input(type="text", placeholder="Например, н384ху03", v-model="state_number")
        button.btn.btn-danger.btn-block
            i.icon-send.icon-margin-md
            | Отправить запрос
    .form-state-loading(v-if="status == 1"): .form-preloader
    .form-state-success.text-left(v-if="status == 2")
        .form-group: b.text-size-h3.text-color-red Информация по этому <br> номеру найдена.
        .form-group
            label.label.opacity-5 Государственный номер
            span.text-size-h4.weight-normal(v-text="obj.state_number")
        .col-lg-6.col-md-6.col-xs-6.padding-none: .row: .form-group
            label.label.opacity-5 Дата приемки
            span.text-size-h4.weight-normal(v-text="obj.date_start")
        .col-lg-6.col-md-6.col-xs-6.padding-none: .row: .form-group
            label.label.opacity-5 Номер жетона
            span.text-size-h4.weight-normal(v-text="obj.token_number")
        .col-lg-12.col-md-12.col-xs-12.padding-none: .row: button.btn.btn-black.btn-block(type="button", @click="status = 0") Вернуться к вводу номера

    .form-state-fail.text-left(v-if="status == 3")
        .form-group: b.text-size-h3.text-color-red К сожалению, <br> информации по этому номеру <br> не найдено в нашей базе.
        .form-group: button.btn.btn-black.btn-block(type="button", @click="status = 0") Ввести другой номер
        span Если у вас транспортное средство без номера, <br> попробуйте позвонить нам по телефону.

</template>
<script>
import axios from 'axios';
export default {
    name: 'search-form',
    data(){
        return {
            status: 0,
            state_number: '',
            obj: {
                token_number: '',
                state_number: '',
                date_start: ''
            }
        }
    },
    methods: {
        submit(){
            if (this.state_number != ''){
                this.status = 1;
                axios.get(`${window.location.origin}/api/v1/fines/search/${this.state_number.trim().toUpperCase()}`).then(response => {
                    this.obj = response.data;
                    this.obj.state_number = this.state_number;
                    this.status = 2;
                    this.state_number = '';
                }).catch(e => {
                    this.status = 3;
                    this.state_number = '';
                });
            }
        }
    }
}
</script>