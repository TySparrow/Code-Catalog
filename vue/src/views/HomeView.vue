<template>
  <div class="home">
    <NavBar></NavBar>
    <ListExamples></ListExamples>

  </div>
  
</template>

<script>
import NavBar from '../components/NavBar.vue';
import ListExamples from '../components/ListExamples.vue'
export default {
  name: 'home',
  components: { NavBar, ListExamples }
}

</script>


<style scoped>
</style>
