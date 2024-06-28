<template>
    <div id="cygl">
        <router-view></router-view>
        <el-row class="cygl-top">
           <el-col :span="23" class="top-bg">
               <el-row>
                   <el-col :span="8" class="select-item">
                    选择项目：
                    <el-select id="projectSelect" v-model="value" @change="projectChange" filterable clearable placeholder="请选择项目,可输入查找">
                        <el-option v-for="item in options" :key="item.value" :label="item.label" :value="item.value"> </el-option> 
                    </el-select>
                   </el-col>
                   <el-col :span="6"class="select-item">
                     <el-button @click="openDialog" style="width:80%">添加成员 > ></el-button>
                   </el-col>
                </el-row>
           </el-col>
        </el-row>
         <el-row class="cygl-center">
            <el-col :span="23" class="center-bg">
                项目成员展示
                 <el-table :data="cyglData" height="500" empty-text="请选择项目"class="cygl-table" :header-cell-style="{'border-bottom': '1px solid #2197F1'}">
                    <el-table-column  align="center" prop="id" label="id"  width="0" v-if="false" sortable> </el-table-column>
                    <el-table-column  align="center" prop="name" label="姓名"  width="175"  sortable> </el-table-column>
                    <el-table-column align="center"  prop="identity" label="职位"  width="150"  sortable> </el-table-column>
                     <el-table-column align="center"  prop="worknum" label="任务数"  width="150"  sortable> </el-table-column>
                     <el-table-column align="center"  prop="doneworknum" label="完成任务数"  width="150"  sortable> </el-table-column>
                     <el-table-column align="center"  prop="bugnum" label="BUG数"  width="150"  sortable> </el-table-column>
                     <el-table-column align="center"  prop="donebugnum" label="完成BUG数"  width="150"  sortable> </el-table-column>
                    <el-table-column align="center"  label="操作" width="400">
                        <template slot-scope="scope">
                            <el-button @click="deleteUser(scope.row.id,scope.row.name,value,scope.row)" type="text" size="small">移除</el-button>
                            <el-button @click="toUser(scope.row.id,scope.row.name,value,scope.row)" type="text" size="small">转接任务</el-button>
                        </template>
                     </el-table-column>
                </el-table>
            </el-col>
        </el-row>
         <el-dialog :visible.sync="dialogFormVisible" customClass="cyglAdd"   width="40%"center>
            <template slot="title">
              <div style="text-align: center; color: #fff; font-size: 20px;">向项目[ {{project}} ]添加新成员</div>    
            </template>
          <el-row style="height:500px">
              <el-col :span="10">
                  <el-table :data="allUser2" ref="allUserTable"height="450"  @current-change="allCurrentChange" highlight-current-row empty-text="暂无新员工"class="cygl-table" :header-cell-style="{'border-bottom': '1px solid #2197F1'}">
                    <el-table-column v-if="false" prop="id"  width="0"  > </el-table-column>
                    <el-table-column  align="center" prop="name" label="姓名"  width="150"  sortable> </el-table-column>
                    <el-table-column align="center"  prop="identity" label="职位"  width="100"  sortable> </el-table-column>
                </el-table>
              </el-col>
              <el-col :span="10">
                  <el-table :data="addUser2"  ref="addUserTable"height="450"  empty-text="请选择左侧新成员"class="cygl-table" :header-cell-style="{'border-bottom': '1px solid #2197F1'}">
                    <el-table-column v-if="false" prop="id"  width="0"  > </el-table-column>
                    <el-table-column align="center" prop="name" label="姓名"  width="150"  sortable> </el-table-column>
                    <el-table-column align="center"  prop="identity" label="职位"  width="100"  sortable> </el-table-column>
                </el-table>
              </el-col>
          </el-row>
          <div slot="footer" class="dialog-footer">
            <el-button @click="submitForm(0)">重置</el-button>
            <el-button type="primary" @click="submitForm(1)" :loading="logining">确 定</el-button>
          </div>
        </el-dialog>
        <el-dialog :visible.sync="UserdialogVisible" customClass="cyglAdd"   width="40%"center>
            <template slot="title">
              <div style="text-align: center; color: #fff; font-size: 20px;">选择转接人</div>    
            </template>
          <el-row style="height:100px">
               <el-select id="UserSelect"ref="userSelect" v-model="UserValue" @change="UserChange" filterable clearable placeholder="请选择转接人,可输入查找">
                        <el-option v-for="item in userOptions" :key="item.id" :label="item.name" :value="item.id"> </el-option> 
                    </el-select>
          </el-row>
        </el-dialog>
        <el-dialog :visible.sync="WorkdialogFormVisible" customClass="cyglAdd"   width="40%"center>
            <template slot="title">
              <div style="text-align: center; color: #fff; font-size: 20px;">转接任务给[ {{toUserName}} ]</div>    
            </template>
          <el-row style="height:500px">
              <el-col :span="20">
                  <el-table :data="doingWD" ref="workTable"height="450" @selection-change="handleSelectionChange" empty-text="暂无可转接任务"class="cygl-table" :header-cell-style="{'border-bottom': '1px solid #2197F1'}">
                    <el-table-column v-if="false" prop="id"  width="0"  > </el-table-column>
                    <el-table-column type="selection" width="55"> </el-table-column>
                    <el-table-column  align="center" type="index" label="序号"width="80"  > </el-table-column>
                    <el-table-column  align="center"  label="类型"width="80"  > 
                         <template slot-scope="scope">
                            <span v-if="scope.row.type==1">任务</span>
                            <span v-if="scope.row.type==2">BUG</span>
                         </template>
                    </el-table-column>
                    <el-table-column   prop="des" label="详情"  width="290"   show-overflow-tooltip> </el-table-column>
                </el-table>
              </el-col>
          </el-row>
          <div slot="footer" class="dialog-footer">
            <el-button type="primary" @click="submitZJ()">确 定</el-button>
          </div>
        </el-dialog>
     </div>
