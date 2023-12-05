<template>
    <div class="hello">
      <h1>examples</h1>
      <section class="container">
        <Language v-for="example in currentLanguages" v-bind:key="example.id" v-bind:item="example" />
      </section>
      
    </div>
  
  </template>
  
  <script>
  import Language from "@/components/Language.vue";
  export default {
    components: { Language },
    name: "home",
    data() {
      return {
         Languages: [],
      };
    },
    computed: {
      currentLanguages() {
        return this.$store.state.Languages;
      },
    },
  
  
  }
  </script>
  
  
  <style scoped>
  
  </style>
  
  
  