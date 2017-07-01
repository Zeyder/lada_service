<template lang="jade">
#app(ref="app", :data-scroll="noScroll")
    top-bar
    transition(name="fade", mode="out-in"): keep-alive: component(:is="activeComponent")
    modal-add-fine
    modal-add-token-number
    modal-edit-token-number
    modal-add-user
    modal-edit-user
    modal-edit-fine
    modal-show-fine
    modal-show-user
</template>
<script>
import TopBar from './TopBar';
import ModalAddFine from './ModalAddFine';
import ModalShowFine from './ModalShowFine';
import ModalShowUser from './ModalShowUser';
import ModalAddTokenNumber from './ModalAddTokenNumber';
import ModalAddUser from './ModalAddUser';
import ModalEditUser from './ModalEditUser';
import ModalEditFine from './ModalEditFine';
import ModalEditTokenNumber from './ModalEditTokenNumber';
import Cars from './Cars';
import Tags from './Tags';
import Users from './Users';
require('../directives/mask.js');
export default {
    name: 'App',
    components: {TopBar, Cars, Tags, Users, ModalAddFine, ModalEditUser, ModalShowUser, ModalEditTokenNumber, ModalShowFine, ModalAddTokenNumber, ModalAddUser, ModalEditFine},
    computed: {
        //Активный компонент
        activeComponent(){
            return this.$store.state.activeComponent;
        },
        noScroll(){
            return (this.$store.state.modals.addFine ||
                    this.$store.state.modals.showFine ||
                    this.$store.state.modals.showUser ||
                    this.$store.state.modals.addTokenNumber ||
                    this.$store.state.modals.addUser ||
                    this.$store.state.modals.editFine ||
                    this.$store.state.modals.editTokenNumber ||
                    this.$store.state.modals.editUser);
        }
    },
    watch: {
        'noScroll'(val){
            if (val){
                $('html').addClass('no-scroll');
            }else{
                $('html').removeClass('no-scroll');
            }
        }
    }
}
</script>
<style lang="stylus" scoped>
.container
    padding-top 15px
</style>
<style>
.fade-enter-active, .fade-leave-active {
  transition: opacity .5s
}
.fade-enter, .fade-leave-to {
  opacity: 0
}
</style>
