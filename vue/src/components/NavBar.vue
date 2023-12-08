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
        //this routes the home button to the home page
        returnHome() {
            this.$router.push({ name: 'home' })
        },
        //this routes the user to a searchexamplesview after a search was inputted
        ListExamples() {
        
            this.$router.push({ name: 'searchExamples', params: {search: this.search} })
        },
        //this method bounds the click of the button to the enter key 
        handleEnter(event) {
        if (event.key === "Enter") {
            event.preventDefault();
            this.ListExamples();
        }
        },
    },

    data() {
        return {
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
    grid-template-areas: "logo menus search button dropdown";
    background-color: #f5f5f5;
    border-bottom: thin solid rgb(139, 139, 139)
    
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
    width: 50px; 
    height: 30px; 
    grid-area: button;
    margin-right: 5px
}
.dropdown {
    grid-area: dropdown;
    margin-right: 20px;
    position:fixed;
    right: 0;
}

.menu-item {
    grid-area: menus;
}
.search-bar {
    grid-area: search;
    height: 30px;
    
}
@media (max-width: 1024px) {
    .nav-bar {
        grid-template-columns: auto auto auto;
        grid-template-areas: "logo search button dropdown" 
        
    }
    .menu-item {
        display: none; /* Hide menu items at this screen size */
    }
}
@media (max-width: 560px) {
  
    .nav-bar {
        grid-template-columns: auto 0.25fr auto;
        grid-template-areas: "logo search button dropdown" 
        
    }
    .menu-item {
        display: none; /* Hide menu items at this screen size */
    }
  /*Need to fully finish max width and how it changes the navigation bar appearance*/
}
</style>
