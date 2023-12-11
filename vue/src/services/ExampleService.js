import axios from "axios";


export default {

    getExamples(exampleStatus) {
      return axios.get('/example?status=' + exampleStatus);
    },
    getExamplesByUserId(userId){
      return axios.get('/example/' + userId);
    },
    addExample(newExample) {
      return axios.post("/example", newExample)
    },
    UpdateExample(updatedExample){
      return axios.put('/example', updatedExample);
    }
  }
  