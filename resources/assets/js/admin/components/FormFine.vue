<template lang="jade">
.modal: form.form(@submit.prevent="submitForm")
    .modal__header: .row
        span.modal__close(@click="cancelModal") &times;
        .col-lg-6.col-md-6.col-xs-12
            .col-lg-4.col-md-4.col-xs-12: .row: .form__group
                label.label ID
                input.input.input_short(type="text", v-model="form.fields.id", disabled)
            .col-lg-12.col-md-12.col-xs-12
            .col-lg-12.col-md-12.col-xs-12: .row: .form__group
                label.label Марка и модель
                input.input(type="text", v-model="form.fields.model", :class="{'input_invalid': form.submit && !isValidModel}")
        .col-lg-6.col-md-6.col-xs-12
            .col-lg-4.col-md-4.col-xs-12: .row: .form__group
                label.label Номер жетона
                autocompleter(:items="filteredTokenNumbers", @data-change="changeToken", :startVal="form.fields.token_number", :class="{'input_invalid': form.submit && !isValidTokenNumber}")
            .col-lg-12.col-md-12.col-xs-12
            .col-lg-8.col-md-8.col-xs-8: .row: .form__group
                label.label Государственный номер
                input.input(type="text", v-model="form.fields.state_number", :class="{'input_invalid': form.submit && !isValidStateNumber}")
    .modal__body: .row
        .col-lg-6.col-md-6.col-xs-12
            .col-lg-8.col-md-8.col-xs-8: .row: .form__group
                label.label Перевод на стоянку
                date-input(:date="form.fields.date_parking", @date-change="changeDateParking", :class="{'input_invalid': form.submit && !isValidDateParking}")
            .col-lg-4.col-md-4.col-xs-4.padding_none_right: .form__group
                label.label &nbsp;
                input.input(type="text", v-model="form.fields.time_parking", v-mask="'00:00'", :class="{'input_invalid': form.submit && !isValidTimeParking}")
            .col-lg-8.col-md-8.col-xs-8: .row: .form__group
                label.label Выдача
                date-input(:date="form.fields.date_end", @date-change="changeDateEnd", :class="{'input_invalid': form.submit && !isValidDateEnd}")
            .col-lg-4.col-md-4.col-xs-4.padding_none_right: .form__group
                label.label &nbsp;
                input.input(type="text", v-model="form.fields.time_end", v-mask="'00:00'", :class="{'input_invalid': form.submit && !isValidTimeEnd}")
        .col-lg-6.col-md-6.col-xs-12
            .col-lg-8.col-md-8.col-xs-8: .row: .form__group
                label.label Задержание
                date-input(:date="form.fields.date_start", @date-change="changeDateStart", :class="{'input_invalid': form.submit && !isValidDateStart}")
            .col-lg-4.col-md-4.col-xs-4.padding_none_right: .form__group
                label.label &nbsp;
                input.input(type="text", v-model="form.fields.time_start", v-mask="'00:00'", :class="{'input_invalid': form.submit && !isValidTimeStart}")
        .col-lg-12.col-md-12.col-xs-12
            button.btn.btn_default.modal__save(v-if="method == 'update'") Сохранить изменения
            button.btn.btn_default.modal__save(v-if="method == 'insert'") Добавить
            button.btn.btn_default.btn_transparent.modal__cancel(@click="cancelModal", type="button") Отменить
