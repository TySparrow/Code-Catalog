<template>
    <!-- THIS PAGE SHOULD BE FOR ADMIN DISPLAY EDIT/CREATE PUBLIC/DELETE/ETC -->
<div class="body-container">
        <ul>
            <li class="code-title"> {{ item.title }}</li>
            <li class="code-language">Language: {{ item.language }}</li>
            <li class="code-source">Source: {{ item.source }}</li>
            <li class="tag-bubble">#{{ item.tag }}</li>
        </ul>
        <!-- Should hide the example code until a button is pressed -->
        <pre v-text="item.code" :class="['code', 'example', darkMode ? 'dark' : '']"></pre>
  </div>
</template>

<script>
export default {

    props: ["item"],

}
</script>





<style scoped>
.body-container {
    display:block;
}
</style>