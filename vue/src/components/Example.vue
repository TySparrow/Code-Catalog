<template>
    <div class="example">
        <p class="example-title">Title: {{ item.title }}</p>
        <p class="example-tag">Tag: {{ item.tag }}</p>
        <p class="example-language">Language: {{ item.language }}</p>
        <p class="code">Code Example:{{ item.code }}</p>
    </div>
</template>
<script>
export default {
    name: 'example',
    props: ["item"]
}
</script>
<style>
 .example {
  flex-wrap: wrap;
  display: inline-block;
  height: 12rem;
  min-width: 300px;
  border: 2px solid black;
  border-radius: 10px;
  margin: 20px;
}

</style>









