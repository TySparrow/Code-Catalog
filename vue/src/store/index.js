import { createStore as _createStore } from 'vuex';
import axios from 'axios';
import exampleService from "../services/ExampleService.js";
import LanguageService from '../services/LanguageService.js';

export function createStore(currentToken, currentUser) {
  let store = _createStore({
    state: {
      token: currentToken || '',
      user: currentUser || {},
      Languages: [],
      examples: [],
      search: '',
      confirmation: '',
    },
    mutations: {
      SET_AUTH_TOKEN(state, token) {
        state.token = token;
        localStorage.setItem('token', token);
        axios.defaults.headers.common['Authorization'] = `Bearer ${token}`;
      },
      SET_USER(state, user) {
        state.user = user;
        localStorage.setItem('user', JSON.stringify(user));
      },
      LOGOUT(state) {
        localStorage.removeItem('token');
        localStorage.removeItem('user');
        state.token = '';
        state.user = {};
        axios.defaults.headers.common = {};
      },
      //this method calls the services to load all the examples 
      LOAD_EXAMPLES(state) {
        exampleService
          .getExamples()
          .then((response) => {
            console.log("Reached LOAD_EXAMPLES in Vuex");
            console.log(response);
            state.examples = (response.data);
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
      //this calls to the services to load all of the individual languages
      LOAD_LANGUAGES(state) {
        LanguageService
          .getLanguages()
          .then((response) => {
            console.log("Reached LOAD_LANGUAGES in Vuex");
            console.log(response);
            state.Languages = (response.data);
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
      // //this takes in a parameter that is a new example and sends it to the service to be added to the server
      // ADD_EXAMPLE(state, payload) {
      //   state.examples.push(payload);
      //   this.confirmation = exampleService.addExample(payload);
      // },
      
    },

    strict: true,
  });
  return store;
}
