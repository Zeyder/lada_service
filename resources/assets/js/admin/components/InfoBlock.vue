<template lang="jade">
.info-block: slot
</template>
<script>
export default {
    name: 'info-block'
}
</script>
<style lang="stylus" scoped>
.info-block
    width 100%
    height 50px
    left 0
    position fixed
    background-color #fff
    line-height @height
    display flex
    box-shadow 0 -10px 10px rgba(0,0,0, .1)
    bottom 0
</style>

