<template lang="jade">
overlay(:name="name"): form-user(method="insert", data="null")
</template>
<script>
import Overlay from './Overlay';
import FormUser from './FormUser';
export default {
    name: 'modal-add-user',
    components: {Overlay, FormUser},
    data(){
        return {
            name: 'addUser',
        }
    }
}
</script>