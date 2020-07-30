<template>
<tr>
  <td>{{ request.follower }}</td>
  <td>
    <button @click="accept">Accept</button>
  </td>
</tr>
</template>

<script>
import Backend from '@/Backend'

export default {
  name: 'FollowRequestListItem',
  props: ['request'],
  methods: {
    accept: async function() {
      await Backend.accept(this.request.follower)
      this.$emit('update')
    }
  },
  
}
</script>
