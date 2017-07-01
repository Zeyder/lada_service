<template lang="jade">
table.table
    thead: tr
        td ID
        td Статус
        td Дата и время <br> доставки
        td Марка и модель
        td Государственный <br> номер
        td Номер <br> жетона
        td Дата и время <br> перевода на стоянку
        td Дата и время <br> выдачи
        td(v-if="user.role > 1") Ответственный
    tbody: tr(v-for="(card, $index) in cards", :key="card.id", @click="show(card)")
        td(v-text="card.id")
        td(:class="getClassStatus(card)")
            p.status
                i.fa.fa-warning(v-if="getStatus(card) != 'Выдано'")
                i.fa.fa-check-square(v-if="getStatus(card) == 'Выдано'")
                span {{getStatus(card)}}
        td(v-text="card.date_start")
        td(v-text="card.model")
        td(v-text="card.state_number")
        td(v-text="card.token_number")
        td(v-text="card.date_parking")
        td(v-text="card.date_end == '' ? 'Не выдано' : card.date_end", :class="{'text_danger': card.date_end == ''}")
        td(v-if="user.role > 1", v-text="card.responsible")
    tfoot: tr(v-for="(card, $index) in archives", :key="card.id")
        td(v-text="card.id")
        td(:class="getClassStatus(card)")
            p.status
                i.fa.fa-warning(v-if="getStatus(card) != 'Выдано'")
                i.fa.fa-check-square(v-if="getStatus(card) == 'Выдано'")
                span {{getStatus(card)}}
        td(v-text="card.date_start")
        td(v-text="card.model")
        td(v-text="card.state_number")
        td(v-text="card.token_number")
        td(v-text="card.date_parking")
        td(v-text="card.date_end == '' ? 'Не выдано' : card.date_end", :class="{'text_danger': card.date_end == ''}")
        td(v-if="user.role > 1", v-text="card.responsible")
</template>
<script>
import Card from '../mixins/Card';
export default {
    name: 'list',
    props: ['cards', 'archives'],
    mixins: [Card],
    computed: {
        user(){
            return this.$store.state.user;
        }
    }
}
</script>
<style lang="stylus" scoped>
@import "../../../styl/admin/variables"
.table
    td
        &:nth-child(1)
        &:nth-child(2)
        &:nth-child(6)
            text-align center
        &.text
            &_warning
                color $brand-warning
            &_success
                color $brand-success
            &_danger
                color $brand-danger
        .fa
            margin-right 7px
</style>