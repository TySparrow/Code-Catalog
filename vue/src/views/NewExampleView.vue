<template>
    <NavBar></NavBar>
    <h1> Add A Snippet </h1>
    <div class="body">
        
        <NewExampleForm />
    </div>
<Footer></Footer>
   
</template>

<script>
import NewExampleForm from '@/components/NewExampleForm.vue';
import NavBar from '@/components/NavBar.vue';
import Footer from '@/components/Footer.vue';

export default {

    components: {
        NewExampleForm,
        NavBar,
        Footer
    }
}
</script>

<style scoped>


</style>




