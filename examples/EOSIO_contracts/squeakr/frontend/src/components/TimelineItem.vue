<template>
<tr>
  <td>{{ squeak.user }}</td>
  <td>{{ squeak.secret }}</td>
</tr>          
</template>

<script>
export default {
  name: 'TimelineItem',
  props: ['squeak'],
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>

</style>
