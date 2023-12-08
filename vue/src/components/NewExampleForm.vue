<template>
  <div class="body">
    <modal @close="toggleModal" :modalActive="modalActive">
          <div class="modal-content">
            <h1>this is a modal header</h1>
            <p>this is a modal message {{ this.confirmation }}</p>
          </div>
        </modal>
    <form v-on:submit.prevent="createNewExample" v-on:keydown.enter.exact="handleEnterKey" class="example-form">
      <div class="title">
        <label for="title">Title: </label>
        <input type="text" name="title" id="title" v-model="newExample.title" />
      </div>
      <div class="tag">
        <label for="tag">Tag: </label>
        <input type="text" name="tag" id="tag" v-model="newExample.tag" />
      </div>
      <div class="language">
        <label for="language">Language: </label>
        <input type="text" name="language" id="language" v-model="newExample.language" />
      </div>
      <div>
        <label for="code">Code: </label>
        <pre class="code-area">
          <textarea name="code" id="code" :class="{ 'code-input': true, 'dark-mode': darkMode }" v-model="newExample.code"
            placeholder="Enter your code here"></textarea>
        </pre>
      </div>
      <div class="source">
        <label for="source">Source </label>
        <input type="text" name="source" id="source" v-model="newExample.source" />
      </div>
      <div class="form-group">
        <button @click="toggleDarkMode" class="dark-mode-btn">Dark Mode</button>
        <button @click="toggleModal" type="submit">Save Example</button>
      </div>
    </form>
  </div>
</template>

<script>
import prettier from 'prettier';
import Prism from 'prismjs';
import 'prismjs/themes/prism.css';
import modal from '../components/PopUp.vue'
import{ref} from "vue";
import exampleService from "../services/ExampleService.js";

export default {

  components: {modal},

  data() {
    return {
      newExample: {},
      darkMode: false,
      confirmation: "",
    };
  },

  setup(){
    const modalActive = ref(false);

    const toggleModal = () => {
      modalActive.value = !modalActive.value;
    };
    return{modalActive, toggleModal};
  },

  methods: {
    //this method creates a new example and calls to the vueex to add the example to the server
    createNewExample() {
      console.log("create new example");
      if (this.newExample.title) {
        this.newExample.id = this.nextExampleId();
        // this.$store.commit("ADD_EXAMPLE", this.newExample);
        // this.confirmation = this.$store.state.confirmation;
        exampleService.addExample(this.newExample).then((response) =>{
          this.confirmation = response.data;
        })
        console.log("create new example method ", this.confirmation);
      }
      this.newExample = "";
    },
    //this method is called in the createnewexample method to create the id for the new example
    nextExampleId() {
      let result = 0;
      this.$store.state.examples.forEach((item) => {
        if (item.id > result) {
          result = item.id;
        }
      });
      return result + 1;
    },
    toggleDarkMode() {
      this.darkMode = !this.darkMode;
      this.highlightCode();
    },
    handleEnterKey(event) {
      if (event.keyCode === 13) {
        event.preventDefault();
      }
    },
    highlightCode() {
      Prism.highlightAll();
    },
  },
  mounted() {
    this.highlightCode();
  },
  watch: {
    newExample: {
      handler() {
        this.highlightCode();
      },
      deep: true,
    },
  },
}
</script>

<style scoped>
@import 'prismjs/themes/prism.css';

.body {
  padding-top: 25px;
}

.example-form {
  display: flex;
  flex-direction: column;
  width: 50%;
  margin: 0 auto;
}

.form-group {
  margin-bottom: 15px;
  display: flex;
  align-items: center;
}

.form-group label {
  margin-left: 10px;
}

.code-input {
  width: 100%;
  height: 80vh;
  padding: 10px;
  font-family: monospace;
  font-size: 14px;
  border: 1px solid #ccc;
  border-radius: 5px;
  resize: vertical;
}

.code-input.dark-mode {
  background-color: #333;
  color: #fff;
}

.code-area {
  display: flex;
  align-items: center;
}

.code-area textarea {
  flex: 1;
}

.modal-content{
  display: flex;
  flex-direction: column;
  width: 50%;

}
h1,p{
  margin-bottom: 16px;

}
h1{
  font-size: 32px;

}
p{
  font-size: 18px;
}
</style>