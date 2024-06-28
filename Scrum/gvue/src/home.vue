<template>
    <div id="home">
       <el-col class="homeleft" :span="0.1"> </el-col>
        <el-row class="homeTop">
             <el-col class="homeTop-left" :span="6">
                 <div class="home-top-icon" style="margin-left: 10px;"></div>
                 <div class="home-title">缺陷测评系统</div>
             </el-col>
             <el-col class="homeTop-right" :span="2" @click.native="centerDialogVisible=true;">
                 <i class="el-icon-switch-button":style="{color:'#fff'}"></i>
                 <div class="home-title-right">退出</div>
             </el-col>
        </el-row>
      <el-row class="tac" style="height:100%">
        <el-col :span="3" class="home-menu"style="height:100%">
        <el-menu  :default-active='activeIndex' class="el-menu-vertical-demo"  @open="handleOpen" @close="handleClose"
        background-color="#053052" text-color="#fff" active-text-color="#ffd04b"style="height:100%" @select="handleSelect" router>
            <el-menu-item index="/kb">
            <i class="el-icon-s-order"></i>
            <span slot="title">看板</span>
            </el-menu-item>
            <el-submenu index="2"v-if="user.identity==1">
                <template slot="title">
                    <i class="icon-team"></i>
                    <span>团队</span>
                </template>
                <el-menu-item-group>
                    <el-menu-item index="/cygl" >项目成员管理</el-menu-item>
                </el-menu-item-group>
            </el-submenu>
            <el-submenu index="3">
                <template slot="title">
                    <i class="el-icon-document"></i>
                    <span>项目</span>
                </template>
                <el-menu-item-group>
                    <el-menu-item index="/xmgl" >项目/迭代管理</el-menu-item>
                    <el-menu-item index="/jd">进度/任务管理</el-menu-item>
                </el-menu-item-group>
            </el-submenu>
            <el-submenu index="4">
                <template slot="title">
                    <i class="el-icon-edit-outline"></i>
                    <span>需求</span>
                </template>
                <el-menu-item-group>
                    <el-menu-item index="xqwj">需求文件管理</el-menu-item>
                     <el-menu-item index="xqtm">需求条目管理</el-menu-item>
                     
                </el-menu-item-group>
            </el-submenu>
            <el-submenu index="5"v-if="user.identity!=2">
                <template slot="title">
                    <i class="el-icon-magic-stick"></i>
                    <span>缺陷</span>
                </template>
                <el-menu-item-group>
                    <el-menu-item index="fqqx">缺陷管理</el-menu-item>
                    <el-menu-item index="csyl">测试用例管理</el-menu-item>
                     <el-menu-item index="cstm">测试条目管理</el-menu-item>
                </el-menu-item-group>
            </el-submenu>
        </el-menu>
  </el-col>
  <el-col :span="21" class="home-main"style="height:100%">
       <router-view></router-view>
  </el-col>
</el-row>
<el-dialog
  :visible.sync="centerDialogVisible"
  width="30%"
  center customClass="toexit">
  <span style="text-align: center;
    color: #fff;
    font-size: 20px;">确定退出吗？</span>
  <span slot="footer" class="dialog-footer">
    <el-button @click="centerDialogVisible = false">取 消</el-button>
    <el-button type="primary" @click="exit()">确 定</el-button>
  </span>
</el-dialog>
     </div>
</template>
<script>
import axios from 'axios'
import"./assets/css/home.css"
export default {
  name:'home',
  data(){
      return{
          user:{},
          activeIndex: '/kb',
          centerDialogVisible:false,
      }
  },
 methods:{
     exit(){
             window.sessionStorage.clear();
              localStorage.clear();
             this.$router.push({name: 'Login'});
     },
      handleSelect(key, keyPath) {
          console.log(key, keyPath);
          //this.$router.push({name: 'kb',params:{userId:resp.data.data.id,account:_this.form.account,pwd:_this.form.password}}) // 跳转b页面，参数链接不可见
    },
     getUser(){
         if(this.$route.params.user){ this.user=this.$route.params.user;}else{
              this.user={id:localStorage.getItem('userId'),name:localStorage.getItem('userName'),identity:localStorage.getItem('identity')}
         }
         console.log(this.user);
     },
      handleOpen(key, keyPath) {
        //console.log(key, keyPath);
      },
      handleClose(key, keyPath) {
        //console.log(key, keyPath);
      }
  },
 mounted () {
      this.activeIndex = '/'+this.$route.name;
   },
 created(){
      this.getUser();
     
   }
}
</script>
<style scoped>

</style>
<style>
.toexit{
  background-color: #031838;
  top:200px;
}


.el-dialog--center .el-dialog__body{
    text-align: center;
}
</style>

