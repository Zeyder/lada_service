<template lang="jade">
#app(ref="app")
    top-bar
    transition(name="fade", mode="out-in"): keep-alive: component(:is="activeComponent")
    modal-add-fine
    modal-add-token-number
    modal-edit-token-number
    modal-add-user
    modal-edit-fine
    modal-show-fine
</template>
<script>
import TopBar from './TopBar';
import ModalAddFine from './ModalAddFine';
import ModalShowFine from './ModalShowFine';
import ModalAddTokenNumber from './ModalAddTokenNumber';
import ModalAddUser from './ModalAddUser';
import ModalEditFine from './ModalEditFine';
import ModalEditTokenNumber from './ModalEditTokenNumber';
import Cars from './Cars';
import Tags from './Tags';
import Users from './Users';
require('../directives/mask.js');
export default {
    name: 'App',
    components: {TopBar, Cars, Tags, Users, ModalAddFine, ModalEditTokenNumber, ModalShowFine, ModalAddTokenNumber, ModalAddUser, ModalEditFine},
    computed: {
        //Активный компонент
        activeComponent(){
            return this.$store.state.activeComponent;
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
