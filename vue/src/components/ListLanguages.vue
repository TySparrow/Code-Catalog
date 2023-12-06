<template>
    <div class="hello">
      <section class="container">
        <Language v-for="example in currentLanguages" v-bind:key="example.id" v-bind:item="example" />
      </section>
      
    </div>
  
  </template>
  
  <script>
  import Language from "@/components/Language.vue";
  export default {
    components: { Language },
    created() {
        this.$store.commit("LOAD_LANGUAGES");
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
  
  
  