<template>
  <div class="body-container">
    <div>
      <div v-if="!editButton">
        <p class="code-title"> {{ item.title }}</p>
        <p class="code-language">Language: {{ item.language }}</p>

        <div class="example">
          <p class="code-source">Source: {{ item.source }}</p>
          <pre v-text="item.code" :class="['code', 'example', darkMode ? 'dark' : '']"></pre>
          <p class="tag-bubble">#{{ item.tag }}</p>

        </div>
      </div>
      <div v-if="editButton">
        Title:<input class="code-title" type:="text" v-model="example.title">
        Language:<input class="code-language" type:="text" v-model="example.language">

        <div class="textEx">
          Source:<input class="code-source" type:="text" v-model="example.source">
          <div class="text-area">
            <pre>
              <textarea  rows="25"  cols="0"  v-model="example.code" :class="['code', 'example', darkMode ? 'dark' : '']" 
              placeholder="Enter your code here"></textarea>
            </pre>
          </div>
          <input class="tag-bubble" type:="text" v-model="example.tag">
        </div>
        <button class="save-button" type="submit" v-on:click="saveExample(example)">Save</button>

        <button class="save-button" type="submit" v-on:click="cancelChanges()">Cancel</button>
      </div>
      <div class="button-container">

        <button class="edit-button"
          v-if="($store.state.user.role == 'admin' || $route.name == 'myExamples') && this.editButton === false"
          v-on:click="this.editButton = true">
          Edit </button>

        <button @click="toggleDarkMode()" class="dark-mode-button" type="button">Toggle Dark Mode</button>
        <button class="download-button" type="button" @click="downloadCode">Download</button>

        <button class="copy-button" type="button" :data-clipboard-text="item.code">Copy to Clipboard</button>

        <button class="public-button" type="button" v-if="this.$route.name == 'myExamples'" @click="statusChange(item)">{{
          item.status }}
        </button>

      </div>
    </div>
  </div>
</template>

<script>

import Prism from 'prismjs';
import { saveAs } from 'file-saver';
import Clipboard from 'clipboard';
import ExampleService from '../services/ExampleService';

export default {

  props: ["item"],

  data() {
    return {
      darkMode: false, // Initialize dark mode as false
      updatedItem: {},
      editButton: false,
      example: this.item,
    };
  },

  methods: {
    saveExample(example) {
      ExampleService.updateExample(example);
      this.editButton = false;
    },
    cancelChanges() {

      this.$router.go();
    },

    statusChange(item) {
      if (item.status == 'Private') {
        item.status = 'Pending';
      } else if (item.status == 'Pending') {
        item.status = 'Private';
      } else {
        item.status = 'Private'
      }
      ExampleService.updateExample(item);
    },
    toggleDarkMode() {
      this.darkMode = !this.darkMode; // Toggle dark mode when the button is clicked
    },
    downloadCode() {
      const confirmed = window.confirm('Are you sure you want to download this code snippet?')
      if (confirmed) {
        // Create a Blob with the code snippet and download it as a file
        // The Blob object represents a file-like object of immutable, raw data
        // It can be used to create a file from the code snippet and download it
        const blob = new Blob([this.item.code], { type: 'text/plain;charset=utf-8' });
        saveAs(blob, `${this.item.title}.${this.item.language}`);
      }
      else {
        return;
      }
    },

    copyCode() {
      const codeElement = document.querySelector('.code');
      if (codeElement) {
        const code = codeElement.innerText;
        // Copy the code snippet to the clipboard
        navigator.clipboard.writeText(code)
          .then(() => {
            console.log('Code copied to clipboard');
          })
          .catch((error) => {
            // Error occurred while copying code
            console.error('Failed to copy code:', error);
          });
      }
      window.alert('Copied to Clipboard')
    },
  },


  mounted() {
    const clipboard = new Clipboard('.copy-button');
    clipboard.on('success', (e) => {
      e.clearSelection();
    });
    clipboard.on('error', (e) => {
      console.error('Action:', e.action);
      console.error('Trigger:', e.trigger);
    });
    // The mounted hook is called after the component has been mounted to the DOM

  }
}
</script>

<style scoped>
.text-area {
  width: 80%;
  height: 100%;
  resize: none;
}

.textEx {
  display: flex;
  flex-direction: column;
  align-items: flex-start;
  justify-content: flex-start;
  width: 60vw;
  padding: 35px;
  border: 2px solid #ccc;
  border-radius: 10px;
  margin: 20px auto;
  background-color: #f5f5f5;
  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
  margin: 20px 13px 20px 14px;
}

.public-button,
.edit-button,
.save-button {
  background-color: #343a40;
  color: #fff;
  border: none;
  padding: 8px 16px;
  border-radius: 4px;
  cursor: pointer;
  margin-right: 10px;
}

.save-button:hover {
  background-color: #0056b3;
}

.example,
.example.dark {
  display: flex;
  flex-direction: column;
  align-items: flex-start;
  justify-content: flex-start;
  width: 50vw;
  padding: 35px;
  border: 1px solid #ccc;
  border-radius: 10px;
  margin: 20px auto;
  background-color: #f5f5f5;
  box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
  margin-left: 13px;
}

.example.dark {
  background-color: #333;
  color: #fff;
  border-color: #666;
}

.example p,
.example.dark p {
  margin: 0;
  font-size: 16px;
}

.code {
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
}

.tag-bubble,
.tag-bubble.dark {
  display: inline-block;
  padding: 8px 12px;
  border-radius: 20px;
  color: #fff;
  font-size: 12px;
  margin-top: 10px;
  margin-bottom: 20px;
  margin-right: 10px;
  background-color: #00ADEE;
}

.tag-bubble.dark {
  background-color: #667;
}

.code-title {
  font-size: 18px;
  font-weight: bold;
  margin-top: 20px;
  margin-bottom: 10px;
  margin-left: 13px;
}

.code-language,
.code-source {
  font-size: 14px;
  margin-bottom: 10px;
  margin-left: 13px;
}

.code-source {
  font-size: 12px;
  margin-top: 15px;
  margin-bottom: 15px;
}

.copy-button,
.download-button,
.dark-mode-button {
  background-color: #343a40;
  color: #fff;
  border: none;
  padding: 8px 16px;
  border-radius: 4px;
  cursor: pointer;
  margin-right: 10px;
}

.button-container {
  display: flex;
  justify-content: space-between;
  margin-top: 20px;
  height: 60px;
  width: 40vw;
}

.copy-button,
.download-button,
.dark-mode-button {
  flex: 1;
  margin-right: 10px;
}

@media (max-width: 321px) {
  .button-container {
    flex-direction: column;
  }

  .dark-mode-button,
  .download-button {
    margin-bottom: 10px;
  }
}
</style>