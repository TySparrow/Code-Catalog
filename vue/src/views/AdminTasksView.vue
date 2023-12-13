<template>
    <navBar></navBar>
    <h1 class="title">Admin Tools</h1>
    <div v-if="$store.state.user.role == 'admin'" class="container">
        <p>Total examples: {{ examples.length }}</p>
        <div class="table-wrapper">
            <table class="admin-table">
                <thead>
                    <tr id="header">
                        <th>Title</th>
                        <th>Tag</th>
                        <th>Language</th>
                        <th>Source</th>
                        <th>Code</th>
                        <th>Status</th>
                        <th>Toggle Status</th>
                        <th>Edit/Save Changes</th>
                    </tr>
                    <tr class="filters">
                        <td id="titleFilter">
                            <input type="text" v-model="filter.title" />
                        </td>
                        <td id="tagFilter">
                            <input type="text" v-model="filter.tag" />
                        </td>
                        <td id="languageFilter">
                            <input type="text" v-model="filter.language" />
                        </td>
                        <td id="sourceFilter">
                            <input type="text" v-model="filter.source" />
                        </td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>
                            <select id="statusFilter" v-model="filter.status">
                                <option value>Show All</option>
                                <option value="Public">Public</option>
                                <option value="Private">Private</option>
                                <option value="Pending">Pending</option>
                            </select>
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                </thead>
                <tbody>
                    <tr v-for="example in filteredList" v-bind:key="example.id">
                        <td>
                            <input type="text" v-model="example.title" :disabled="!example.editMode">
                        </td>
                        <td>
                            <input type="text" v-model="example.tag" :disabled="!example.editMode">
                        </td>
                        <td>
                            <input type="text" v-model="example.language" :disabled="!example.editMode">
                        </td>
                        <td>
                            <input type="text" v-model="example.source" :disabled="!example.editMode">
                        </td>
                        <td>
                            <input type="text" v-model="example.code" :disabled="!example.editMode">
                        </td>
                        <td>
                    <tr v-bind:class="{ pending: example.status === 'Pending' }">{{ example.status }}</tr>
                    </td>
                    <td>
                        <!-- This will bind to a class in styling to have a different color if there is a pending request to change to public -->
                        <button v-bind:class="{ pending: example.status === 'Pending' }"
                            v-on:click="toggleStatus(example.id)">{{ example.status }}</button>
                    </td>
                    <td>
                        <button v-if="!example.editMode" @click="toggleEditMode(example)">Edit</button>
                        <button v-else v-on:click="confirmChanges(example)">Save</button>
                    </td>
                    <!-- V-if for if pending to show a notification alert icon -->
                    <!-- Need a save button. Save single/save all? -->
                    </tr>
                </tbody>
            </table>
        </div>
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
            exampleStatus: '',
            filter: {
                title: "",
                tag: "",
                language: "",
                source: "",
                code: "",
                status: "",
            }
        }
    },
    methods: {
        confirmChanges(example) {
            exampleService.updateExample(example);
            example.editMode = false;
        },
        toggleStatus(exampleId) {
            const example = this.examples.find((example) => example.id === exampleId);
            console.log(example.id)
            if (example) {
                if (example.status.toLowerCase().includes('public')) {
                    example.status = 'private';
                } else {
                    example.status = 'public'
                }
                exampleService.updateExample(example)
                console.log(example)
            }
        },
        toggleEditMode(example) {
            example.editMode = !example.editMode;
        },
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
    },
    computed: {
        filteredList() {
            let filteredExamples = this.examples;
            if (this.filter.title != "") {
                filteredExamples = filteredExamples.filter((example) =>
                    example.title
                        .toLowerCase()
                        .includes(this.filter.title.toLowerCase())
                );
            }
            if (this.filter.tag != "") {
                filteredExamples = filteredExamples.filter((example) =>
                    example.tag
                        .toLowerCase()
                        .includes(this.filter.tag.toLowerCase())
                );
            }
            if (this.filter.language != "") {
                filteredExamples = filteredExamples.filter((example) =>
                    example.language
                        .toLowerCase()
                        .includes(this.filter.language.toLowerCase())
                );
            }
            if (this.filter.source != "") {
                filteredExamples = filteredExamples.filter((example) =>
                    example.source
                        .toLowerCase()
                        .includes(this.filter.source.toLowerCase())
                );
            }
            if (this.filter.status != "") {
                filteredExamples = filteredExamples.filter((example) =>
                    example.status === this.filter.status
                );
            }
            return filteredExamples;
        }
    }
}
</script>

