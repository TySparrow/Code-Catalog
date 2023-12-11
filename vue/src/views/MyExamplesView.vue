<template>
    <div class="hello">
        <navBar></navBar>
      <h1>Code Snippets</h1>
      <section class="container">
        <example v-for="example in examples" v-bind:key="example.id" v-bind:item ="example"> </example>
      </section>
    </div>
  </template>
  
  <script>

  import example from "@/components/Example.vue";
  import navBar from '@/components/NavBar.vue';
  import exampleService from "../services/ExampleService";

  export default {

    data(){
        return{
            examples: []
        }
    },

    components: { example, navBar },

    created() {
        exampleService
          .getExamples()
          .then((response) => {
            console.log("Reached LOAD_EXAMPLES in ListExamplesView.vue");
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
  
  
  