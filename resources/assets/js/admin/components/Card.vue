<template lang="jade">
.card
    .card__header
        span.card__close(v-if="modal", @click="closeModal(modalName)") &times;
        .col-lg-6.col-md-6.col-xs-6: .row
            .form__group
                label.label ID
                span.card__text.card__id(v-text="data.id")
            .form__group
                label.label Марка и модель
                span.card__text.card__model(v-text="data.model")
        .col-lg-6.col-md-6.col-xs-6: .row
            .form__group
                label.label Номер жетона
                span.card__text.card__token-number(v-text="data.token_number") 
            .form__group
                label.label Государственный номер
                span.card__text.card__state-number(v-text="data.state_number")
    .card__body
        .col-lg-6.col-md-6.col-xs-6: .row
            .form__group
                label.label Задержание
                span.card__text.card__time-start(v-text="data.date_start")
            .form__group
                label.label Выдача
                span.card__text.card__time-parking(v-if="info.date_end != ''", v-text="data.date_end")
                span.card__text.card__status(v-else)
                    i.fa.fa-warning(v-if="getStatus(info) != 'Выдано'")
                    i.fa.fa-check-square(v-if="getStatus(info) == 'Выдано'")
                    | {{getStatus(info)}}
        .col-lg-6.col-md-6.col-xs-6: .row
            .form__group(v-show="info.date_parking != ''")
                label.label Перевод на стоянку
                span.card__text.card__time-parking(v-text="data.date_parking")
        .col-lg-12.col-md-12.col-xs-12: .row
            button.btn.btn_default.card__edit(@click="toggleModal('editFine')")
                i.fa.fa-edit
                | Редактировать    
            button.btn.btn_danger.card__delete(@click="goToArchive")
                i.fa.fa-trash
                | Архивировать
</template>
<script>
import Card from '../mixins/Card';
import {mapMutations} from 'vuex';
export default {
    name: 'card',
    props: ['info', 'position', 'modal', 'modalName'],
    mixins: [Card],
    data(){
        return {
            data: {...this.info}
        }
    },
    watch: {
        'info'(val, oldVal){
            this.data = val;
        }
    },
    computed: {
        user(){
            return this.$store.state.user;
        }
    },
    methods: {
        ...mapMutations([
            'toggleModal'
        ]),
        goToArchive(){
            if (confirm('Вы действительно хотите сделать запись архивной?')){
                this.data.archive = 1;
                this.$parent.loading();
                this.$store.dispatch('UPDATE_FINE', {
                    fine: this.data,
                    resolve: () => {
                        this.$parent.success();
                    },
                    reject: () => {
                        this.$parent.error();
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