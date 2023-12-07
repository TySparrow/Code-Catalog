<template>
  <div>
    <p class="code-title">Title:{{ item.title }}</p>
    <p class="code-language">Language:{{ item.language }}</p>
  </div>
  <div class="example">
    <p class="code-source">Source:{{ item.source }}</p>
    <pre v-text="item.code" :class="['code', 'example', darkMode ? 'dark' : '']"></pre>
    <p class="tag-bubble">#{{ item.tag }}</p>
    <button @click="toggleDarkMode()" class="button" type="button">Toggle Dark Mode</button>
  </div>
</template>
<script>
export default {
  name: 'example',
  props: ["item"],
  data() {
    return {
      darkMode: false,
    };
  },
  methods: {
    toggleDarkMode() {
      this.darkMode = !this.darkMode;
    },
  },
  
}
</script>

<style scoped>
.button {
  background-color: #585858;
  border: none;
  color: white;
  padding: 10px 20px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 10px;
  border-radius: 20px;
  margin-bottom: 10px;
  margin-top: 15px;
  cursor: pointer;
  transition: background-color 0.3s ease, color 0.3s ease;

}

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
  margin-left: 10px;
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
  margin-bottom: 10px;
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
}

.code-language {
  font-size: 14px;
  margin-bottom: 10px;
}

.code-source {
  font-size: 12px;
  margin-top: 15px;
  margin-bottom: 15px;

}
</style>