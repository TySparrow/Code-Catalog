<template>
    <div class="hello">
        <navBar></navBar>
      <h1>Code Snippets</h1>
      <section class="container">
        <example v-for="example in filteredList" v-bind:key="example.id" v-bind:item ="example"> </example>
      </section>
    </div>
  </template>
  
  <script>

  import example from "@/components/Example.vue";
  import navBar from '../components/NavBar.vue';

  export default {

    data(){
        return{
            filteredExamples: [],
        }
    },

    components: { example, navBar },

    //this method loads all the examples from the server into the vueex
    created() {
        this.$store.commit("LOAD_EXAMPLES");
    },

    computed: {
      // this method grabs a user input from a click in the language.vue 
      //this method grabs the languages from the vueex and stores it
      // this method filters the languages based on user input and returns a filtered array
      filteredList() {
      let language = this.$route.params.language
      let filteredExamples = this.$store.state.examples;
      if (language != "" || language != null) {
        filteredExamples = filteredExamples.filter((example) =>
          example.language
            .toLowerCase()
            === (language.toLowerCase())
        );
      }
      return filteredExamples;
    }
    },
  }
  </script>
  
  <style scoped>
  </style>
  
  
  