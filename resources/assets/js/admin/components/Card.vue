<template lang="jade">
.card
    .card__header
        span.card__close(v-if="modal", @click="toggleModal(modalName)") &times;
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
                span.card__text.card__time-parking(v-if="data.date_end != ''", v-text="data.date_end")
                span.card__text.card__status.text_danger(v-else) Не выдано

        .col-lg-6.col-md-6.col-xs-6: .row
            .form__group(v-show="data.date_parking != ''")
                label.label Перевод на стоянку
                span.card__text.card__time-parking(v-text="data.date_parking")
        .col-lg-12.col-md-12.col-xs-12: .row
            button.btn.btn_default.card__edit(@click="toggleModal('editFine')", v-if="modal")
                i.fa.fa-edit
                | Редактировать    
            button.btn.btn_default.card__edit(@click="editFine", v-else)
                i.fa.fa-edit
                | Редактировать    
            button.btn.btn_danger.card__delete(@click="goToArchive", v-if="data.archive == 0")
                i.fa.fa-trash
                | Архивировать
</template>
<script>
import Card from '../mixins/Card';
import {mapMutations} from 'vuex';
var fields = {
    id: '',
    model: '',
    token_number: '',
    state_number: '',
    date_start: '',
    date_parking: '',
    date_end: '',
    time_start: '',
    time_parking: '',
    time_end: '',
    archive: 0,
    id_user: window.__INITIAL_STATE__.user.id
}
export default {
    name: 'card',
    props: ['info', 'modal', 'modalName'],
    mixins: [Card],
    data(){
        return {
            data: {...this.info}
        }
    },
    watch: {
        info: {
            deep: true,
            handler(val, oldVal){
                this.resetData();
                if (val !== null){
                    this.data.id = val.id;
                    this.data.model = val.model;
                    this.data.token_number = val.token_number;
                    this.data.state_number = val.state_number;
                    this.data.date_start = val.date_start;
                    this.data.date_parking = val.date_parking;
                    this.data.date_end = val.date_end;
                    this.data.archive = val.archive;
                }    
            }
        }
    },
    computed: {
        user(){
            return this.$store.state.user;
        }
    },
    methods: {
        ...mapMutations(['toggleModal']),
        goToArchive(){
            
            if (confirm('Вы действительно хотите сделать запись архивной?')){
                this.data.archive = 1;
                this.modal && this.$parent.loading();
                this.$store.dispatch('UPDATE_FINE', {
                    fine: this.data,
                    resolve: () => this.modal && this.$parent.success(),
                    reject: () => this.modal && this.$parent.error()
                });
            }
        },
        editFine(){
            this.$store.commit('setEditableCard', this.info);
            this.toggleModal('editFine');
        },
        resetData(){
            this.data.id =  '';
            this.data.model = '';
            this.data.token_number = '';
            this.data.state_number = '';
            this.data.date_start = '';
            this.data.date_parking = '';
            this.data.date_end = '';
            this.data.time_start = '';
            this.data.time_parking = '';
            this.data.time_end = '';
            this.data.archive = 0;
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