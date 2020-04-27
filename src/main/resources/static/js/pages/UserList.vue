<template>
    <v-container>
        <v-layout row>
            <v-list>
                <v-list-item v-for="user in users">
                <user-link
                        :user="user"
                        size="48"
                ></user-link>
                </v-list-item>
            </v-list>
        </v-layout>
    </v-container>
</template>

<script>
    import UserLink from '../components/UserLink.vue'
    import usersApi from 'api/users'
    export default {
        name: 'users',
        components: {UserLink},
        data() {
            return {
                users: null
            }
        },
        methods: {
            async loadAllUsers() {
                const response = await usersApi.findAll();
                this.users = response.body
                // this.users = JSON.stringify(response.body)
            }
        },
        mounted() {
            this.loadAllUsers()
            // console.log(this.users)
        },
        watch: {
            users() {
                console.log(this.users)
            }
        },
    }
</script>

<style scoped>

</style>