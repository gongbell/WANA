import Vue from 'vue'
import Router from 'vue-router'
import Home from './views/Home.vue'
import Compose from './views/Compose.vue'
import Users from './views/Users.vue'

Vue.use(Router)

export default new Router({
  mode: 'history',
  base: process.env.BASE_URL,
  routes: [
    {
      path: '/',
      name: 'home',
      component: Home,
    },
    {
      path: '/compose',
      name: 'compose',
      component: Compose,
    },
    {
      path: '/users',
      name: 'users',
      component: Users,
    }
  ]
})
