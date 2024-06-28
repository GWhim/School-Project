<template>
    <div id="xqtm">
        <router-view></router-view>
        <el-row class="xqtm-top">
           <el-col :span="23" class="top-bg">
               <el-row>
                   <el-col :span="8" class="xqtm-select-item">
                    选择项目：
                    <el-select id="projectSelect" v-model="value" @change="projectChange" filterable clearable placeholder="请选择项目,可输入查找">
                        <el-option v-for="item in options" :key="item.value" :label="item.label" :value="item.value"> </el-option> 
                    </el-select>
                   </el-col>
                   
                </el-row>
           </el-col>
        </el-row>
        <el-row class="xqtm-center">
            <el-col :span="5" class="xqtm-center-left">
                 <el-table :data="fileData" height="600" empty-text="请选择项目"class="xqtm-table" :show-header="false"@current-change="allCurrentChange" highlight-current-row :header-cell-style="{'border-bottom': '1px solid #2197F1'}">
                    <el-table-column  align="center" prop="id" label="id"  width="0" v-if="false" sortable> </el-table-column>
                    
                    <el-table-column  align="left" prop="name" label="姓名"  width="400"  sortable> </el-table-column>
                </el-table>
            </el-col>
            <el-col :span="18" class="xqtm-center-right">
                <el-col :span="6"class="xqtm-select-item2">
                     <el-button v-if="user.identity==1||user.identity==2" @click="openDialog" style="width:80%">添加新条目 > ></el-button>
                   </el-col>
                 <el-table :data="xqtmData" height="500" empty-text="暂无测试文件"class="xqtm-table2" >
                    <el-table-column  align="center" prop="id" label="id"  width="0" v-if="false" sortable> </el-table-column>
                    <el-table-column  align="center" prop="vId" label="vId"  width="0" v-if="false" sortable> </el-table-column>
                    <el-table-column  align="center" prop="title" label="标题"  width="300"  sortable> </el-table-column>
                    <el-table-column  align="center"  prop="enduser" label="标题"width="300"v-if="false"  > </el-table-column>
                     <el-table-column  align="center"  prop="endtime"label="标题"width="300" v-if="false" > </el-table-column>
                    <el-table-column align="center"  prop="createuser" label="创建人"  width="150"  sortable> </el-table-column>
                     <el-table-column align="center"  prop="createtime" label="创建时间"  width="300"  sortable> </el-table-column>
                     <el-table-column align="center"  prop="doneworknum" label="状态"  width="120"  sortable> 
                         <template slot-scope="scope">
                           <span v-if="scope.row.status==0"style="color:	#DC143C" >已关闭</span>
                            <span v-if="scope.row.status==1" style="color:	#7FFF00">正在进行</span>
                            <span v-if="scope.row.status==2">已测试</span>
                         </template>
                     </el-table-column>
                    <el-table-column align="center"  label="操作" width="300">
                        <template slot-scope="scope">
                            <el-button  @click="xqtmdetil(scope.row)" type="text" size="small">详情</el-button>
                            <el-button v-if="user.identity==1||user.identity==2"@click="xqtmclose(scope.row)" type="text" size="small">关闭</el-button>
                            <el-button v-if="(user.identity==1||user.identity==2)&&scope.row.status==1"@click="xqtmdone(scope.row)" type="text" size="small">测试通过</el-button>
                        </template>
                     </el-table-column>
                </el-table>
            </el-col>
        </el-row>
        <el-dialog :visible.sync="dialogFormVisible" customClass="cyglAdd"   width="30%"center>
            <template slot="title">
              <div style="text-align: center; color: #fff; font-size: 20px;">向项目[ {{project}} ]添加新测试条目</div>    
            </template>
          <el-row style="height:280px">
              <el-form :model="Form" :rules="rules" ref="cstmruleForm" label-width="100px" class="demo-ruleForm">
                   <el-form-item label="标题" prop="cstmtitle">
                        <el-input placeholder="请输入测试条目标题"v-model="Form.cstmtitle"></el-input>
                    </el-form-item>
              <div style="padding-top:20px"></div>
              <el-form-item label="描述" prop="textarea">
                <el-input type="textarea":rows="10"placeholder="请输入测试条目描述"v-model="Form.textarea"maxlength="1000"show-word-limit></el-input>
               </el-form-item>
              </el-form>
          </el-row>
          <div slot="footer" class="dialog-footer">
            <el-button type="primary" @click="submitForm('cstmruleForm')" :loading="logining">确 定</el-button>
          </div>
        </el-dialog>
        <el-dialog :visible.sync="xqtmdialog" customClass="global-bk"   width="40%"center>
            <template slot="title">
              <div style="text-align: center; color: #fff; font-size: 20px;">详情</div>    
            </template>
            <span class="global-color" >标题</span>
            <div style="text-align: left; color: #fff; font-size: 18px;height: 100px;background-color: cadetblue;    padding-top: 20px;
    padding-left: 20px;">{{biaoti}}</div>
            <span class="global-color" >描述</span>
            <div style="text-align: left; color: #fff; font-size: 18px;height: 200px;background-color: cadetblue;    padding-top: 20px;
    padding-left: 20px;">{{miaoshu}}</div>
                <span class="global-color" v-html="rwxq"></span>
        </el-dialog>
     </div>
