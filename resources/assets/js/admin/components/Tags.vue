<template lang="jade">
main: transition-group.tag-list(name="fade", tag="div"): .tag(v-for="tag in tags", :key="tag.id")
    span.tag__name(v-text="tag.number", @click="setTag(tag)")
    span.tag__delete(@click="deleteTag(tag)") &times;

</template>
<script>
import {mapGetters} from 'vuex';

export default {
    name: 'Tags',
    computed: {
        ...mapGetters({
            tags: 'filteredTokenNumbers'
        })
    },
    methods: {
        deleteTag(tag){
            if (confirm('Вы действительно хотите удалить жетон ' + tag.number + '?')){
                this.$store.dispatch('DELETE_TOKEN_NUMBER', {
                    tag,
                    resolve: () => {
                        
                    },
                    reject: () => {
                        
                    }
                });
            }
        },
        setTag(tag){
            this.$store.commit('setEditableTokenNumber', tag);
            this.$store.commit('toggleModal', 'editTokenNumber');
        }
    }
}   
</script>
<style lang="stylus">
@import "../../../styl/admin/variables"
.tag-list
    width 100%
    padding 15px
    display flex
    flex-wrap wrap
    background-color gray
    .tag
        font-weight 700
        height 30px
        line-height (@height - 1px)
        margin 5px
        background-color #fff
        color #000
        box-shadow 0 1px 1px rgba(0,0,0, .1)
        display flex
        border-radius 2px
        cursor pointer
        text-align center
        transition all 350ms ease
        &__name
            border 1px solid rgba(0,0,0, .1)
            padding 0 30px
        &__delete
            width 30px
            height @width
            font-weight 300
            line-height (@height - 5px)
            border 1px solid rgba(0,0,0, .1)
            border-left 0 
            text-align center
            font-size 24px
            transition all 250ms ease
            border-top-right-radius 2px
            border-bottom-right-radius 2px
            @media(min-width 992px)
                &:hover
                    background-color $brand-danger
                    color #fff
</style>
