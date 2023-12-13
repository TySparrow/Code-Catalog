<template>
    <div>
        <button class="dropdown-menu" @click="toggleDropDown">
            Hello,
            {{ this.$store.state.user.username }}
        </button>
        <div v-if="showDropDown" class="dropdown-content" v-on:mouseleave="closeDropDown">
            <p class="user-role" v-if="this.$store.state.user.role == 'admin'">Role: {{ this.$store.state.user.role }}</p>
            <router-link v-bind:to="{ name: 'myExamples' }" class="dropdown-item">My Examples</router-link>
            <!-- Check if user role is admin to show extra dropdown item -->
            <router-link v-bind:to="{ name: 'adminPage' }" v-show="$store.state.user.role == 'admin'" class="dropdown-item">
                Edit Examples</router-link>
            <li class="dropdown-item" v-on:click="createSnippet">Add New Code Snippet</li>
            <a href="https://www.techelevator.com/about-us/tech-elevator/" target="_blank" class="dropdown-item">About
                Us</a>
            <router-link v-bind:to="{ name: 'logout' }" class="dropdown-item">Logout</router-link>

        </div>
    </div>
</template>

<script>

export default {

    data() {
        return {
            showDropDown: false
        }
    },

    methods: {
        toggleDropDown() {
            this.showDropDown = !this.showDropDown;
        },
        closeDropDown() {
            this.showDropDown = false;
        },
        createSnippet() {
            this.$router.push({ name: 'newExample' })
            this.closeDropDown();
        },

    }
}
</script>


<style>
/* Style the button */
.dropdown-menu {
    padding: 10px 10px;
    position: relative;
    text-align: center;
    border: none;
    border-radius: 2px;
    border-bottom: 3px solid transparent;
    display: inline-block;
    transition: 0.3s;
    flex-wrap: wrap;
    background-color: #f5f5f5;
}

.user-role {
    display: flex;
    padding: 5px 10px;
    justify-content: center;
    color: #333;
    text-decoration: none;

}


.dropdown-menu:hover {
    background-color: #c0c0c0;
    border-bottom-color: #00ADEE;
    cursor: pointer;
}

.dropdown-content {
    background-color: #f9f9f9;
    min-width: 150px;
    box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
    border-radius: 5px;
    padding: 5px;
    right: 0%;
    position: fixed;


}


.dropdown-item {
    display: flex;
    padding: 5px 10px;
    justify-content: center;
    color: #333;
    cursor: pointer;
    text-decoration: none;


}

.dropdown-item:hover {
    cursor: pointer;
    transition: 0.3s;
    background-color: #c0c0c0;
    border-bottom-color: #00ADEE;
}
</style>

