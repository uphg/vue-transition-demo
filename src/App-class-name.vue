<!-- v-leave 类名bug案例 -->
<template>
  <div id="app">
    <button @click="show = !show">Toggle render</button>
    <transition
      :duration="10000"
      enter-class="demo-enter"
      enter-active-class="demo-enter-active"
      enter-to-class="demo-enter-to"
      leave-class="demo-leave"
      leave-active-class="demo-leave-active"
      leave-to-class="demo-leave-to"
    >
      <p v-show="show">hello</p>
    </transition>
  </div>
</template>

<script>
export default {
  name: "App",
  data() {
    return {
      show: true,
    };
  },
};
</script>

<style lang="scss">
/* 开始前 */
.demo-enter {
  transform: translateX(-10px);
  opacity: 0;
}
.demo-enter-active {
  transition: all 0.3s ease;
}
.demo-enter-to {
  background-color: red;
}
.demo-leave {
  color: red;
  background-color: green;
}
.demo-leave-active {
  transition: all 10s ease;
}
/* 结束后 */
.demo-leave-to {
  transform: translateX(10px);
  opacity: 0;
}
</style>
