<template lang="jade">
overlay(:name="name"): .modal: form.form(@submit.prevent="submitForm")
    .modal__header
        span.modal__close(@click="cancelModal") &times;
        .col-lg-6.col-md-6.col-xs-6: .row: .form__group
            label.label(for="form-number") Номер жетона
            input.input#form-number(type="text", placeholder="Укажите номер жетона", autocomplete="false", v-model="form.fields.number", :class="{'input_invalid': !isValidNumber && form.submit, 'input_valid': isValidNumber}")
        .col-lg-12.col-md-12.col-xs-12: .row
            button.btn.btn_primary Сохранить
</template>
<script>
import Overlay from './Overlay';
import validation from '../functions/validation';
import {mapMutations} from 'vuex';
export default {
    name: 'modal-edit-token-number',
    components: {Overlay},
    data(){
        return {
            name: 'editTokenNumber',
            form: {
                fields: {
                    id: '',
                    number: ''
                },
                submit: false
            }
        }
    },
    watch: {
        'editableTokenNumber'(val, oldVal){
            if (val != null){
                this.form.fields.id = val.id;
                this.form.fields.number = val.number;
            }else{
                this.form.fields.id = '';
                this.form.fields.number = '';
            }
        }
    },
    computed: {
        isValidNumber(){
            return validation(this.form.fields.number, 1);
        },
        editableTokenNumber(){
            return this.$store.state.editableTokenNumber;
        }
    },
    methods: {
        ...mapMutations({
            close: 'toggleModal'
        }),
        submitForm(){
            this.form.submit = true;
            if (this.isValidNumber){
                this.$children[0].loading();
                this.$store.dispatch('UPDATE_TOKEN_NUMBER', {
                    token: this.form.fields,
                    resolve: () => {
                        this.$children[0].success();
                    },
                    reject: e => this.$children[0].error()
                });
            }
        },
         cancelModal(){
            if (this.form.fields.number != '' && confirm('Вы действительно хотите отменить действия?')){
                this.close();
                this.resetForm();
                this.$children[0].closeWrapper();
            }else{
                this.close();
                this.resetForm();
                this.$children[0].closeWrapper();
            }
        },
        resetForm(){
            this.form.fields.number = '';
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