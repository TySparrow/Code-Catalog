<template>
  <div class="home">
    <router-link v-bind:to="{ name: 'listExamples' }">Show Examples</router-link>
  </div>
</template>

<script>
export default {
  name: 'home',
  components: {}
}
</script>
