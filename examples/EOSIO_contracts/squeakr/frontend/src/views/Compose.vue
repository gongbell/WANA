<template>
<div id="compose_container">
  <form v-on:submit.prevent="onSubmit">
    <textarea v-model="text" rows="5" cols="50" placeholder="What's going on?" /> <br />
    <button type="submit">Submit</button>
  </form>
</div>
</template>

<script>
import Backend from '@/Backend'

export default {
  name: 'Compose',
  data() {
    return {
      text: ""
    }
  },
  methods: {
    onSubmit: async function() {
      console.log('submit ', this.text)
      await Backend.post(this.text)
      this.$router.push('/')
    }
  },
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>

</style>
