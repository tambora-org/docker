<template>  
  <div class='elemSecond'>{{msg}}-{{counter}}<button v-on:click="addOne">Add</button>*{{c4uUid}} p:{{c4uParentId}}
  <slot></slot>
  </div>
</template>

<style scoped>
  .elemSecond {
    background: green;
  }
</style>

<script>
//  import C4uGlue from "./C4uGlue2.js";
  import C4uGlue from "c4u-glue";
 
  export default {
    props: ['msg'],
    data: function() {
           return {
            c4uParentTag: "my-first",
            counter: 0,
            }
        },
    mixins: [C4uGlue], 
    methods: { 
       // eslint-disable-next-line
       addOne: function(ignoreEvent) {
          this.counter += 1;
          if (this.c4uParent) {
            this.c4uParent.counter += 100;
          }
       },
    },
//    created() {
//         console.log("***** Slot-2nd-created " + this.msg + " #" + this.c4uUid);
//    },
//    mounted() {
//         console.log("***** Slot-2nd-mounted " + this.msg + " #" + this.c4uUid);
//    },
//    updated() {
//         console.log("***** Slot-2nd-updated " + this.msg + " #" + this.c4uUid);
//    },
//    beforeDestroy() {
//         console.log("***** Slot-2nd-destroyed " + this.msg + " #" + this.c4uUid);
//    },

  }
</script>
