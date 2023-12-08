import axios from "axios";


export default {

    getExamples() {
      return axios.get('/example');
    },
    addExample(newExample) {
      return axios.post("/example", newExample)
    }
  }
  