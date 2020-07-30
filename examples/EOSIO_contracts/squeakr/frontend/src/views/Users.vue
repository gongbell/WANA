<template>
<div>
  <div id="user_list_container">
    <h3>All Users</h3>
    <table>
      <UserListItem v-for="user in users" :user="user" v-on:update="update" :key="user.user" />
    </table>
  </div>
  <div v-if="followRequests && followRequests.length" id="follow_requests_container">
    <h3>Follow Requests</h3>
    <table>
      <FollowRequestListItem v-for="request in followRequests" :request="request" v-on:update="update" :key="request.follower"/>
    </table>
  </div>
  <div v-if="following && following.length" id="following_list_container">
    <h3>Users you are following</h3>
    <table>
      <FollowingListItem v-for="user in following" :user="user" v-on:update="update" :key="user.followee" />
    </table>
  </div>
</div>
</template>

<script>
import Backend from '@/Backend'
import UserListItem from '@/components/UserListItem.vue'
import FollowRequestListItem from '@/components/FollowRequestListItem.vue'
import FollowingListItem from '@/components/FollowingListItem.vue'

async function reload(x) {
  if(!Backend.account) return
  
  x.users = await Backend.users()
  x.following = await Backend.following()
  x.followRequests = await Backend.followRequests()
  console.log("this.users: ", x.users)
  console.log("x.followRequests: ", x.followRequests)
}

export default {
  name: 'Users',
  components: {
    UserListItem,
    FollowRequestListItem,
    FollowingListItem,
  },
  data() {
    return {
      users: null,
      followRequests: null,
      following: null,
    }
  },
  async beforeMount() {
    await reload(this)
  },
  methods: {
    update: function() {
      reload(this)
    }
  }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>

</style>
