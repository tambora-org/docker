<template>
  <h1>Hello {{ name }} from CRE!</h1>
</template>

<script>
export default {
  props: {
    name: {
      type: String,
      required: true
    }
  }
}
</script>

<style lang="css" scoped>
h1 {
  color: red;
}
</style>

<style lang="stylus" scoped>
h1
  color green
</style>
