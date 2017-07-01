<template lang="jade">
main
    list(:cards="cards", :archives="archives")
    template(v-if="countArchives > 0")
        template(v-if="platform != 'mobile'")
            footer(v-if="!more"): button.btn.btn_primary.btn_block(@click="getArchiveCards") Показать архивные
        template(v-else)
            .container: button.btn.btn_primary.btn_block(@click="getArchiveCards") Показать архивные
</template>
<script>
const platform = window.__INITIAL_STATE__.platform;
const List = platform == 'mobile' ? require('./ListCards.vue') : require('./Table.vue');
import {mapGetters} from 'vuex';
export default {
    name: 'Cars',
    components: {List},
    data(){
        return {
            platform,
            more: false
        }
    },
    computed: {
        ...mapGetters({
            cards: 'filteredCards',
            archives: 'filteredArchiveCards'
        }),
        //Количество архивных записей в базе данных
        countArchives(){
            return window.__INITIAL_STATE__.state.count_archives;
        },
    },
    methods: {
        getArchiveCards(){
            this.$store.dispatch('GET_ARCHIVE_CARDS', {
                resolve: () => this.more = true,
                reject: e => alert(e)
            });
        }
    }
}
</script>

