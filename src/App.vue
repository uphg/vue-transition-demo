<!-- 列表过渡案例 -->
<template>
  <div id="app">
    <button @click="shuffle">Shuffle</button>
    <button @click="add">Add</button>
    <button @click="remove">Remove</button>
    <transition-group name="list-complete" tag="div">
      <div v-for="item in items" :key="item" class="list-complete-item">
        {{ item }}
      </div>
    </transition-group>
  </div>
</template>

<script>
export default {
  data() {
    return {
      items: [1,2,3,4,5,6,7,8,9],
      nextNum: 10
    }
  },
  methods: {
    randomIndex() {
      return Math.floor(Math.random() * this.items.length)
    },
    add() {
      this.items.splice(this.randomIndex(), 0, this.nextNum++)
    },
    remove() {
      this.items.splice(this.randomIndex(), 1)
    },
    shuffle() {
      this.items = _.shuffle(this.items)
    }
  }
};
</script>

<style>
#app {
  padding-top: 80px;
  padding-left: 220px;
}
.list-complete-item {
  width: 200px;
  margin-top: 10px;
  padding: 10px;
  background-color: #d3dce6;
  transition: all 1s;
  /* display: inline-block; */
  margin-right: 10px;
}
.list-complete-enter {
  opacity: 0;
  transform: translateX(-100%);
}
.list-complete-leave-to
/* .list-complete-leave-active for below version 2.1.8 */ {
  opacity: 0;
  transform: translateX(100%);
}
.list-complete-leave-active {
  position: absolute;
}
</style>