</template>
<script>
import axios from 'axios'
import"./assets/css/cygl.css"
export default {
  name:'cygl',
  data(){
      return{
          logining: false,
         user: {},
         options: [],
         userOptions:[],
        value: '',
        zjUserId:'',
        UserValue:'',
        toUserName:'',
        project:'',
        dialogFormVisible: false,
        WorkdialogFormVisible:false,
        UserdialogVisible:false,
        doingWD:[],
        cyglData:[],
        allUser:[],
        allUser2:[],
        addUser:[],
        addUser2:[],
        multipleSelection: []
      }
  },
 methods:{
       getUser(){
         if(this.$route.params.user){ this.user=this.$route.params.user;}else{
            this.user={id:localStorage.getItem('userId'),name:localStorage.getItem('userName'),identity:localStorage.getItem('identity')}
            console.log(this.user)
         }
    },
     cyglDataInit(){
      var _this=this;
         this.$axios.post("/user/cyglDataInit",{userId:_this.user.id}).then(resp => {
            if (resp ) {
              console.log(resp)
              if(resp.data.code!=200){
                  this.$message({"message":resp.data.msg,center: true,showClose:true,type:'error',duration:800});
              }else{
                   _this.options= [];
                  for(var a=0;a<resp.data.data.length;a++){
                       _this.options.push({
                        value:resp.data.data[a].id,
                        label:resp.data.data[a].versionname
                       })
                  }
                 }
               }
            })
    },
    cygltableData(versionId){
         var _this=this;
         this.$axios.post("/user/getCyglTable",{loginUserId:_this.user.id,versionId:versionId}).then(resp => {
            if (resp ) {
              console.log(resp)
              if(resp.data.code!=200){
                  this.$message({"message":resp.data.msg,center: true,showClose:true,type:'error',duration:800});
              }else{
                 _this.cyglData=resp.data.data;
                 }
               }
            })
    },
    allCurrentChange(val){
          var _this=this;
        if(val){
            _this.addUser2.push(val);
          for(var i=0;i<_this.allUser2.length;i++){
              if(_this.allUser2[i].id==val.id){
                  _this.allUser2.splice(i, 1);
              }
          }
        }
        //console.log(val)
        this.$refs.allUserTable.setCurrentRow();
    },
    deleteUser(val,username,versionId,row){
        var _this=this;
         if(row.worknum-row.doneworknum==0&&row.bugnum-row.donebugnum==0){
         this.$confirm("确认从项目["+_this.project+"]移除成员["+username+"]？")
          .then(_ => {
                this.$axios.post("/user/deleteUser",{loginUserId:_this.user.id,userId:val,versionId:versionId}).then(resp => {
                if (resp ) {
                console.log(resp)
                if(resp.data.code!=200){
                    this.$message({"message":resp.data.msg,center: true,showClose:true,type:'error',duration:800});
                }else{
                        _this.cygltableData(_this.value);
                    }
                }
                })
          })
          .catch(_ => {});
          }else{
               this.$message({"message":"该员工还有未完成的任务，请转接任务后或取消移除",center: true,showClose:true,type:'error',duration:1000});
          }
    },
    addCurrentChange(val){
         var _this=this;
        if(val){
            _this.allUser2.push(val);
          for(var i=0;i<_this.addUser2.length;i++){
              if(_this.addUser2[i].id==val.id){
                  _this.addUser2.splice(i, 1);
              }
          }
        }
        this.$refs.addUserTable.setCurrentRow();
    },
    submitZJ(){
          var _this=this;
           if(_this.multipleSelection.length>0){
            this.$axios.post("/user/updateWBById",{loginUserId:_this.user.id,zjUserId:_this.zjUserId ,toUserId:_this.UserValue,list:_this.multipleSelection}).then(resp => {
                if (resp ) {
                console.log(resp)
                if(resp.data.code!=200){
                    this.$message({"message":resp.data.msg,center: true,showClose:true,type:'error',duration:800});
                }else{
                    this.$message({"message":resp.data.msg,center: true,showClose:true,type:'success',duration:2000});
                    _this.cygltableData(_this.value);
                    _this.WorkdialogFormVisible=false;
                    }
                }
                })
                }else{
                    this.$message({"message":"请选择要转接的任务，或点击右上角关闭按钮关闭页面",center: true,showClose:true,type:'error',duration:1000});
                }
    },
    submitForm(val){
         var _this=this;
         _this.logining=true;
        if(val==0){
              _this.allUser2 = _this.allUser.concat();
              _this.addUser2 = _this.addUser.concat();
        }else{
            for(var i=0;i<_this.addUser2.length;i++)
            {
                for(var j=0;j<_this.addUser.length;j++){
                    if(_this.addUser2[i].id==_this.addUser[j].id)
                    {
                         _this.addUser2.splice(i, 1);
                    }
                }
            }
           if( _this.addUser2.length>0){
                this.$axios.post("/user/addUser",{loginUserId:_this.user.id,userList:_this.addUser2,versionId:_this.value}).then(resp => {
                if (resp ) {
                console.log(resp)
                if(resp.data.code!=200){
                    this.$message({"message":resp.data.msg,center: true,showClose:true,type:'error',duration:800});
                    this.submitForm(0);
                }else{
                    this.$message({"message":resp.data.msg,center: true,showClose:true,type:'success',duration:2000});
                    _this.cygltableData(_this.value);
                   // _this. openDialog();
                     _this.logining=false;
                     _this. dialogFormVisible=false;
                    }
                }
                })
            }else{
                _this.dialogFormVisible=false;
            }
        }
    },
    toUser(userId,userName,versionId,row){
        if(row.worknum-row.doneworknum>0||row.bugnum-row.donebugnum>0){
        var _this=this;
        var toUser2=[];
         _this.UserValue ="";
        _this.zjUserId=userId;
        for(var i=0;i<_this.cyglData.length;i++){
              if(_this.cyglData[i].id!==userId){
                  toUser2.push(_this.cyglData[i]);
              }
        }
        _this.userOptions=toUser2;
        _this.UserdialogVisible=true;
        }else{
              this.$message({"message":"没有可以转接的任务",center: true,showClose:true,type:'error',duration:800});
        }
    },
    UserChange(){
        var _this=this;
        if(_this.UserValue==''){
            _this.UserdialogVisible=true;
        }else{
            setTimeout(function() {
                 _this.toUserName= $("#UserSelect").val();
                    _this.toUserData(_this.zjUserId,_this.value);
            }, 100);

        }
    },
     handleSelectionChange(val) {
        this.multipleSelection = val;
      },
    toUserData(userId,versionId){
         var _this=this;
         this.$axios.post("/user/getDoing",{loginUserId:_this.user.id,userId:userId,versionId:versionId}).then(resp => {
                if (resp ) {
                console.log(resp)
                if(resp.data.code!=200){
                    this.$message({"message":resp.data.msg,center: true,showClose:true,type:'error',duration:800});
                }else{
                   _this.doingWD=resp.data.data;
                    _this.UserdialogVisible=false;
                   _this.WorkdialogFormVisible=true;
                    }
                }
                })
    },
     projectChange(){
        var _this=this;
        if(_this.value==''){
            _this.cyglData=[];
             _this.project='';
        }else{
            setTimeout(function() {
                 _this.project= $("#projectSelect").val()
            }, 100);
          
           _this.cygltableData(_this.value);
        }
    },
    openDialog(){
         var _this=this;
        if(_this.project!='')
            {
            _this.$axios.post("/user/getAllUser",{loginUserId:_this.user.id,versionId:_this.value}).then(resp => {
            if (resp ) {
              console.log(resp)
              if(resp.data.code!=200){
                  this.$message({"message":resp.data.msg,center: true,showClose:true,type:'error',duration:800});
              }else{
                 _this.allUser=resp.data.data;
                 _this.allUser2 = _this.allUser.concat();
                  _this.addUser= _this.cyglData;
                   _this.addUser2 = _this.addUser.concat();
                  _this.dialogFormVisible=true
                 }
               }
            })
            }
        else{
             this.$message({"message":"请选择项目",center: true,showClose:true,type:'error',duration:800});
        }
    },
   
  },
 mounted () {
   },
 created(){
     this.getUser();
     this.cyglDataInit();
   }
}
</script>
<style scoped>

</style>
