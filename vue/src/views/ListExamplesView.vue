<template>
  <div class="hello">
        <div class="body">
      <h1>Examples</h1>
      <section class="container">
        <example v-for="example in currentExamples" v-bind:key="example.id" v-bind:item="example" />
      </section>
    </div>
  </div>
</template>

<script>
import example from "../components/Example.vue";
import ExampleService from "../services/ExampleService";

export default {
  components: { example },
  name: "home",
  computed: {
    currentExamples() {
      return this.$store.state.examples;
    },
  },
}
</script>

<style scoped>
.hello {
  font-family: Arial, sans-serif;
}

.body {
  margin-top: 20px;
}

.container {
  display: grid;
  grid-template-columns: repeat(3, 1fr);
  grid-gap: 20px;
}
</style>