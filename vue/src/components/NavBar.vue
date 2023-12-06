<template>
    <nav>
        <img src="src\assets\techelevatorimage.png" alt="Logo" class="logo" v-on:click="returnHome">
        <ListLanguages class="menu-item"></ListLanguages>  
    </nav>
</template>
<script>
import ListLanguages from "../components/ListLanguages.vue"
export default {
    components: {ListLanguages},
    methods: {
        returnHome() {
            this.$router.push({ name: 'home' })
        }
    },
}
</script>

<style>
nav {
    display: flex;
    align-items: center;
    justify-content: center;
    background-color: #f5f5f5;
}

nav .menu-item {
    padding: 10px 20px;
    position: relative;
    text-align: center;
    border-bottom: 3px solid transparent;
    display: flex;
    transition: 0.3s;
}
nav .menu-item:hover {
    background-color: #c0c0c0;
    border-bottom-color: #00ADEE;
}

.logo {
    width: 60px;
    height: auto;
    margin-right: 1rem;
    cursor: pointer;

}

</style>












<!-- <style scoped>
* {
    box-sizing: border-box;
}


.topnav {
    overflow: hidden;
    background-color: #f5f5f5;
    position: fixed;
    list-style-type: none;
    top: 0;
    width: 100%;
    white-space: nowrap;
    display: inline-flex;
}

#yes {
    position: fixed;
    padding-left: 70%;
}

.topnav li {

    text-align: center;
    padding: 14px 16px;
    text-decoration: none;
    display: inline-flex;
}

#tab {
    color: #00ADEE;
    text-decoration: none;
}

.logo {
    width: 60px;
    height: auto;
    margin-right: 1rem;
    cursor: pointer;

}
</style> -->

<!-- <aside class="topnav">
            <li><img src="src\assets\techelevatorimage.png" alt="Logo" class="logo" v-on:click="returnHome"></li>

            <div id="yes">

                <li><router-link id="tab" v-bind:to="{ name: 'newExample' }" v-show="$store.state.token != ''">Add New
                        Snippet</router-link> </li>
                <li><router-link v-bind:to="{ name: 'listExamples' }" class="example">Show Examples</router-link></li>
                <li><router-link id="tab" v-bind:to="{ name: 'logout' }"
                        v-if="$store.state.token != ''">Logout</router-link></li>

            </div>
        </aside> -->

