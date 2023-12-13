<template>
  <div class="body">

    <div class="hello">
      <navBar></navBar>
      <h1>Code Snippets</h1>
      <section class="container">
        <example v-for="example in filteredList" v-bind:key="example.id" v-bind:item="example"> </example>
      </section>
    </div>
  </div>
</template>
  
<script>

import example from "@/components/Example.vue";
import navBar from '@/components/NavBar.vue';
import exampleService from "../services/ExampleService";

export default {

  data() {
    return {
      examples: [],
    }
  },

  components: { example, navBar },

    created() {
        let exampleStatus = 'Public';
        exampleService
          .getExamples(exampleStatus)
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
    //grabs the param from the language.vue and sorts it into a new array
    filteredList() {
      let language = this.$route.params.language
      let filteredExamples
      if (language != "" || language != null) {
        filteredExamples = this.examples.filter((example) =>
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
/* .body {
  background: url("../assets/other-page.jpg") no-repeat center center fixed;
  background-size: cover;
  background-position: center;
  min-height: 100vh;
  min-width: 100vw;


} */

.hello {
 
  padding: 0;
  height: 100%;
}

h1 {
  font-size: 3rem;
  
  padding: 0;
  
}
</style>
  
  
  