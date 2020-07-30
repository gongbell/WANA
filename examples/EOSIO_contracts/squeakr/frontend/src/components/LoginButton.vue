<template>
  <button @click="loginout">{{ caption }}</button>
</template>

<script>
import Backend from '@/Backend'

export default {
  name: 'UserListItem',
  props: ['user'],
  data() {
    return {
      backend: Backend,
    }
  },
  methods: {
    loginout: async function() {
      if(this.loggedIn) {
        await this.logout()
      } else {
        await this.login()
      }
      this.$emit('update')
    },
    login: async function() {
      console.log("Login!!!")
      await Backend.scatterConnect()
      console.log("scatterConnect is finished")
      console.log("this.loggedIn: ", this.loggedIn)
    },
    logout: async function() {
      console.log("Logout!!!")
      Backend.logout()
    },
  },
  computed: {
    caption: function() {
      return this.loggedIn? `Logout ${this.username}`: 'Login'
    },
    loggedIn: function() {
      return !!this.backend.account
    },
    username: function() {
      return this.backend.account.name
    }
  }
}
</script>
