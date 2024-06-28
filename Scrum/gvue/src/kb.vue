<template>
    <div id="kb">
        <router-view></router-view>
       
        <el-row class="kb-top">
            <el-col :span="4"class="kb-top-left">
                 <el-row >
                      <div class="helloUser hulue"> {{nowTime}},  {{user.name}}</div>
                     </el-row>
                    <el-row ><div class="xiugaimima" @click="dialogFormVisible = true">修改密码</div></el-row>
            </el-col>
              <el-col :span="1"class="kb-top-left2"></el-col>
            <el-col :span="18"class="kb-top-right">
                <div class="helloUser"> <div style="color:#9D9D9D;display: inline;">{{date}}</div>&#12288;今日剩余工作总计</div>
                    <el-row class="shengyu">
                      <el-col class="shengyu-item" :span="3">我的任务<div class="shengyu-num">{{num.workNum}}</div></el-col>
                      <el-col class="shengyu-item" :span="3">今日已完成任务<div class="shengyu-num">{{num.doneWorkNum}}</div></el-col>
                      <el-col  class="shengyu-item":span="3">我的BUG<div class="shengyu-num">{{num.bugNum}}</div></el-col>
                      <el-col  class="shengyu-item":span="3">今日已完成BUG<div class="shengyu-num">{{num.doneBugNum}}</div></el-col>
                      <el-col  class="shengyu-item":span="3">进行中的项目<div class="shengyu-num">{{num.VersionNum}}</div></el-col>
                    </el-row>
            </el-col>
        </el-row>
        <el-row class="kb-center">
            <el-col :span="23"class="kb-center-left">
                <el-row>
                    <el-col :span="6">
                        <div class="dt-right-center"></div>
                          <div class="dt-top"></div>
                            <div class="dt-center"></div>
                             <div class="dt-bottom"></div>
                    <div class="dt-item" @click="dtClick(1)">所有</div>
                    <div class="dt-item"@click="dtClick(2)">今天</div>
                    <div class="dt-item"@click="dtClick(3)">本周</div>
                     
                    </el-col>
                     <el-col :span="15"> 
                      <el-table :data="dtData":show-header="false" height="200" class="dt-table">
                        <el-table-column label="日期" width="220"  >
                          <template slot-scope="scope">
                            <i class="el-icon-time"></i>
                            <span style="margin-left: 10px">{{ scope.row.createtime }}</span>
                          </template>
                        </el-table-column>
                        <el-table-column label="姓名" width="730" show-overflow-tooltip>
                          <template slot-scope="scope">
                                <el-tag size="medium">{{ scope.row.username }} </el-tag> 
                                {{scope.row.des}}
                          </template>
                        </el-table-column>
                    </el-table>
                  </el-col>
                </el-row>
            </el-col>
        </el-row>
         <el-row class="kb-bottom">
            <el-col :span="23"class="kb-bottom-left">
              <div class="kb-bottom-title">我参与的项目</div>
              <el-row>
               <el-table :data="workData" height="300" class="xm-table":header-cell-style="{'border-bottom': '1px solid #2197F1'}">
                  <el-table-column  prop="projectname" label="项目名称"  width="300"  sortable> </el-table-column>
                   <el-table-column  prop="versionname" label="最新迭代"  width="300" sortable > </el-table-column>
                    <el-table-column  prop="worknum" label="进行中任务数"  width="175" align="center" sortable > </el-table-column>
                     <el-table-column  prop="doneworknum" label="完成任务数"  width="175"  align="center" sortable> </el-table-column>
                     <el-table-column  prop="bugnum" label="存在bug数"  width="175"  align="center" sortable> </el-table-column>
                     <el-table-column  prop="donebugnum" label="完成bug数"  width="175"  align="center" sortable> </el-table-column>
              </el-table>
            </el-row>
            </el-col>
        </el-row>

        <el-dialog :visible.sync="dialogFormVisible" customClass="toexit"   width="30%"center>
            <template slot="title">
              <div style="text-align: center; color: #fff; font-size: 20px;">修改密码</div>    
            </template>
          <el-form :model="form"  :rules="rules" ref="mmForm" >
            <el-form-item label="原密码" label-width="150px" prop="oldPwd">
              <el-input v-model="form.oldPwd" class="xgmm-item" width="100px" show-password>
              </el-input>
            </el-form-item>
            <el-form-item label="密码" label-width="150px" prop="pwd">
                <el-input v-model="form.pwd"   class="xgmm-item" show-password></el-input>
            </el-form-item>
            <el-form-item label="确认密码" label-width="150px" prop="newPwd">
                <el-input v-model="form.newPwd" class="xgmm-item" show-password></el-input>
            </el-form-item>
          </el-form>
          <div slot="footer" class="dialog-footer">
            <el-button @click="dialogFormVisible = false">取 消</el-button>
            <el-button type="primary" @click="submitForm('mmForm')">确 定</el-button>
          </div>
        </el-dialog>
     </div>
