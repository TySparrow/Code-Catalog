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
    created() {
        console.log("reached created in vue method");
        this.$store.commit("LOAD_EXAMPLES");
        console.log(this.filteredList);
        console.log(this.$store.state.examples)
    },
    computed: {
      filteredList() {
      let language = this.$route.params.language
      console.log("in filtered list", language);
      let filteredExamples = this.$store.state.examples;
      console.log("in filtered list", filteredExamples);
      if (language != "") {
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
  
  
  