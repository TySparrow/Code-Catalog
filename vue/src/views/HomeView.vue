<template>
  <div class="home">
    <h1>Home</h1>
    <p>You must be authenticated to see this</p>
    <h1>examples</h1>
    <section class="container">
      <example v-for="example in currentExamples" v-bind:key="example.id" v-bind:item="example" />
    </section>
  </div>
</template>

<script>
import example from "../components/Example.vue";
export default {
  components: { example },
  computed: {
    currentExamples() {
      return this.$store.state.examples;
    },
  },
  methods: {
    nextExampleId() {
      let result = 0;
      this.$store.state.examples.forEach((item) => {
        if (item.id > result) {
          result = item.id;
        }
      });
      return result + 1;
    },
  }
}
</script>

