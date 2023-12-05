<template>
    <div>
        <form v-on:submit.prevent="createNewExample">
            <div>
                <label for="title">Title: </label>
                <input type="text" name="title" id="title" v-model="newExample.title" />
            </div>
            <div>
                <label for="tag">Tag: </label>
                <input type="text" name="tag" id="tag" v-model="newExample.tag" />
            </div>
            <div>
                <label for="language">Language: </label>
                <input type="text" name="language" id="language" v-model="newExample.language" />
            </div>
            <div>
                <label for="code">Code: </label>
                <input type="text" name="code" id="code" v-model="newExample.code" />
            </div>
            <div>
                <label for="source">Source </label>
                <input type="text" name="source" id="source" v-model="newExample.source" />
            </div>

            <button type="submit">Save Example</button>
        </form>
    </div>
</template>

<script>
import ExampleService from "../services/ExampleService";
export default {
  data() {
    return {
      newExample: {},
    };
  },
  
  methods: {
    createNewExample() {
      if (this.newExample.title) {
        ExampleService
          .addExample(this.newExample)
          .then(() => {
            this.newExample = {};
            this.showForm = false;
            this.loadExamples();
          })
          .catch((error) => {
            if (error.response) {
              // error.response exists
              // Request was made, but response has error status (4xx or 5xx)
              console.log("Error adding Example: ", error.response.status);
            } else if (error.request) {
              // There is no error.response, but error.request exists
              // Request was made, but no response was received
              console.log(
                "Error adding Example: unable to communicate to server"
              );
            } else {
              // Neither error.response and error.request exist
              // Request was *not* made
              console.log("Error adding Example: make request");
            }
          });
      }

    },
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
    nextExampleId() {
      let result = 0;
      this.$store.state.examples.forEach((item) => {
        if (item.id > result) {
          result = item.id;
        }
      });
      return result + 1;
    },
  },
  created() {
    this.loadExamples();
  },
}
</script>

<style scoped></style>