<!-- <style scoped>
/* Whole page font changed */

* {
    font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Oxygen,
        Ubuntu, Cantarell, "Open Sans", "Helvetica Neue", sans-serif;
}
#code-header {
    padding-left: 5rem;
}
/* Wrapper on body of table to create a scroll bar */
.table-wrapper {
    max-height: 30rem;
    /* Set the maximum height for the scrollable container */
    overflow-y: auto;
    /* Enable vertical scrollbar when content exceeds the height */
}
.container {
    border-bottom: 1px solid #ccc;

}

.title {
    text-align: center;
}

/* Example counter text p element */
p {
    margin-top: 40px;
    font-size: 1.5rem;
}

/* Input boxes for editing */
input {
    width: 100%;
    box-sizing: border-box;
}


/* Bound classes that change color if there is a pending request for public from user */
button.pending {
    color: red;
}

tr.pending {
    color: red;
}

/* Table header display text for each column */
th {
    text-transform: uppercase;
    height: 40px;
    font-size: 1rem;
    margin:0;
}
/* All td styling */
td {
    padding: 10px;
    text-align: center;
    font-size: 14px;
    margin:0;
}
/* Table header styling */
.table-header  {
    text-align: center;
    padding-top: 5px;
    background-color: #255f5f;
    border-collapse: collapse;
    width: 100%;
    border-top-left-radius: .5rem;
    border-top-right-radius: .5rem;
}

.table-header .filters input[type="text"],
.table-header .filters select {
    width: 100%;
    box-sizing: border-box;
    /* Include padding and border in the width */
}
/* Table body styling */
.table-body {
    width: 100%;
    border-collapse: collapse;
}
.table-body th,
.table-body td {
    /* Adding a border to all table cells */
    padding: 1rem;

}

.table-body tr:nth-child(even) {
    background-color: #c0c2c2

}

/* Status filter dropdown size*/
#statusFilter {
    width: 5.3rem;
}

</style> -->
<style scoped>
* {
    font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Oxygen,
        Ubuntu, Cantarell, "Open Sans", "Helvetica Neue", sans-serif;
}
tbody thead {
    display:block;
}
tbody {
    max-height: 30rem;
    /* Set the maximum height for the scrollable container */
    overflow-y: auto;
    /* Enable vertical scrollbar when content exceeds the height */

}
.title {
    text-align: center;
}
/* Example counter text p element */
p {
    margin-top: 40px;
    font-size: 1.5rem;
}
/* Input boxes for editing */
input {
    width: 100%;
    box-sizing: border-box;
}
/* Bound classes that change color if there is a pending request for public from user */
button.pending {
    color: red;
}
tr.pending {
    color: red;
}
/* Table header display text for each column */
th {
    text-transform: uppercase;
    height: 50px;
}
td {
    padding: 10px;
    text-align: center;
}
.admin-table {
    border-collapse: collapse;
    width: 100%;
}
.admin-table th,
.admin-table td {
    /* Adding a border to all table cells */
    padding: 20px;
}
thead {
    text-align: center;
    padding-top: 5px;
    background-color: darkgray;
    /* border-bottom: 2px solid #000; */
    /* Solid border underneath the table header */
}
.admin-table .filters input[type="text"],
.admin-table .filters select {
    width: 100%;
    box-sizing: border-box;
    /* Include padding and border in the width */
}
.admin-table tbody .filters {
    border-bottom: 2px solid #000;
    /* Solid border below the filter row */
}
.admin-table tbody tr:nth-child(even) {
    background-color: #F9F9F9;
}
/* Status filter dropdown size*/
#statusFilter {
    width:5.3rem;
}
</style>