<template>
    <div class="hello">
      <h1>examples</h1>
      <section class="container">
        <example v-for="example in currentExamples" v-bind:key="example.id" v-bind:item="example" />
      </section>
      
    </div>
  
  </template>
  
  <script>
  import example from "@/components/Example.vue";
  
  export default {
    components: { example },
    name: "home",
    data() {
      return {
        examples: [],
      };
    },
    computed: {
      currentExamples() {
        return this.$store.state.examples;
      },
    },
  
  
  }
  </script>
  
  
  <style scoped>
  
  </style>
  
  
  