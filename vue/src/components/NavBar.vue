<template>
    <nav class="nav-bar">
        <img src="@/assets/techelevatorimage.png" alt="Logo" class="logo" v-on:click="returnHome">
        <ListLanguages class="menu-item"></ListLanguages>
        <input id="myInput" class="search-bar" type="text" v-model="search" placeholder="Search Examples">
    <button id="myBtn" @click="ListExamples">Search</button>
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
        ListExamples() {
        
            this.$router.push({ name: 'searchExamples', params: {search: this.search} })
        },
        handleEnter(event) {
      if (event.key === "Enter") {
        event.preventDefault();
        this.ListExamples();
      }
    },
    },
    data() {
        return {
            examples: [],
            search: ''
        }
    },
    mounted() {
    // Attach event listener after the component is mounted
    let input = document.getElementById("myInput");
    input.addEventListener("keypress", this.handleEnter);
  },
    
    
}
</script>

<style>


.nav-bar {
    display:grid;
    align-items: center;
    grid-template-columns: auto, auto, 1fr, auto, auto;
    grid-template-areas: "logo menus search  button dropdown";
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
#myBtn {
    width: 50px; /* Adjust width as needed */
    height: 30px; /* Adjust height as needed */
    grid-area: button;
    margin-right: 5px
}
.dropdown {
    grid-area: dropdown;
    margin-right: 20px;
}

.menu-item {
    grid-area: menus;
    position:static
}
.search-bar {
    grid-area: search;
    height: 30px;
    
}
@media (max-width: 1024px) {
  .menu-item {
    display: none;
  }
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

