<template>
  <div class="home">
    <NavBar></NavBar>
    <router-link v-bind:to="{ name: 'listExamples' }">Show Examples</router-link>
  </div>
</template>

<script>
import NavBar from '../components/NavBar.vue';
export default {
  name: 'home',
  components: {NavBar}
}

</script>