</template>
<script type="text/javascript" src="/assets/js/jquery-3.6.0.js"></script>
<script>
import axios from 'axios'
import"./assets/css/kb.css"
export default {
  name:'kb',
  data(){
    var validateOldPass = (rule, value, callback) => {
        if (value === '') {
          callback(new Error('请输入原密码'));
        } else {
          if (this.form.newPwd !== '') {
            this.$refs.mmForm.validateField('checkPass');
          }
          callback();
        }
    };
     var validatePass = (rule, value, callback) => {
        if (value === '') {
          callback(new Error('请输入密码'));
        } else {
          if (this.form.newPwd !== '') {
            this.$refs.mmForm.validateField('checkPass');
          }
          callback();
        }
    };
      var validatePass2 = (rule, value, callback) => {
        if (value === '') {
          callback(new Error('请再次输入密码'));
        } else if (value !== this.form.pwd) {
          callback(new Error('两次输入密码不一致!'));
        } else {
          callback();
        }
    }
      return{
          num:{bugNum:0,doneBugNum:0,workNum:0,doneWorkNum:0,VersionNum:0 },
          form: {oldPwd: '',pwd: '',newPwd: '',},
          rules: {
          oldPwd: [ { required: true, validator: validateOldPass, trigger: 'blur' } ],
          pwd: [ { required: true, validator: validatePass,trigger: 'blur' }, ],
          newPwd: [ { required: true, validator: validatePass2, trigger: 'blur' } ], 
          },
          workData: [
          { projectName:'BBBB', versionName:'GGG1.0', workingNum:5, workedNum:5, bugNum:5 },
          { projectName:'GGG', versionName:'GGG1.0', workingNum:4, workedNum:4, bugNum:4 }
          ],
          dialogFormVisible: false,
          value1:'',
          user: {},
          nowTime:'你好',
          date:'',
          dtData: [
            ],
      }
  },
 methods:{
    dtClick(a){
         if(a==1){
           $(".dt-center,.dt-bottom").css("border-color","transparent");
            this.dtTableInit(3);$(".dt-top").css("border-color","#DCC079")
         }
         else if(a==2){$(".dt-top,.dt-bottom").css("border-color","transparent")
         {
            this.dtTableInit(1);$(".dt-center").css("border-color","#DCC079")} 
            } 
          else if(a==3){$(".dt-top,.dt-center").css("border-color","transparent")
          { 
            this.dtTableInit(2);$(".dt-bottom").css("border-color","#DCC079")}
            }
     },
    getNowTime(){
        var _this=this;
        var now = new Date();
        var year = now.getFullYear();
        var month = now.getMonth() + 1 < 10 ? "0" + (now.getMonth() + 1): now.getMonth() + 1;
        var day = now.getDate() < 10 ? "0" + now.getDate() : now.getDate();
        this.date=year + "年" + month + "月" + day+"日";
        var hour = now.getHours();
        if (hour < 12){return "上午好 ！"} 
        else if (hour < 14){return "中午好 ！"} 
        else if (hour < 17){return "下午好 ！"} 
        else {return "晚上好 ！"}
    },
    getUser(){
         if(this.$route.params.user){ this.user=this.$route.params.user;}else{
            this.user={id:localStorage.getItem('userId'),name:localStorage.getItem('userName'),identity:localStorage.getItem('identity')}
             console.log(this.user)
         }
    },
    kbDataInit(){
      var _this=this;
         this.$axios.post("/user/kbInit",{userId:_this.user.id}).then(resp => {
            if (resp ) {
              console.log(resp)
              if(resp.data.code!=200){
                  this.$message({"message":resp.data.msg,center: true,showClose:true,type:'error',duration:800});
              }else{
                 _this.num=resp.data.data.num;
                _this.workData=resp.data.data.projectMap;
                 //this.$message({"message":resp.data.msg,center: true,showClose:true,type:'success',duration:2000});
                   //this.$router.push({name: 'Login'}) // 跳转b页面，参数链接不可见
                 }
               }
            })
    },
     dtTableInit(type){
      var _this=this;
         this.$axios.post("/user/dtTableInit",{userId:_this.user.id,type:type}).then(resp => {
            if (resp ) {
              console.log(resp)
              if(resp.data.code!=200){
                  this.$message({"message":resp.data.msg,center: true,showClose:true,type:'error',duration:800});
              }else{
                 _this.dtData=resp.data.data;
                 //this.$message({"message":resp.data.msg,center: true,showClose:true,type:'success',duration:2000});
                   //this.$router.push({name: 'Login'}) // 跳转b页面，参数链接不可见
                 }
               }
            })
    },
    submitForm(mmForm) {
      var _this=this;
        this.$refs[mmForm].validate((valid) => {
          if (valid) {
           this.$axios.post("/user/updatePwd",{userId:_this.user.id,oldPwd:_this.form.oldPwd,pwd:_this.form.pwd}).then(resp => {
            if (resp ) {
              console.log(resp)
              if(resp.data.code!=200){
                  this.$message({"message":resp.data.msg,center: true,showClose:true,type:'error',duration:800});
              }else{
                 this.$message({"message":resp.data.msg,center: true,showClose:true,type:'success',duration:2000});
                   this.$router.push({name: 'Login'}) // 跳转b页面，参数链接不可见
                 }
               }
            })
           
          } else {
            console.log('error submit!!');
            return false;
          }
        });
    },
  },
 mounted () {
       
   },
 created(){
   this.nowTime=this.getNowTime();
    this.getUser();
    this.kbDataInit();
    this.dtTableInit(1);
   }
}
</script>
<style scoped>

</style>
