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
  import exampleService from '../services/ExampleService.js'

  export default {

    data(){
        return{
            examples: [],
        }
    },

    components: { example, navBar },
    created() {
      let exampleStatus = 'public';
        exampleService
          .getExamples(exampleStatus)
          .then((response) => {
            console.log("Reached LOAD_EXAMPLES in Vuex");
            console.log(response);
            this.examples = (response.data);
          })
          .catch((error) => {
            if (error.response) {
              // error.response exists
              // Request was made, but response has error status (4xx or 5xx)
              console.log("Error loading EXAMPLES: ", error.response.status);
            } else if (error.request) {
              // There is no error.response, but error.request exists
              // Request was made, but no response was received
              console.log(
                "Error loading EXAMPLES: unable to communicate to server"
              );
            } else {
              // Neither error.response and error.request exist
              // Request was *not* made
              console.log("Error loading EXAMPLES: make request");
            }
          });
    },

    computed: {
      //takes in a search param from the Navbar.vue and filters it through a new list
      filteredList() {
      let search = this.$route.params.search
      let filteredExamples 
      if (search != "" || search != null) {
        filteredExamples = this.examples.filter((example) =>
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
  //Would like to add the ability to the search bar if simply clicked, refreshes the page with all examples
    </script>
  
  <style scoped>
  </style>
  
  
  