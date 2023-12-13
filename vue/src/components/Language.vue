<template>
    <div class="example">
        <button class="example-language" v-on:click="ListExamples()">{{ item.language }}</button>
    </div>
</template>

<script>

export default {


    props: ["item"],

    methods: {
        // This takes the user to the ListExamplesView 
        ListExamples() {
            this.$router.push({ name: 'listExamples', params: { language: this.item.language } })
        }
    },

}

</script>
<style scoped>
.example {
    text-align: center;
    display: inline-block;
    
}

.example-language {
    border: none;
    padding: 20px 40px;
    height: 60px;
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
button{
    font-size: 100%;
}
</style>









