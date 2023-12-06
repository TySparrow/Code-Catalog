<template>
  <section class="example">
    <p class="example-title">ID:{{ item.title }}</p>
    <p class="example-tag">Tag:{{ item.tag }}</p>
    <p class="example-language">Language:{{ item.language }}</p>
    <p class="code"> Code:{{ item.code }}</p>
    <p class="source">Source: {{ item.source }}</p>

  </section>
  <div>
    <button @click="toggleDarkMode">Dark Mode</button>
    <button @click="formatCode">Format Code</button>
  </div>
</template>
<script>
export default {
  name: 'example',
  props: ['item'],
};

</script>
<style scoped>
.example {
  border: 1px solid black;
  margin: 10px;
  padding: 10px;
  width: 3330px;
  height: 400px;
  display: inline-block;
  background-color: #f2f2f2;
}

.code {
  flex-grow: 1;
  resize: none;
  width: 50%;
}
</style>









