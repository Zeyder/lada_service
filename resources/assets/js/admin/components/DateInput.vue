<template lang="jade">
.group-input
    input.input(type="text", v-model="localDate", ref="inputDate", :class="validationClassObj")
    .group-input__icon: i.fa.fa-calendar
</template>
<script>
export default {
    name: 'date-input',
    props: ['date', 'validationClassObj'],
    data(){
        return {
            localDate: ''
        }
    },
    watch: {
        'date'(val, oldVal){
            this.localDate = val;
        },
        'localDate'(val, oldVal){
            $(this.$refs.inputDate).val(val);
            this.$emit('date-change', val);
        }
    },
    methods: {
        updateDate(){
            this.localDate = $(this.$refs.inputDate).val();
            
            this.$emit('date-change', this.localDate);
        }
    },
    mounted(){
        $(this.$refs.inputDate).datetimepicker({
        timepicker: false,
        format: 'd.m.Y',
            onSelectDate: this.updateDate
        });
    }
}
</script>
<style lang="stylus" scoped>
@import "../../../styl/admin/variables"
.group-input
    width 100%
    position relative
    &__icon
        position absolute
        color #B9BAA3
        margin-top -1px
        right 8px
        top 50%
        transform translateY(-50%)
</style>
