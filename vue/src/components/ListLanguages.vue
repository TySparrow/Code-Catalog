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
    //this calls to the vueex to pull all the languages from the server
    created() {
        this.$store.commit("LOAD_LANGUAGES");
    },


    computed: {
      //this pulls the information from the vueex
      currentLanguages() {
        return this.$store.state.Languages;
      },
    },  
  }


  </script>
  <style scoped>
  </style>
  
  
  