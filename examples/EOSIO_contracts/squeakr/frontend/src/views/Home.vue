<template>
  <div class="home">
    <button v-on:click="squeakButton()">Squeak</button>
    <table>
      <TimelineItem v-for="squeak in squeaks" :squeak="squeak" :key="squeak.id" />
    </table>
  </div>
</template>

<script>
// @ is an alias to /src
import TimelineItem from '@/components/TimelineItem.vue'
import Backend from '@/Backend'

export default {
  name: 'home',
  components: {
    TimelineItem,
  },
  data: function() {
    return {
      squeaks: null
    }
  },
  async mounted () {
    await Backend.scatterConnect()
    this.squeaks = await Backend.squeaks()
  },
  methods: {
    squeakButton() {
      this.$router.push('compose')
    }
  }
}
</script>
