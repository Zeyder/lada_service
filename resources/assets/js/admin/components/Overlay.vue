<template lang="jade">
.overlay(:class="{'overlay_active': isShow}"): .overlay__inner(@click.self="closeModal(name)")
    .container.container_md: slot
    .overlay__preloader-wrapper(:class="{'overlay__preloader-wrapper_active': wrapper}")
        .overlay__status(v-if="status != -1")
            .overlay__status-text
                b(v-if="status == 1") Данные успешно сохранены!
                b(v-if="status == 0") При сохранении данных произошла ошибка!
            button.btn(@click="closeWrapper", :class="{'btn_primary': status == 1, 'btn_danger': status == 0}") Закрыть
        .overlay__preloader(v-if="preloader")
</template>
<script>
import {mapMutations} from 'vuex';
export default {
    name: 'overlay',
    props: ['name'],
    data(){
        return {
            wrapper: false,
            preloader: false,
            status: -1
        }
    },
    computed: {
        isShow(){
            return this.$store.state.modals[this.name];
        }
    },
    watch: {
        'isShow'(val, oldVal){
            if(val){
                this.initEventKeyup();
            }else{
                this.destroyEventKeyup();
                this.closeWrapper();
            }
        }
    },
    methods: {
        ...mapMutations({
            close: 'toggleModal'
        }),
        closeModal(){
            this.close(this.name);
        },
        keyFunc(e){
            let code = e.keyCode || e.which;
            if (code == 27){
                this.closeModal(this.name);
            }
        },
        initEventKeyup(){
            if (parseInt(window.innerWidth) > 992){
                window.addEventListener('keyup', this.keyFunc);
            }
        },
        destroyEventKeyup(){
            if (parseInt(window.innerWidth) > 992){
                window.removeEventListener('keyup', this.keyFunc, false);
            }
        },
        closeWrapper(){
            this.wrapper = false;
            this.status = -1;
            this.preloader = false;
        },
        loading(){
            this.wrapper = true;
            this.preloader = 1;
        },
        success(){
            this.preloader = false;
            this.status = 1;
        },
        error(){
            this.preloader = false;
            this.status = 0;
        }
    }
}
</script>
<style lang="stylus" scoped>
@import "../../../styl/admin/variables"
.overlay
    width 100%
    height @width
    position fixed
    top 0
    left 0
    right 0
    bottom 0
    z-index 12
    background-color rgba(0,0,0, .8)
    overflow hidden
    opacity 0
    visibility hidden
    transition opacity 350ms ease, visibility 350ms ease
    &_active
        opacity 1
        visibility visible
    &__close
        width 50px
        height @width
        position fixed
        right 20px
        top 6px
        text-align center
        line-height @height
        font-size 2.3rem
        opacity .5
        color #fff
        cursor pointer
        z-index 15
        @media(min-width: 992px)
            &:hover
                opacity 1
        @media(max-width: 992px)
            opacity 1
    &__inner
        width 100%
        height @height
        overflow auto
        position relative
        .container
            padding-top 15px
    &__status
        padding 25px
        text-align center
        &-text
            margin-bottom 15px
            color rgba(0,0,0, .8)
            font-size 2rem
    &__preloader
        width 60px
        height 60px
        position absolute
        left 50%
        top 50%
        margin-top (@height/-2)
        margin-left (@height/-2)
        border-radius 50%
        border 3px solid transparent
        border-top-color rgba($brand-primary, 1)
        border-right-color rgba($brand-primary, 1)
        border-bottom-color rgba($brand-primary, 1)
        z-index 120
        animation rotation .65s infinite linear
        &-wrapper
            width 100%
            height 100%
            left 0
            top 0
            position fixed
            display flex
            justify-content center
            align-items center
            background-color rgba(#fff, .9)
            z-index 100
            visibility hidden
            opacity 0 
            transition visibility .35s ease, opacity .35s ease
            &_active
                visibility visible
                opacity 1            
@media(max-width: 768px)
    .container
        padding 0
@keyframes rotation
    to
        transform rotate(360deg)
</style>