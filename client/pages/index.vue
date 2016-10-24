<template lang='pug'>
  div
    h1 index-page
    contributions
</template>

<script>
  export default {
    name: 'index',
    components: {
      contributions: require('components/contributions.vue')
    }
  };
</script>
