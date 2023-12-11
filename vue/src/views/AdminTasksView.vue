<template>
    <div v-if="$store.state.user.role == 'admin'" class="container">
        <table class="adminTable">
            <thead>
                <tr>
                    <th>Title</th>
                    <th>Tag</th>
                    <th>Language</th>
                    <th>Source</th>
                </tr>
            </thead>
            <tbody>
                <tr>

                    <td>
                        <select>
                            <!-- id="statusFilter" v-model="filter.status" -->
                            <!-- Options to show public, or private, or all -->
                            <option value>Show All</option>
                            <option value="Active">Active</option>
                            <option value="Inactive">Inactive</option>
                        </select>
                    </td>

                </tr>
                <tr v-for="example in examples" v-bind:key="example.id">
                    <td>
                        <input type="checkbox" />
                        <!-- v-model="selectedUserIds" v-bind:id="user.id" v-bind:value="user.id" -->
                    </td>
                    <td>{{ example.title }}</td>
                    <td>{{ example.tag }}</td>
                    <td>{{ example.language }}</td>
                    <td>{{ example.source }}</td>
                    <td>{{ example.code }}</td>
                    <td>
                        <button>
                            <!-- class="btnActivateDeactivate" v-on:click="toggleStatus(user.id)" -->
                            <!-- {{ user.status === 'Active' ? 'Deactivate' : 'Activate' }} -->
                        </button>
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
    <div v-else>You are not authorized to view this page</div>
</template>

<script>
import exampleService from '../services/ExampleService';
export default {
    data() {
        return {
            examples: []
        }
    },
    created() {
        exampleService
            .getExamples()
            .then((response) => {
                console.log("Reached LOAD_EXAMPLES in ListExamplesView.vue");
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
    },

}


</script>


<style></style>