</template>
<script>
import DateInput from './DateInput';
import Autocompleter from './Autocompleter';
import {mapMutations, mapGetters} from 'vuex';
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
    props: ['data', 'method'],
    components: {DateInput, Autocompleter},
    data(){
        return {
            form: {
                fields: JSON.parse(JSON.stringify(fields)),
                submit: false,
            }
        }
    },
    watch: {
        data: {
            deep: true,
            handler(val, oldVal){
                this.resetForm();
                this.initData(val);
            }
        }
    },
    computed: {
        ...mapGetters([
            'filteredTokenNumbers'
        ]),
        isValidModel(){
            return this.form.fields.model.trim() != '';
        },
        isValidStateNumber(){
            return this.form.fields.state_number.trim() != '';
        },
        isValidTokenNumber(){
            return this.form.fields.token_number.trim() != '';
        },
        isValidDateStart(){
            return this.form.fields.date_start.trim() != '';
        },
        isValidDateParking(){
            return this.form.fields.date_parking.trim() != '';
        },
        isValidDateEnd(){
            return this.form.fields.date_end.trim() != '';
        },
        isValidTimeStart(){
            return this.form.fields.time_start.trim() != '';
        },
        isValidTimeParking(){
            return this.form.fields.time_parking.trim() != '';
        },
        isValidTimeEnd(){
            return this.form.fields.time_end.trim() != '';
        }
    },
    methods: {
        ...mapMutations({
            close: 'toggleModal'
        }),
        initData(val){
            if (val != null){
                this.form.fields.id = val.id ? val.id : '';
                this.form.fields.model = val.model ? val.model : '',
                this.form.fields.token_number = val.token_number ? val.token_number : '',
                this.form.fields.state_number = val.state_number ? val.state_number : '',
                this.form.fields.date_start = val.date_start.trim() != '' ? val.date_start.split(' ')[0] : '',
                this.form.fields.date_parking = val.date_parking.trim() != '' ? val.date_parking.split(' ')[0] : '',
                this.form.fields.date_end = val.date_end.trim() != '' ? val.date_end.split(' ')[0] : '',
                this.form.fields.time_start = val.date_start.trim() != '' ? val.date_start.split(' ')[1] : '',
                this.form.fields.time_parking = val.date_parking.trim() != '' ? val.date_parking.split(' ')[1] : '',
                this.form.fields.time_end = val.date_end.trim() != '' ? val.date_end.split(' ')[1] : '',
                this.form.fields.archive = val.archive ? val.archive : 0
            }
        },
        changeDateStart(val){
            this.form.fields.date_start = val;
        },
        changeDateParking(val){
            this.form.fields.date_parking = val;
        },
        changeDateEnd(val){
            this.form.fields.date_end = val;
        },
        changeToken(val){
            this.form.fields.token_number = val;
        },
        submitForm(){
            let fine = {
                ...this.form.fields,
                date_start: this.isValidDateStart && this.isValidTimeStart ? `${this.form.fields.date_start} ${this.form.fields.time_start}` : '',
                date_parking: this.isValidDateParking && this.isValidTimeParking ? `${this.form.fields.date_parking} ${this.form.fields.time_parking}` : '',
                date_end: this.isValidDateEnd && this.isValidTimeEnd ? `${this.form.fields.date_end} ${this.form.fields.time_end}` : '',
            }
            this.$parent.loading();
            if (this.method == 'update'){
                this.$store.dispatch('UPDATE_FINE', {
                    fine,
                    resolve: () => {
                        this.$parent.success();
                    },
                    reject: () => {
                        this.$parent.error();
                    }
                });
            }else{
                
                this.$store.dispatch('ADD_FINE', {
                    fine,
                    resolve: () => {
                        this.$parent.success();
                        this.resetForm();
                    },
                    reject: () => {
                        this.$parent.error();
                    }
                })
            }
        },
        cancelModal(){
            let changed = false;
            if (this.data != null){
                changed = changed || (this.data.model != this.form.fields.model);
                changed = changed || (this.data.state_number != this.form.fields.state_number);
                changed = changed || (this.data.token_number != this.form.fields.token_number);
                changed = changed || (this.data.date_start != (this.form.fields.date_start + ' ' + this.form.fields.time_start).trim());
                changed = changed || (this.data.date_parking != (this.form.fields.date_parking + ' ' + this.form.fields.time_parking).trim());
                changed = changed || (this.data.date_end != (this.form.fields.date_end + ' ' + this.form.fields.time_end).trim());
            }
            if (changed && confirm('Вы действительно хотите отменить действия?')){
                this.close();
                this.$parent.closeWrapper();
                this.initData(this.data);
            }
            if (!changed){
                this.close();
                this.$parent.closeWrapper();
                this.initData(this.data);
            }
        },
        resetForm(){
            this.form.fields.id =  '';
            this.form.fields.model = '';
            this.form.fields.token_number = '';
            this.form.fields.state_number = '';
            this.form.fields.date_start = '';
            this.form.fields.date_parking = '';
            this.form.fields.date_end = '';
            this.form.fields.time_start = '';
            this.form.fields.time_parking = '';
            this.form.fields.time_end = '';
            this.form.fields.archive = 0;
            
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
