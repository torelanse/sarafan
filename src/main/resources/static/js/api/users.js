import Vue from 'vue'

export default {
    findAll: () => Vue.http.get('/users')

}
