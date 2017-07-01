<template lang="jade">
main: table.table
    thead: tr
        td ID
        td Роль
        td Логин
        td Имя
    tbody: tr(v-for="user in users", :key="user.id")
        td(v-text="user.id")
        td(v-text="getRole(user.role)")
        td(v-text="user.login")
        td(v-text="user.full_name")
</template>
<script>
import {mapGetters} from 'vuex';
export default {
    name: 'Users',
    computed: {
        ...mapGetters({
            users: 'filteredUsers'
        })
    },
    methods: {
        getRole(role){
            switch(parseInt(role)){
                case 1: return 'Пользователь';
                case 2: return 'Администратор';
            }
        }
    }
}
</script>
<style lang="stylus" scoped>

</style>

