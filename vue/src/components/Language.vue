<template>
  <div class = "example"> 
        <p class="example-language">Language:{{ item.language }}</p>
  </div>
</template>
<script>
export default {
    name: 'language',
    props: ["item"],
    
}
</script>
<style scoped>
 /* .example {
  flex-wrap: wrap;
  display: inline-block;
  height: 40px;
  min-width: 20px;
  border: 2px solid black;
  border-radius: 5px;
  margin: 20px;
  background-color: tan;
  justify-content: center;
} */
.example {
    padding: 10px 20px;
    position: relative;
    text-align: center;
    border-bottom: 3px solid transparent;
    display: inline-block;
    transition: 0.3s;
    flex-wrap: wrap;
}

.example:hover {
    background-color: #c0c0c0;
    border-bottom-color: #00ADEE;
    cursor: pointer;
}

</style>









