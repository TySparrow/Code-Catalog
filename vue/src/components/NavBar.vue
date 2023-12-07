<template>
    <nav class="nav-bar">
        <img src="src\assets\techelevatorimage.png" alt="Logo" class="logo" v-on:click="returnHome">
        <ListLanguages class="menu-item"></ListLanguages>
        <input class="search-bar" type="text" v-model="search" placeholder="Search Examples">
        <Dropdown class="dropdown"/>
    </nav>
</template>
<script>
import ListLanguages from "@/components/ListLanguages.vue"
import Dropdown from "@/components/Dropdown.vue";

export default {
    components: { ListLanguages, Dropdown },
    methods: {
        returnHome() {
            this.$router.push({ name: 'home' })
        },
    },
    data() {
        return {
            examples: [],
            search: ''
        }
    },
    
    
}
</script>

<style>


.nav-bar {
    display:grid;
    align-items: center;
    grid-template-columns: 1fr, 1fr, 1fr, 1fr;
    grid-template-areas: "logo menus search dropdown";
    background-color: #f5f5f5;
}

.logo {
    width: 60px;
    height: auto;
    margin-left: 1rem;
    margin-right: 2rem;
    cursor: pointer;
    grid-area: logo;

}
.dropdown {
    grid-area: dropdown
}

.menu-item {
    grid-area: menus;
    position:static
}
.search-bar {
    grid-area: search;
    height: 30px;
    
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

