<template>
  <div></div>
</template>

<!-- <script>
import AdminTasks from '../components/AdminTasks.vue';
import exampleService from '../services/ExampleService';
export default {
    data() {
        return {
            examples: []
        }
    },
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

}


</script>


<style> 




</style>  -->
