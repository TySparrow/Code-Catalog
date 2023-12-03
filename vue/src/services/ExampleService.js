import axios from "axios";

// const http = axios.create({
//     baseURL: "http://localhost:44315"
//   });

export default {

    getExamples() {
      return axios.get('/example');
    },
  }
  