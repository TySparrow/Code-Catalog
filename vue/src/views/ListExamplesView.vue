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
  import navBar from '@/components/NavBar.vue';

  export default {
    data(){
        return{
            filteredExamples: [],
        }
    },
    components: { example, navBar },
    created() {
        this.$store.commit("LOAD_EXAMPLES");
    },
    computed: {
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
  
  .hello{
    margin: 0;
    padding: 0;
    height: 100%;
  }

  h1{
    font-size: 3rem;
    margin: 0;
    padding: 0;
    margin-top: 10px;
    margin-left: 10px;
  }
  
  
  </style>
  
  
  