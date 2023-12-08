<template>
    <NavBar></NavBar>
    <h1> Add A Snippet </h1>
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




