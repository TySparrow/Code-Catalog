<template>
    <div class="hello">
        <navBar></navBar>
      <h1>examples</h1>
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
    //calls to the vueex to load all the examples 
    created() {
        this.$store.commit("LOAD_EXAMPLES");
    },

    computed: {
      //this method takes a parameter from the navbar search input.
      //this method creates a array of all the examples from the vueex
      //after it gets the information it compares the search to the variety of filters and returns a array
      filteredList() {
      let search = this.$route.params.search
      let filteredExamples = this.$store.state.examples;
      if (search != "" || search != null) {
        filteredExamples = filteredExamples.filter((example) =>
          example.title.toLowerCase().includes(search.toLowerCase()) ||
            example.language.toLowerCase().includes(search.toLowerCase()) ||
            example.tag.toLowerCase().includes(search.toLowerCase()) ||
            example.source.toLowerCase().includes(search.toLowerCase())
        );
      }
      return filteredExamples;
    }
    },
  }
  </script>
  
  <style scoped>
  </style>
  
  
  