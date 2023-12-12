<template>
    <div v-if="$store.state.user.role == 'admin'" class="container">
        <navBar></navBar>
        <table class="admin-table">
            <thead>
                <tr class="table-header">
                    <th>Title</th>
                    <th>Tag</th>
                    <th>Language</th>
                    <th>Source</th>
                    <th>Code</th>
                    <th>Toggle Status</th>
                </tr>
            </thead>
            <tbody>
                <tr v-for="example in examples" v-bind:key="example.id">
                    <td>
                        <input type="text" v-model="example.title">
                    </td>
                    <td>
                        <input type="text" v-model="example.tag">
                    </td>
                    <td>
                        <input type="text" v-model="example.language">
                    </td>
                    <td>
                        <input type="text" v-model="example.source">
                    </td>
                    <td>
                        <input type="text" v-model="example.code">
                    </td> 
                    <td>
                        <!-- v-bind:class="{ pending: example.status === 'pending' }" -->
                        <!-- This will bind to a class in styling to have a different color if there is a pending request to change to public -->
                        <button v-on:click="toggleStatus(example.id)">{{ example.status }}</button>
                    </td>
                    <td><button v-on:click="confirmChanges(example)"></button></td>
                    <!-- V-if for if pending to show a notification alert icon -->
                    <!-- Need a save button. Save single/save all? -->
                </tr>
                <!-- <tr>
                    <td>
                        <select id="statusFilter">
                            Needs options to show public, or private, or all (v-model?)
                            <option value>Show All</option>
                            <option value="Public">Public</option>
                            <option value="Private">Private</option>
                        </select>
                    </td>
                </tr> -->
            </tbody>
        </table>
    </div>
    <div v-else>You are not authorized to view this page</div>
</template>
<script>
import exampleService from '../services/ExampleService';
import navBar from '@/components/NavBar.vue';
export default {
    components: {
        navBar
    },
    data() {
        return {
            examples: [],
            exampleStatus: ''
        }
    },
    methods: {
        confirmChanges(example){
            exampleService.UpdateExample(example);
        },
        toggleStatus(exampleId) {
            const example = this.examples.find((example) => example.id === exampleId);
            console.log(example.id)
            if (example) {
                if (example.status.toLowerCase().includes('public')) {
                    example.status = 'private';
                } else{
                    example.status = 'public'
                }
                exampleService.UpdateExample(example)
                console.log(example)
            }
        }
    },
    created() {
        exampleService
            .getExamples(this.exampleStatus)
            .then((response) => {
                console.log("Reached LOAD_EXAMPLES in AdminTasksView.vue");
                console.log(response);
                this.examples = (response.data);
            })
            .catch((error) => {
                if (error.response) {
                    // error.response exists
                    // Request was made, but response has error status (4xx or 5xx)
                    console.log("Error loading EXAMPLES: ", error.response.status);
                } else if (error.request) {
                    // There is no error.response, but error.request exists
                    // Request was made, but no response was received
                    console.log(
                        "Error loading EXAMPLES: unable to communicate to server"
                    );
                } else {
                    // Neither error.response and error.request exist
                    // Request was *not* made
                    console.log("Error loading EXAMPLES: make request");
                }
            });
    }
}
</script>
<style scoped>
table {
    margin-top: 20px;
    font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Oxygen,
        Ubuntu, Cantarell, "Open Sans", "Helvetica Neue", sans-serif;
    margin-bottom: 20px;
    border-style: solid;
}
th {
    text-transform: uppercase;
    border-bottom: solid;
}
td {
    padding: 20px;
}
button.public {
    color: red;
}
</style>
