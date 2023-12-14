<template>
  <div class="body">
    <modal @close="toggleModal" :modalActive="modalActive">
      <div class="modal-content">
        <h2>{{ this.confirmation }}</h2>
      </div>
    </modal>
    <form v-on:submit.prevent="createNewExample" v-on:keydown.enter.exact="handleEnterKey" class="example-form">
      <div class="title">
        <label for="title" class="title-text">Title: </label>
        <input class="lng-input" type="text" name="title" id="title" v-model="newExample.title" />

        <label for="tag" class="tag-text">Tag: </label>
        <input class="lng-input" type="text" name="tag" id="tag" v-model="newExample.tag" />

        <label for="language" class="lng-text">Language: </label>
        <input class="lg-input" type="text" name="language" id="language" v-model="newExample.language" />
      </div>
      <div>
        <label for="code" class="code-text">Code:</label>
        <pre class="code-area">
          <textarea name="code" id="code" :class="{ 'code-input': true, 'dark-mode': darkMode }" v-model="newExample.code"
          placeholder="Enter your code here"></textarea>
        </pre>
      </div>
      <div class="source">
        <label for="source" class="src-text">Source: </label>
        <input class="lng-input" type="text" name="source" id="source" v-model="newExample.source" />
      </div>
      <div class="form-group">
        <button @click="toggleDarkMode" class="dark-mode-btn">Dark Mode</button>
        <button @click="toggleModal" type="submit" class="save-btn">Save Example</button>
      </div>
    </form>
  </div>
</template>

<script>
import prettier from 'prettier';
import Prism from 'prismjs';
import 'prismjs/themes/prism.css';
import modal from '@/components/PopUp.vue'
import{ref} from "vue";
import exampleService from "../services/ExampleService.js";

export default {

  components: { modal },

  data() {
    return {
      newExample: {},
      darkMode: false,
      confirmation: "",
    };
  },

  setup() {
    const modalActive = ref(false);

    const toggleModal = () => {
      modalActive.value = !modalActive.value;
    };
    return { modalActive, toggleModal };
  },

  methods: {
    createNewExample() {
      console.log("create new example");
      if (this.newExample.title) {
        this.newExample.id = this.nextExampleId();
        this.newExample.status = "Private";
        exampleService.addExample(this.newExample).then((response) =>{
          this.confirmation = response.data;
          if(response.data ==='This title has been taken'|| response.data ==='Error Saving Snippet. Please Try Again' ){
            return;
          }
          else{

            this.newExample = {};
          }
        })
        // Needs some work to catch different issues
        console.log("create new example method ", this.confirmation);
        this.example= "";
      }
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

.title {
  display: flex;
  align-items: center;
  gap: 10px;
}



.src-text,
.lng-text,
.tag-text,
.code-text,
.title-text {
  font-weight: bold;
  color: #333;
  margin-bottom: 5px;
}

.source,
.language,
.tag,
.title {
  margin-bottom: 10px;
}

.lng-input {
  width: 28%;
  height: 30px;
  padding: 10px;
  font-size: 14px;
  border: 1px solid #ccc;
  border-radius: 5px;
  resize: vertical;
  margin-bottom: 10px;
}

.lg-input {
  width: 28%;
  height: 30px;
  padding: 10px;
  font-size: 14px;
  border: 1px solid #ccc;
  border-radius: 5px;
  resize: vertical;
  margin-bottom: 10px;
}

.tag-text {
  margin-right: 7px;
}

.source {
  margin-top: 10px;
}

.body {
  padding-top: 25px;
}

.dark-mode-btn {
  background-color: #343a40;
  color: #fff;
  border: none;
  padding: 8px 16px;
  border-radius: 4px;
  cursor: pointer;
  margin-top: 10px;
}

.save-btn {
  background-color: #343a40;
  color: #fff;
  border: none;
  padding: 8px 16px;
  border-radius: 4px;
  cursor: pointer;
  margin-top: 10px;
  margin-left: 10px;
}

.example-form {
  display: flex;
  flex-direction: column;
  width: 50%;
  margin: 0 auto;
}

.code-area {
  white-space: pre-wrap;
  margin: 20px 0;
  font-size: 16px;
  line-height: 1.5;
  background-color: #fff;
  border: 1px solid #ccc;
  border-radius: 5px;
  padding: 10px;
  width: 100%;
  margin-bottom: 30px;
  background-color: #f5f5f5;
  box-shadow: 0 2px 4px rgba(0, 0, 0, .3);
}

.form-group {
  margin-bottom: 15px;
  display: flex;
  align-items: center;
  flex-direction: row;
  gap: 5px;
}

.form-group label {
  margin-left: 10px;
  display: inline-block;

}

.form-group input {
  flex: 1;
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

.modal-content {
  justify-content: center;

}

h1,
p {
  margin-bottom: 16px;

}

h1 {
  font-size: 32px;

}

p {
  font-size: 18px;
}</style>
