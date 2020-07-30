<template>
  <div id="app">
    <div id="header">
      <h1>Squeakr</h1>
      <div id="nav">
        <router-link to="/">Home</router-link> | 
        <router-link to="/users">Users</router-link>
      </div>
      <LoginButton />
    </div>
    <router-view/>
  </div>
</template>

<script>
import Backend from '@/Backend'
import LoginButton from '@/components/LoginButton.vue'

export default {
  components: {
    LoginButton,
  },
  methods: {
    logout: async function() {
      await Backend.logout()
      this.$router.push('/')
    }
  }
}
</script>

<style>
#app {
  font-family: 'Avenir', Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
}
#nav {
  padding: 30px;
}

#nav a {
  font-weight: bold;
  color: #2c3e50;
}

#nav a.router-link-exact-active {
  color: #42b983;
}
</style>
