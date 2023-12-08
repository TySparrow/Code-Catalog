<template>
  <div class = "example"> 
        <button class="example-language" v-on:click="ListExamples()">Language:{{ item.language }}</button>
  </div>
</template>
<script>
export default {
    name: 'language',
    props: ["item"],
    methods: {
        ListExamples() {
        
            this.$router.push({ name: 'listExamples', params: {language: this.item.language} })
        }
    },
    
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
 .example{
    text-align: center;
    display: inline-block;
}  
.example-language {
    border: none;
    padding: 20px 40px; /* Increase padding for larger size */
  
  height: 60px; /* Adjust height as needed */
    position: relative;
    text-align: center;
    border-bottom: 3px solid transparent;
    display: grid;
    transition: 0.3s;
    flex-wrap: wrap;
    cursor: pointer;
    background-color: #f5f5f5;
} 

.example:hover {
    background-color: #c0c0c0;
    border-bottom-color: #00ADEE;
    cursor: pointer;
}
.example-language:hover {
    background-color: #c0c0c0;
    border-bottom-color: #00ADEE;
    cursor: pointer;
}

</style>









