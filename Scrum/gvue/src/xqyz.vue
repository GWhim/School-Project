<template>
    <div id="xmgl">
        <router-view></router-view>
        <el-row class="">
            <div style="color:#fff">需求验证页面</div>
        </el-row>
     </div>
</template>
<script>
import axios from 'axios'
import"./assets/css/xmgl.css"
export default {
  name:'xmgl',
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
