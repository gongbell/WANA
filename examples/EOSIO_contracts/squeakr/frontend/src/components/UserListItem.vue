<template>
<tr>
  <td>{{ user.user }}</td>
  <td>
    <span v-if="isMyself">That's you!</span>
    <span v-else-if="user.already_follows">Already following</span>
    <span v-else-if="user.already_requested">Already requested</span>
    <button v-else @click="follow">Follow</button>
  </td>
</tr>
</template>

<script>
import Backend from '@/Backend'

export default {
  name: 'UserListItem',
  props: ['user'],
  methods: {
    follow: async function() {
      await Backend.followRequest(this.user.user)
      this.$emit('update')
    }
  },
  computed: {
    isMyself: function() {
      return Backend.account.name == this.user.user
    }
  }
}
</script>
