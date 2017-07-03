<template lang="jade">
.modal: form.form(@submit.prevent="submitForm")
    .modal__header
        span.modal__close(@click="cancelModal") &times;
        .form__group
            label.label(for="form-full_name") ФИО пользователя
            input.input#form-full_name(type="text", placeholder="Укажите ФИО", autocomplete="false", v-model="form.fields.full_name", :class="{'input_invalid': !isValidFullName && form.submit, 'input_valid': isValidFullName}")
        .form__group
            label.label(for="form-login") Логин
            input.input#form-login(v-if="method == 'insert'", type="text", placeholder="Не менее 6 знаков", autocomplete="false", v-model="form.fields.login", :class="{'input_invalid': !isValidLogin && form.submit, 'input_valid': isValidLogin}")
            input.input#form-login(v-else, type="text", v-model="form.fields.login", disabled)
        .form__group
            label.label(for="form-role") Роль пользователя
            select.input#form-role(v-model="form.fields.role"): option(v-for="role in roles", :value="role.id", v-text="role.name")
    .modal__body
        .col-lg-6.col-md-6.col-xs-12.padding_none_left: .form__group
            label.label(for="form-password") Пароль
            input.input#form-password(type="password", placeholder="Не менее 6 знаков", autocomplete="false", v-model="form.fields.password", :class="{'input_invalid': !isValidPassword && form.submit, 'input_valid': isValidPassword}")
        .col-lg-6.col-md-6.col-xs-12.padding_none_right: .form__group
            label.label(for="form-password_confirmation") Повторите пароль
            input.input#form-password_confirmation(type="password", placeholder="Повторите пароль", autocomplete="false", v-model="form.fields.password_confirmation", :class="{'input_invalid': !isValidRepeatPassword && form.submit, 'input_valid': isValidRepeatPassword}")
        .col-lg-12.col-md-12.col-xs-12: .row 
            button.btn.btn_default.modal__save(v-if="method == 'insert'") Добавить
            button.btn.btn_default.modal__save(v-if="method == 'update'") Сохранить
            button.btn.btn_default.btn_transparent.modal__cancel(v-if="method == 'update'", type="button", @click="cancelModal") Отмена
</template>
<script>
import validation from '../functions/validation';
import {mapMutations} from 'vuex';
let fields = {
    id: '',
    login: '',
    full_name: '',
    role: 1
}
export default {
    props: ['data', 'method'],
    name: 'form-user',
    data(){
        return {
            form: {
                fields: {
                    ...fields,
                    password: '',
                    password_confirmation: '',
                },
                submit: false,
                status: -1
            },
            roles: [
                {
                    id: 1,
                    name: 'Пользователь'
                },
                {
                    id: 2,
                    name: 'Администратор'
                }
            ]
        }
    },
    watch: {
        data: {
            deep: true,
            handler(val, oldVal){
                this.resetForm();
                if (val != null){
                    this.form.fields.id = val.id,
                    this.form.fields.login = val.login;
                    this.form.fields.full_name = val.full_name;
                    this.form.fields.role = val.role;
                }
            }
        }
    },
    computed: {
        editableUser(){
            return this.$store.state.editableUser;
        },
        isValidFullName(){
            return validation(this.form.fields.full_name, 2);
        },
        isValidLogin(){
            return validation(this.form.fields.login, 6);
        },
        isValidPassword(){
            return validation(this.form.fields.password, 6);
        },
        isValidRepeatPassword(){
            return validation(this.form.fields.password_confirmation, 6) && this.form.fields.password_confirmation == this.form.fields.password;
        },
        isValidForm(){
            return this.isValidFullName && this.isValidLogin && this.isValidPassword && this.isValidRepeatPassword;
        }
    },
    methods: {
        ...mapMutations({
            close: 'toggleModal'
        }),
        submitForm(){
            if (this.method == 'insert'){
                this.form.submit = true;
                if (this.isValidForm){
                    this.$parent.loading();
                    this.$store.dispatch('ADD_USER', {
                        user: this.form.fields,
                        resolve: () => {
                            this.$parent.success();
                            this.resetForm();
                        },
                        reject: e => this.$parent.error()
                    });
                }
            }else{
                if (this.form.fields.full_name != ''){
                    let user = {
                        id: this.form.fields.id,
                        login: this.form.fields.login,
                        full_name: this.form.fields.full_name,
                        role: this.form.fields.role
                    }
                    if (this.form.fields.password != '' && this.form.fields.password_confirmation != ''){
                        user['password'] = this.form.fields.password;
                        user['password_confirmation'] = this.form.fields.password_confirmation;
                    }
                    this.$parent.loading();
                    this.$store.dispatch('UPDATE_USER', {
                        user,
                        resolve: () => {
                            this.$parent.success();
                            this.form.fields.password = '';
                            this.form.fields.password_confirmation = '';
                        },
                        reject: e => this.$parent.error()
                    });
                }else{
                    this.form.submit = true;
                }
            }
        },
        cancelModal(){
            if (this.method == 'insert'){
                if ((this.form.fields.login != '' || this.form.fields.full_name != '' || this.form.fields.password != '') && confirm('Вы действительно хотите отменить действия?')){
                    this.close();
                    this.resetForm();
                    this.$parent.closeWrapper();
                }
            }else{
                if ((this.form.fields.role != this.data.role || this.form.fields.full_name != this.data.full_name || this.form.fields.password != '' || this.form.fields.password_confirmation != '') && confirm('Вы действительно хотите отменить действия?')){
                    this.close();
                    this.$parent.closeWrapper();
                }
                if (this.form.fields.role == this.data.role && this.form.fields.full_name == this.data.full_name && this.form.fields.password == '' && this.form.fields.password_confirmation == ''){
                    this.close();
                    this.$parent.closeWrapper();
                }
            }
        },
        resetForm(){
            for(let field in this.form.fields){
                this.form.fields[field] = '';
            }
            this.form.fields.role = this.roles[0].id;
            this.form.submit = false;
        }
        
    }
}
</script>
<style lang="stylus" scoped>
@import "../../../styl/admin/variables"
.modal
    width 100%
    float left
    margin-top 15px
    box-shadow 0 1px 1px rgba(0,0,0, .1)
    &__save
    &__cancel
        margin-top 10px
    &__cancel
        margin-left 10px
    &__close
        width 45px
        height @width
        display block
        position absolute
        text-align center
        line-height (@height - 2px)
        cursor pointer
        top 0
        right 0
        font-size 32px
        font-weight 300
        color darken(gray, 30%)
        z-index 88
    .label
        font-size 12px
        font-weight 300
    &__text
        font-size 18px
    &__header
        padding-top 30px !important
        background-color #fff
        border-bottom 1px solid rgba(0,0,0, .1)
        position relative
    &__body
        background-color lighten(gray, 50%)
    &__header
    &__body
        padding 20px
        width 100%
        float left
</style>