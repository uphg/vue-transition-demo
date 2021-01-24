<!-- Velocity.js 使用案例 -->
<template>
  <div id="app">
    <button @click="show = !show">Toggle</button>
    <transition
      appear
      @enter="enter"
      @leave="leave"
      :css="false"
    >
      <p v-if="show" class="demo4">
        多、少、清静、喧哗，往、去、筑起、坍塌；云端之上，奈何桥下，心乱如麻；若人间是场大梦啊，梦里啷当巨铁锁人家，夜归的人叩响了门环，我要不要叫醒他；
      </p>
    </transition>
  </div>
</template>

<script>
import Velocity from "velocity-animate"
export default {
  name: "App",
  data() {
    return {
      show: true
    }
  },
  methods: {
    enter(el, done) {
      Velocity(el, { height: '150px', width: '300px' }, { duration: 300 })
      Velocity(el, { height: '300px;' }, { duration: 300 }, { complete: done })
    },
    leave(el, done) {
      Velocity(el, { height: '150px' }, { duration: 300 })
      Velocity(el, { width: '0px' }, { duration: 300 }, { complete: done })
    }
  }
}
</script>

<style lang="scss">
.demo4 {
  width: 0;
  height: 0;
  overflow: hidden;
  background-color: #eee;
}
</style>
