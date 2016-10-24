<template lang='pug'>
  div
    p {{commits.length}} contributions
</template>

<script>
  export default {
    name: 'contributions',
    data() {
      return { commits: [] };
    },
    created() {
      api.commits('sh19910711').then(res => {
        this.commits = res.commits;
      });
    }
  }
</script>
