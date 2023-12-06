<template>
  <div class="body">
    <form v-on:submit.prevent="createNewExample" v-on:keydown.enter.exact="handleEnterKey" class="example-form">
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
        <textarea name="code" id="code" :class="{ 'code-input': true, 'dark-mode': darkMode }" v-model="newExample.code"
          placeholder="Enter your code here"></textarea>
      </div>
      <div>
        <label for="source">Source </label>
        <input type="text" name="source" id="source" v-model="newExample.source" />
      </div>
      <div class="form-group">
        <button @click="toggleDarkMode" class="dark-mode-btn">Dark Mode</button> 
        <button @click="formatCode">Format Code</button>
        <button type="submit">Save Example</button>

      </div>

    </form>
  </div>
</template>

<script>
import prettier from 'prettier';
import Prism from 'prismjs';
import 'prismjs/themes/prism.css';


export default {
  data() {
    return {
      newExample: {},
      darkMode: false,
    };
  },

   methods: {
    createNewExample() {
      if (this.newExample.title) {
        this.newExample.id = this.nextExampleId();
        this.$store.commit("ADD_EXAMPLE", this.newExample);
      }
      this.newExample = {};
    },
    toggleDarkMode() {
      this.darkMode = !this.darkMode;
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
    formatCode() {
      const formattedCode = prettier.format(this.newExample.code, {
        parser: 'babel',
      });
      this.newExample.code = formattedCode;
    },
    handleEnterKey(event) {
      if (event.keyCode === 13) {
        event.preventDefault();
      }
    },
  },
}
</script>

<style scoped>

.body{
  padding-top: 25px;
}
.example-form{
  display:flex;
  flex-direction: column;
  width: 50%;
  margin: 0 auto;
 }
 .form-group{
  margin-bottom:15px;
  display:flex;
  align-items: center;
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
</style>