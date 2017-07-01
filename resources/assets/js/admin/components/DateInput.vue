<template lang="jade">
input.input(type="text", v-model="localDate", ref="inputDate")
</template>
<script>
export default {
    name: 'date-input',
    props: ['date'],
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
            
            $(this.$el).val(val);
            this.$emit('date-change', val);
        }
    },
    methods: {
        updateDate(){
            this.localDate = $(this.$el).val();
            
            this.$emit('date-change', this.localDate);
        }
    },
    mounted(){
        $(this.$el).datetimepicker({
        timepicker: false,
        mask: '31.12.2099',
        format: 'd.m.Y',
            onSelectDate: this.updateDate
        });
    }
}
</script>