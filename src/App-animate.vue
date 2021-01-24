<!-- Animated.css 使用案例 -->
<template>
  <div id="app">
    <button @click="show = !show">
      Toggle render
    </button>
    <transition
      name="custom-classes-transition"
      enter-active-class="animated bounceInLeft"
      leave-active-class="animated bounceOutRight"
    >
      <p v-if="show">hello</p>
    </transition>
  </div>
</template>

<script>
// import 'animate.css/animate.min.css';
// import 'animate.css/animate.compat.css';
export default {
  data() {
    return {
      show: true
    }
  }
}
</script>

<style>

</style>