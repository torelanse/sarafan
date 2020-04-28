import Vue from 'vue'

const comments = Vue.resource('/comment{/id}')    // $resource

export default {
    add: comment => comments.save({}, comment),
}