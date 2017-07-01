<template lang="jade">
.top-bar
    .top-bar__search(:class="{'active': searchIsShow}")
        input.top-bar__input(type="text", placeholder="Поиск", v-model="searchQuery")
        span.top-bar__close-search(@click="toggleSearch") &times;
    ul.top-bar__nav
        li.top-bar__item(title="Транспортные средства", @click="setComponent('Cars')", :class="{'top-bar__item_active': activeComponent == 'Cars'}")
            i.fa.fa-automobile
            span.top-bar__text Транспортные средства
        li.top-bar__item(title="Жетоны", @click="setComponent('Tags')", :class="{'top-bar__item_active': activeComponent == 'Tags'}")
            i.fa.fa-tags
            span.top-bar__text Жетоны
        li.top-bar__item(v-if="user.role > 1", title="Пользователи", @click="setComponent('Users')", :class="{'top-bar__item_active': activeComponent == 'Users'}")
            i.fa.fa-user
            span.top-bar__text Пользователи
        li.top-bar__item: button.btn.btn_white(@click="openAddModal")
            i.fa.fa-plus
            span Добавить
        li.top-bar__item.top-bar__item_btn(title="Поиск", @click="toggleSearch"): i.fa.fa-search
        li.top-bar__item: a.top-bar__link(href="/administrator/logout"): i.fa.fa-sign-out
</template>
<script>
import {mapMutations} from 'vuex';
export default {
    name: 'top-bar',
    data(){
        return {
            searchIsShow: false,
            searchQuery: ''
        }
    },
    computed: {
        user(){
            return this.$store.state.user;
        },
        activeComponent(){
            return this.$store.state.activeComponent;
        }
    },
    watch: {
        'searchQuery'(val, oldVal){
            this.$store.commit('setSearchQuery', val);
        }
    },
    methods: {
        ...mapMutations({
            setComponent: 'setActiveComponent',
            openModal: 'toggleModal'
        }),
        //Открытие и закрытие строки поиска
        toggleSearch(){
            this.searchIsShow = !this.searchIsShow;
            this.$store.commit('setSearchQuery', '');
            if (this.searchIsShow){
                window.addEventListener('keyup', this.closeSearch);
            }else{
                window.addEventListener('keyup', this.closeSearch, false);
            }
        },
        closeSearch(e){
            let code = e.keyCode || e.which;
            if (code == 27){
                this.searchIsShow = false;
            }
        },
        openAddModal(){
            switch(this.$store.state.activeComponent){
                case 'Cars' : {this.openModal('addFine')} break;
                case 'Tags' : {this.openModal('addTokenNumber')} break;
                case 'Users' : {this.openModal('addUser')} break;
            }
        }
    }
}
</script>
<style lang="stylus" scoped>
@import "../../../styl/admin/variables"
.top-bar
    width 100%
    background-color $top-bar-bg
    position fixed
    z-index 10
    top 0
    left 0
    box-shadow 0 0 10px rgba(0,0,0, .5)
    height $top-bar-height
    font-weight 300
    &
    &__link
        color $top-bar-color
        text-decoration none
    &__search
        position fixed
        width 100%
        height @height
        left 0
        right 0
        top -@height
        z-index @z-index + 1
        opacity 0
        transition opacity 350ms ease, top 350ms ease
        &.active
            opacity 1
            top 0
    &__input
        width 100%
        height @height
        border 0
        padding-left 15px
        color $body-color
        outline none
    &__close-search
        width @height
        height @height
        position absolute
        right 0
        top 0
        text-align center
        line-height @height - 2px
        font-size 2.3rem
        color rgba($body-color, .6)
        @media(min-width: 992px)
            cursor pointer
    &__nav
        width 100%
        height @height
        display flex
        justify-content space-between
        list-style none
        font-size 16px
        margin 0
        padding 0
    &__text
        margin-left 10px
        @media(max-width 992px)
            display none
    &__item
        &:nth-child(4)
            margin-left auto
        &:nth-child(4)
        &:nth-child(5)
        &:nth-child(6)
            opacity 1
            border-right 0
            font-size 18px
        border-right 1px solid rgba(#fff, .5)
        padding 0 25px
        height @height
        position relative
        opacity .5
        line-height @height
        text-align center
        cursor pointer
        transition all 250ms ease
        @media(max-width 992px)
            padding 0
            min-width 64px
        &_active
            opacity 1
        @media(min-width 992px)
            &:hover
                opacity 1
        &_btn
            width $top-bar-height
            padding 0
</style>