<template lang="jade">
main
    list(:cards="cards", :archives="archives")
    template(v-if="countArchives > 0")
        template(v-if="platform != 'mobile'")
            footer(v-if="!more"): button.btn.btn_primary.btn_block(@click="getArchiveCards") Показать архивные
        template(v-else)
            .container: button.btn.btn_primary.btn_block(@click="getArchiveCards") Показать архивные
    info-block
        span.count-fines Количество машин: {{countFines}}
        span.count-fines Количество архивных: {{countArchives}}
        span.count-fines Всего: {{totalCount}}
</template>
<script>
const platform = window.__INITIAL_STATE__.platform;
const List = platform == 'mobile' ? require('./ListCards.vue') : require('./Table.vue');
import InfoBlock from './InfoBlock';
import {mapGetters} from 'vuex';
export default {
    name: 'Cars',
    components: {List, InfoBlock},
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
            return this.more ? this.$store.state.arсhiveCards.length : window.__INITIAL_STATE__.state.count_archives;
        },
        countFines(){
            return this.$store.state.cards.length;
        },
        totalCount(){
            return this.countFines + this.countArchives;
        }
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
<style lang="stylus">
main
    padding-bottom 50px
.count-fines
    padding 0 10px
</style>
