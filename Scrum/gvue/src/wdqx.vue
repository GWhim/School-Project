<template>
    <div id="wdqx">
        <router-view></router-view>
        <el-row class="">
            <div style="color:#fff"></div>我的缺陷页面
        </el-row>
     </div>
</template>
<script>
import axios from 'axios'
import"./assets/css/wdqx.css"
export default {
  name:'wdqx',
  data(){
      return{
          userId:'',
      }
  },
 methods:{
      
  },
 mounted () {
   },
 created(){
     
   }
}
</script>
<style scoped>

</style>
