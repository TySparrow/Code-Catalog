<template>
    <div class="hello">
      <section class="container">
        <Language v-for="example in Languages" v-bind:key="example.id" v-bind:item="example" />
      </section>
    </div>
  </template>
  
  <script>
  
  import Language from "@/components/Language.vue";
  import LanguageService from "../services/LanguageService.js";

  export default {

    components: { Language },

    data() {
        return {
            Languages: {},
        }
    },
    created() {
        LanguageService
          .getLanguages()
          .then((response) => {
            console.log("Reached LOAD_LANGUAGES in ListLanguages.vue");
            console.log(response);
            this.Languages = (response.data);
          })
          .catch((error) => {
            if (error.response) {
              // error.response exists
              // Request was made, but response has error status (4xx or 5xx)
              console.log("Error loading LANGUAGES: ", error.response.status);
            } else if (error.request) {
              // There is no error.response, but error.request exists
              // Request was made, but no response was received
              console.log(
                "Error loading LANGUAGES: unable to communicate to server"
              );
            } else {
              // Neither error.response and error.request exist
              // Request was *not* made
              console.log("Error loading LANGUAGES: make request");
            }
          });
    }, 
  }


  </script>
  <style scoped>
  </style>
  
  
  