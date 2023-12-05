<template>
  <div class="hello">
    <h1>examples</h1>
    <section class="container">
      <example v-for="example in currentExamples" v-bind:key="example.id" v-bind:item="example" />
    </section>
    
  </div>

</template>

<script>
import example from "@/components/Example.vue";
import ExampleService from "../services/ExampleService";
export default {
  components: { example },
  name: "home",
  data() {
    return {
      examples: [],
    };
  },
  computed: {
    currentExamples() {
      return this.$store.state.examples;
    },
  },

  methods: {
    loadExamples() {
      ExampleService
        .getExamples()
        .then((response) => {
          console.log("Reached created in ListExamples.vue");
          console.log(response);
          this.owners = response.data;
        })
        .catch((error) => {
          if (error.response) {
            // error.response exists
            // Request was made, but response has error status (4xx or 5xx)
            console.log("Error loading owners: ", error.response.status);
          } else if (error.request) {
            // There is no error.response, but error.request exists
            // Request was made, but no response was received
            console.log(
              "Error loading owners: unable to communicate to server"
            );
          } else {
            // Neither error.response and error.request exist
            // Request was *not* made
            console.log("Error loading owners: make request");
          }
        });
    },
  },
  created() {
    this.loadExamples();
  },

}
</script>


<style scoped>

</style>


