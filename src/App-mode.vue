<!-- 多组件过渡，使用案例 -->
<template>
  <div id="app example-5">
    <transition name="fade">
      <button
        v-if="status === 'off'"
        key="off"
        @click="status = 'on'"
      >off</button>
      <button
        v-else-if="status === 'on'"
        key="on"
        @click="status = 'off'"
      >on</button>
    </transition>
  </div>  
</template>

<script>
export default {
  data() {
    return {
      status: 'off'
    }
  }
}
</script>

<style>
#example-5 {
  position: relative;
}
button {
  position: absolute;
}

.fade-enter-active, .fade-leave-active {
  transition: all 1s;
}
.fade-enter {
  transform: translateX(100%);
  opacity: 0;
}
.fade-leave-to /* .fade-leave-active below version 2.1.8 */ {
  transform: translateX(-100%);
  opacity: 0;
}
</style>