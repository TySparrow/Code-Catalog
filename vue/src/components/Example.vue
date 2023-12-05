<template>
  <section class = "example"> 
        <p class="example-title">ID:{{ item.title }}</p>
        <p class="example-tag">Tag:{{ item.tag }}</p>
        <p class="example-language">Language:{{ item.language }}</p>
        <p class="code">Code:{{ item.code }}</p>
        <p class="source">Source: {{ item.source }}</p>
</section>
</template>
<script>
export default {
    name: 'example',
    props: ["item"]
}
</script>
<style scoped>
 .example {
  flex-wrap: wrap;
  display: inline-block;
  height: 12rem;
  min-width: 300px;
  border: 2px solid black;
  border-radius: 10px;
  margin: 20px;
  background-color: tan;
}

</style>









