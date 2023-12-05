<template>
    <h1>New Code Snippet Form</h1>
   <NavBar></NavBar>

    <NewExampleForm />
   
</template>

<script>
import NewExampleForm from '../components/NewExampleForm.vue';
import NavBar from '../components/NavBar.vue';


export default {
    components: {
        NewExampleForm,
        NavBar
    }
}
</script>

<style scoped>

</style>




