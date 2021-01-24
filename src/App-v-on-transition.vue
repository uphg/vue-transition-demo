<!-- transition 钩子函数使用案例 -->
<template>
  <div id="app">
    <button @click="show = !show">Toggle render</button>
    <transition
      @before-enter="beforeEnter"
      @enter="enter"
      @after-enter="afterEnter"
      @enter-cancelled="enterCancelled"
      @before-leave="beforeLeave"
      @leave="leave"
      @after-leave="afterLeave"
      @leave-cancelled="leaveCancelled"
    >
      <p v-if="show">hello</p>
    </transition>
  </div>
</template>

<script>
export default {
  name: "App",
  data() {
    return {
      show: true,
      timerId: null
    };
  },
  methods: {
    beforeEnter: function (el) {
      // ...
    },
    // 当与 CSS 结合使用时
    // 回调函数 done 是可选的
    enter: function (el, done) {
      // ...
      done();
    },
    afterEnter: function (el) {
      // ...
    },
    enterCancelled: function (el) {
      // ...
    },

    // --------
    // 离开时
    // --------

    beforeLeave: function (el) {
      el.classList.add('demo-leave-active')
      el.classList.add('demo-leave')
    },
    // 当与 CSS 结合使用时
    // 回调函数 done 是可选的
    leave: function (el, done) {
      // ...
      el.classList.remove('demo-leave')
      el.classList.add('demo-leave-to')
      this.timerId = setTimeout(() => {
        done();
      }, 300);
    },
    afterLeave: function (el) {
      // ...
      // el.style.transform = 'translateX(10px)'
      // el.style.opacity = 0
      el.classList.remove('demo-leave-active')
      el.classList.remove('demo-leave-to')
      window.clearTimeout(this.timerId)
    },
    // leaveCancelled 只用于 v-show 中
    leaveCancelled: function (el) {
      // ...
      el.style.transform = 'translateX(10px)'
      el.style.opacity = 0
    },
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
