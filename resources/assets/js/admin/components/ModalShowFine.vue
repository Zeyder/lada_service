<template lang="jade">
overlay(:name="name"): .modal(v-if="editableCard != null"): card(:info="editableCard", modal="true", modalName="name")
</template>
<script>
import Card from './Card';
import Overlay from './Overlay';
export default {
    name: 'modal-show-fine',
    components: {Card, Overlay},
    data(){
        return {
            name: 'showFine'
        }
    },
    computed: {
        editableCard(){
            return this.$store.state.editableCard;
        }
    }
} 
</script>
