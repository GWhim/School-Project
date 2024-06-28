<template>
    <div id="Login">
      <router-view></router-view>
      <div class="background">
         <img :src="imgSrc" width="100%" height="100%" alt="" />
      </div>
           <div class="login-container">
       <el-form ref="form" :model="form" :rules="rules"  class="login-form">
          <h3 class="title">登录平台</h3>
      <el-form-item  prop="account" >
        <el-input  class="myClass" prefix-icon="el-icon-user"type="text" auto-complete="off" v-model="form.account"placeholder="用户名"></el-input>
      </el-form-item>
      <el-form-item >
        <el-input class="myClass"prefix-icon="el-icon-my-lock" type="password"   auto-complete="off" placeholder="密码"v-model="form.password"></el-input>
      </el-form-item>
      <el-form-item>
        <el-button type="primary" round @click="onSubmit":loading="logining">登录</el-button>
       <el-button type="primary" round @click="register">注册</el-button>
      </el-form-item>
    </el-form>
     </div>

  <el-dialog width ="30%"title="填写注册信息" :visible.sync="dialogFormVisible">
  <el-form ref="registerform":model="registerform">
    <el-form-item label="真实姓名：" label-width="100px">
      <el-input v-model="registerform.name" autocomplete="off"></el-input>
    </el-form-item>
    <el-form-item label="账号：" label-width="100px">
      <el-input v-model="registerform.account" autocomplete="off"></el-input>
    </el-form-item>
    <el-form-item label="密码：" label-width="100px">
      <el-input v-model="registerform.pwd" autocomplete="off"></el-input>
    </el-form-item>
     <el-form-item label="密码确认：" label-width="100px">
      <el-input v-model="registerform.pwd2" autocomplete="off"></el-input>
    </el-form-item>
    <el-form-item label="员工职位：" label-width="100px">
      <el-select v-model="registervaluetype"placeholder="请选择类型" >
        <el-option v-for="item in registeroptions" :key="item.value" :label="item.label" :value="item.value">
    </el-option>
      </el-select>
    </el-form-item>
  </el-form>
  <div slot="footer" class="dialog-footer">
    <el-button @click="dialogFormVisible = false">取 消</el-button>
    <el-button type="primary" @click="registerformSubmit":loading="registerlogining">确 定</el-button>
  </div>
</el-dialog>
     </div>
</template>

<script>
import axios from 'axios'
import"./assets/css/Login.css"
import { isSymbol, isNumber, isChinese } from "./assets/js/validate";
export default {
  name:'Login',
  data(){
      return{
        registeroptions: [{value: '1',label: '项目经理'},{value: '2',label: '需求'},{value: '3',label: '开发'},{value: '4',label: '测试'}],
        registervaluetype: '3',
        registerlogining:false,
        logining: false,
        imgSrc:require('./assets/img/background.jpg'),
        form: {account: "",password: ""},
        dialogFormVisible:false,
        rules: {account: [{ required: true, message: '请输入账号', trigger: 'blur' },  
        { validator: isNumber, trigger: "blur" } , { name: isNumber, trigger: "blur" }],
        checkPass: [{ required: true, message: '请输入密码', trigger: 'blur' },  { validator: isNumber, trigger: "blur" } ]},
        a:'10',
        registerform:{}
      }
  },
  methods:{
    registerformSubmit(){
      let _this=this;
      _this.registerlogining=true;
      _this.$refs.registerform.validate((valid) => {
      setTimeout(function() {
         _this.registerlogining=false;
         _this.dialogFormVisible = false
      }, 800);
      _this.form.account=_this.registerform.account
     
      })
    },
    onSubmit(){
        var _this=this;
       this.$refs.form.validate((valid) => {
     if (valid) {
        this.logining = true;
        window.sessionStorage.clear();
        localStorage.clear();
        console.log( _this.form.account+"  "+_this.form.password)
       this.$axios.post("/user/login",{account:_this.form.account,pwd:_this.form.password}).then(resp => {
          if (resp ) {
              console.log(resp)
              if(resp.data.code!=200){
                  this.$message({"message":resp.data.msg,center: true,showClose:true,type:'error',duration:800});
                   this.logining = false;
              }else{
                 this.$message({"message":resp.data.msg,center: true,showClose:true,type:'success',duration:2000});
                   this.logining = false;
                   localStorage.setItem('userId',resp.data.data.id)
                   localStorage.setItem('userName',resp.data.data.name)
                   localStorage.setItem('identity',resp.data.data.identity)
                   this.$router.push({name: 'kb',params:{user:resp.data.data}}) // 跳转b页面，参数链接不可见
                 }
               }
            })
         }
       })
    },
    register(){
      this.dialogFormVisible = true
    },
    dogo(){
        var _this=this;
      
    },
    dopost(){
        let _this = this;
        // _this.companyNameNow =value;
        let map = _this.remap;
       this.$axios.get("/user/getUserList").then(resp => {
          if (resp ) {
              console.log(resp)
          }
        })
    }
  },
   mounted () {
      
       
   }
}
</script>
<style>

</style>


