<template lang="jade">
overlay(:name="name"): form-fine(method="update", :data="editableCard")
</template>
<script>
import Overlay from './Overlay';
import FormFine from './FormFine';
export default {
    name: 'modal-edit-fine',
    components: {Overlay, FormFine},
    data(){
        return {
            name: 'editFine'
        }
    },
    computed: {
        editableCard(){
            let obj = this.$store.state.editableCard;
            return obj !== null ? obj : null;
        }
    }
}
</script>