<template lang="jade">
overlay(:name="name"): form-fine(method="insert")
</template>
<script>
import Overlay from './Overlay';
import FormFine from './FormFine';
export default {
    name: 'modal-add-fine',
    components: {Overlay, FormFine},
    data(){
        return {
            name: 'addFine'
        }
    }
}
</script>
<style lang="stylus" scoped>

</style>