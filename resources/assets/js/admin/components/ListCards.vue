<template lang="jade">
.container
    card(v-for="(card, $index) in cards", :info="card", :position="$index", :key="card.id")
    h2(v-if="archives.length") Архивные
    card(v-for="(card, $index) in archives", :info="card", :position="$index", :key="card.id")
</template>
<script>
import Card from './Card';
export default {
    name: 'list',
    props: ['cards', 'archives'],
    components: {Card}
}
</script>
<style lang="stylus" scoped>
h2
    color rgba(0,0,0, .8)
</style>