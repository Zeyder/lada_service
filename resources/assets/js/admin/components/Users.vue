<template lang="jade">
main: table.table(ref="table")
    thead: tr
        td ID
        td Роль
        td Логин
        td Имя
    tbody: tr(v-for="user in users", :key="user.id", @click="show(user)")
        td(v-text="user.id")
        td(v-text="getRole(user.role)")
        td(v-text="user.login")
        td(v-text="user.full_name")
</template>
<script>
import {mapGetters, mapMutations} from 'vuex';
export default {
    name: 'Users',
    computed: {
        ...mapGetters({
            users: 'filteredUsers'
        })
    },
    methods: {
        ...mapMutations({
            openModal: 'toggleModal'
        }),
        getRole(role){
            switch(parseInt(role)){
                case 1: return 'Пользователь';
                case 2: return 'Администратор';
            }
        },
        show(user){
            this.$store.commit('setEditableUser', user);
            this.openModal('showUser');
        }
    },
    mounted(){
        $(this.$refs.table).stickyTableHeaders({
            fixedOffset: $('.top-bar'),
            cacheHeaderHeight: true
        });
    }
}
</script>
<style lang="stylus" scoped>

</style>

