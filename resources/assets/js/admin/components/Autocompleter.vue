<template lang="jade">
.autocomplete
    input.input(type="text", v-model="searchStr", @focus="onFocus", @blur="onBlur")
    .autocomplete__wrapper(v-show="show"): ul.autocomplete__list: li.autocomplete__item(v-for="item in filteredItems", :key="item", v-text="item.number", @click="select(item.number)")
</template>
<script>
export default {
    name: 'autocompleter',
    props: ['items', 'startVal'],
    data(){
        return {
            searchStr: '',
            //Текущая выбранная строка из результата
            i: -1,
            //Высота всех строк результирующего набора
            listHeight: 0,
            show: false,
        }
    },
    watch: {
        'startVal'(val, oldVal){
            this.searchStr = val != undefined ? val : '';
        },
        'searchStr'(val, oldVal){
            this.$emit('data-change', val);
        }
    },
    methods: {
        onFocus(){
            this.show = true;
        },
        onBlur(){
            setTimeout(()=>{
                this.show = false;
            }, 100);
        },
        select(val){
            this.searchStr = val;
            this.show = false;
        }
    },
    computed: {
        filteredItems(){
            return this.items.filter(item => {
                return item.number.indexOf(this.searchStr) != -1;
            });
        }
    },
    mounted(){
       
    }
}
</script>
<style lang="stylus">
@import "../../../styl/admin/variables"
.autocomplete
    width 100%
    height auto
    position relative
    &__wrapper
        position absolute
        top 100%
        width 100%
        height 100px
        overflow hidden
        z-index 10
        background-color #fff
        box-shadow 0 0 10px rgba(0,0,0 .1)
    &__list
        width 100%
        height 100%
        overflow auto
        padding 0
        margin 0
        list-style none
    &__item
        color $body-color
        width 100%
        display block
        height 25px
        line-height @height
        padding-left 10px
        cursor pointer
        &:hover
        &.hovered
            background-color darken(#fff, 15%)
</style>

