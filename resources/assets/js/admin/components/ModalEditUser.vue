<template lang="jade">
overlay(:name="name"): form-user(method="update", :data="editableUser")
</template>
<script>
import Overlay from './Overlay';
import FormUser from './FormUser';
export default {
    name: 'modal-edit-user',
    components: {Overlay, FormUser},
    data(){
        return {
            name: 'editUser',
        }
    },
    computed: {
        editableUser(){
            return this.$store.state.editableUser;
        }
    }
}
</script>