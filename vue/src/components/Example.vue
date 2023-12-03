<template>
    <div class="example">
        <h2 class="example-title">{{ item.title }}</h2>
        <h3 class="example-tag">{{ item.tag }}</h3>
        <h4 class="example-language">{{ item.language }}</h4>
        <h5 class="code">{{ item.code }}</h5>
    </div>
</template>
<script>
export default {
    name: 'example',
    props: ["item"]
}
</script>
<style>
/* .container {
  flex-wrap: wrap;
  display: inline-block;
  height: 12rem;
  min-width: 300px;
  border: 2px solid black;
  border-radius: 10px;
  margin: 20px;
}

.orange {
  background-color: orange;
}
.yellow {
  background-color: yellow;
}
.tan {
  background-color: tan;
} */
</style>