</template>
<script>
import axios from 'axios'
import"./assets/css/xqtm.css"
export default {
  name:'xqtm',
  data(){
      return{
          value:'',
          userId:'',
          user:{},
           options:[],
           testId:'',
           project:'',
           dialogFormVisible:false,
           xqtmData:[],
           logining:false,
           Form:{
               cstmtitle:'',
               textarea:'',
           },
            rules: { cstmtitle: [{ required: true, message: '请输入标题', trigger: 'blur' },],
          textarea: [{ required: true, message: '请输入描述', trigger: 'blur' },],},
          fileData:[],
          xqtmdialog:false,
          rwxq:'',
          biaoti:'',
          miaoshu:'',
      }
  },
 methods:{
     cygltableData(){},
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
    allCurrentChange(val){
          var _this=this;
          _this.testId=val.testId;
        this.$axios.post("/user/getTestItemByTestId",{testId:val.testId}).then(resp => {
            if (resp ) {
              console.log(resp)
              if(resp.data.code!=200){
                  this.$message({"message":resp.data.msg,center: true,showClose:true,type:'error',duration:800});
              }else{
                    _this.xqtmData=resp.data.data
                 }
               }
            })
    },
    getFlieByUV(){
        var _this=this;
        this.$axios.post("/user/getCsFlieByUV",{vId:this.value,uId:this.user.id,type:2}).then(resp => {
            if (resp ) {
              if(resp.data.code!=200){
                  this.$message({"message":resp.data.msg,center: true,showClose:true,type:'error',duration:800});
              }else{
                  _this.fileData=resp.data.data;
                 
                 }
               }
            })
    },
    projectChange(){
        var _this=this;
        if(_this.value==''){
             _this.project='';
              _this.getFlieByUV()
              _this.xqtmData=null;
               _this.testId='';
        }else{
            setTimeout(function() {
                 _this.project= $("#projectSelect").val()
            }, 100);
            _this.getFlieByUV()
        }
    }, 
    
    openDialog(){
         var _this=this;
        if(_this.testId=='')
            {
                 this.$message({"message":"请选择文件",center: true,showClose:true,type:'error',duration:800});
            }
        else if(_this.value==''){
             this.$message({"message":"请选择项目",center: true,showClose:true,type:'error',duration:800});
        }else {
              _this.dialogFormVisible=true
        }
    }, 
    submitForm(val){
         var _this=this;
         this.$refs[val].validate((valid) => {
          if (valid) {
         _this.logining=true;
                this.$axios.post("/user/addcstm",{uId:_this.user.id,textarea:_this.Form.textarea,cstmtitle:_this.Form.cstmtitle,vId:_this.value,testId:_this.testId}).then(resp => {
                if (resp ) {
                console.log(resp)
                if(resp.data.code!=200){
                    this.$message({"message":resp.data.msg,center: true,showClose:true,type:'error',duration:800});
                }else{
                    this.$message({"message":resp.data.msg,center: true,showClose:true,type:'success',duration:2000});
                   
                     _this.logining=false;
                     _this. dialogFormVisible=false;
                     _this.allCurrentChange({'testId':_this.testId});
                    }
                }
                })
          }
         })
    },
    xqtmdetil(val){ 
        var _this=this ;
        _this.biaoti=val.title
        _this.miaoshu=val.des
        _this.rwxq="创建人: "+val.createuser+" 创建时间: "+val.createtime
        if(val.status==0){
             _this.rwxq+="<br/><br/>"+"关闭人："+val.enduser+" 关闭时间："+val.endtime;
        }else if(val.status==2){
             _this.rwxq+="<br/><br/>"+"测试人："+val.enduser+" 测试时间："+val.endtime;
        }
       _this.xqtmdialog=true;},
    xqtmclose(val){
        var _this=this ; 
        this.$confirm('确认关闭？')
          .then(_ => {
            this.$axios.post("/user/updateCstmstatus",{userId:_this.user.id,xqtmId:val.id,status:"0"}).then(resp => {
                if (resp ) {
                if(resp.data.code!=200){
                    this.$message({"message":resp.data.msg,center: true,showClose:true,type:'error',duration:800});
                }else{
                    _this.allCurrentChange({'testId':_this.testId});
                    }
                }
                })
          })
          .catch(_ => {});},
    xqtmdone(val){
         var _this=this ; 
        this.$confirm('测试完成？')
          .then(_ => {
            this.$axios.post("/user/updateCstmstatus",{userId:_this.user.id,xqtmId:val.id,status:"2"}).then(resp => {
                if (resp ) {
                if(resp.data.code!=200){
                    this.$message({"message":resp.data.msg,center: true,showClose:true,type:'error',duration:800});
                }else{
                    _this.allCurrentChange({'testId':_this.testId});
                    }
                }
                })
          })
          .catch(_ => {});
    },
  },
 mounted () {
   },
 created(){
     this.$getUser();
      this.cyglDataInit();
   }
}
</script>
<style scoped>

</style>
