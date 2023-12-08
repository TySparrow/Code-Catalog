import axios from "axios";

export default {

    getLanguages() {
      return axios.get('/language');
    },
    
  }