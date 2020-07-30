<template>
<tr>
  <td>{{ user.followee }}</td>
  <td>
    <button v-if="shouldDisplayButton" @click="requestAccess">Request Access</button>
  </td>
</tr>
</template>

<script>
import Backend from '@/Backend'

export default {
  name: 'FollowRequestListItem',
  props: ['user'],
  methods: {
    requestAccess: async function() {
      await Backend.requestAccess(this.user.followee)
      this.$emit('update')
    }
  },
  computed: {
    shouldDisplayButton: function() {
      console.log("shouldDisplayButton called this.user.access_granted: ", this.user.access_granted)
      return !this.user.access_granted
    }
  }
  
}
</script>
