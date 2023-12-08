<template>
  <div class="body-container">
    <div>
      <p class="code-title"> {{ item.title }}</p>
      <p class="code-language">Language: {{ item.language }}</p>
    </div>
    <div class="example">
      <p class="code-source">Source: {{ item.source }}</p>
      <pre v-text="item.code" :class="['code', 'example', darkMode ? 'dark' : '']"></pre>
      <p class="tag-bubble">#{{ item.tag }}</p>
      <div class="button-container">
        <button @click="toggleDarkMode()" class="dark-mode-button" type="button">Toggle Dark Mode</button>
        <button class="download-button" type="button" @click="downloadCode">Download</button>
        <button class="copy-button" type="button" :data-clipboard-text="item.code">Copy to Clipboard</button>
      </div>
    </div>
  </div>
</template>

<script>

import Prism from 'prismjs';
import { saveAs } from 'file-saver';
import Clipboard from 'clipboard';

export default {

  props: ["item"],

  data() {
    return {
      darkMode: false, // Initialize dark mode as false
    };
  },

  methods: {
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
.example {
  display: flex;
  flex-direction: column;
  align-items: flex-start;
  justify-content: flex-start;
  width: 80%;
  padding: 20px;
  border: 2px solid #ccc;
  border-radius: 10px;
  margin: 20px auto;
  background-color: #f5f5f5;
  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
  margin-left: 13px;
}

.example.dark {
  background-color: #333;
  color: #fff;
  border-color: #666;
}

.example p {
  margin: 0;
  font-size: 16px;
}

.example.dark p {
  color: #ccc;
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
  width: 100%;
}

.tag-bubble {
  display: inline-block;
  padding: 8px 12px;
  border-radius: 20px;
  color: #fff;
  font-size: 12px;
  margin-top: 10px;
  margin-bottom: 20px;
  background-color: #00ADEE;
  margin-right: 10px;
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

.code-language {
  font-size: 14px;
  margin-bottom: 10px;
  margin-left: 13px;
}

.code-source {
  font-size: 12px;
  margin-top: 15px;
  margin-bottom: 15px;

}

.copy-button {
  background-color: #343a40;
  color: #fff;
  border: none;
  padding: 8px 16px;
  border-radius: 4px;
  cursor: pointer;
}

.download-button {
  background-color: #343a40;
  color: #fff;
  border: none;
  padding: 8px 16px;
  border-radius: 4px;
  cursor: pointer;
}

.dark-mode-button {
  background-color: #343a40;
  color: #fff;
  border: none;
  padding: 8px 16px;
  border-radius: 4px;
  cursor: pointer;
}

.button-container {
  display: flex;
  justify-content: space-between;
  margin-top: 20px;
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

  .dark-mode-button {
    margin-bottom: 10px;
  }

  .download-button {
    margin-bottom: 10px;
  }
}
</style>