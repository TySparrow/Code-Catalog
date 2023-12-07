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
    created() {
        this.$store.commit("LOAD_EXAMPLES");
    },
    computed: {
      filteredList() {
      let search = this.$route.params.search
      let filteredExamples = this.$store.state.examples;
    //   if (search != "" || search != null) {
    //     filteredExamples = filteredExamples.filter((example) =>
    //       example.language
    //         .toLowerCase()
    //         .includes(search.toLowerCase())
    //     );
    //   }
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
  
  
  