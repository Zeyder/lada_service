<template lang="jade">
overlay(:name="name"): .modal: .card(v-if="info != null")
    .card__header
        span.card__close(@click="toggleModal(name)") &times;
        .col-lg-6.col-md-6.col-xs-6: .row
            .form__group
                label.label ID
                span.card__text.card__id(v-text="data.id")
        .col-lg-6.col-md-6.col-xs-6: .row
            .form__group
                label.label ФИО
                span.card__text.card__name(v-text="data.full_name")
    .card__body
        .col-lg-6.col-md-6.col-xs-6: .row
            .form__group
                label.label Роль
                span.card__text.card__token-number(v-text="role.name") 
        .col-lg-6.col-md-6.col-xs-6: .row
            .form__group
                label.label Логин
                span.card__text.card__state-number(v-text="data.login")
            
        .col-lg-12.col-md-12.col-xs-12: .row
            button.btn.btn_default.card__edit(@click="toggleModal('editUser')")
                i.fa.fa-edit
                | Редактировать    
            button.btn.btn_danger.card__delete(@click="goDelete")
                i.fa.fa-trash
                | Удалить
</template>
<script>
import Overlay from './Overlay';
import {mapMutations} from 'vuex';
export default {
    name: 'modal-show-user',
    components: {Overlay},
    data(){
        return {
            name: 'showUser',
            data: {
                id: '',
                full_name: '',
                login: '',
                role: 1
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
        'info'(val, oldVal){
            if (val != null){
                this.data.id = val.id;
                this.data.full_name = val.full_name;
                this.data.login = val.login;
                this.data.role = val.role;
            }else{
                this.data.id = '';
                this.data.full_name = '';
                this.data.login = '';
                this.data.role = '';
            }
        }
    },
    computed: {
        info(){
            return this.$store.state.editableUser;
        },
        role(){
            return this.roles.find(item => {
                return item.id == this.data.role;
            });
        }
    },
    methods: {
        ...mapMutations(['toggleModal']),
        goDelete(){
            if (confirm('Вы действительно хотите удалить пользователя?')){
                
                this.$children[0].loading();
                this.$store.dispatch('DELETE_USER', {
                    user: this.data,
                    resolve: () => {
                        this.$children[0].success();
                        this.toggleModal('showUser');
                    },
                    reject: () => {
                        this.$children[0].error();
                    }
                });
            }
        }
    }
}
</script>
<style lang="stylus" scoped>
@import "../../../styl/admin/variables"

.card
    width 100%
    float left
    margin-top 15px
    box-shadow 0 1px 1px rgba(0,0,0, .1)
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
    &__edit
        float left
    &__delete
        float right
    &__edit
    &__delete
        margin-top 10px
    .label
        font-size 12px
        font-weight 300
    &__text
        font-size 18px
    &__header
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