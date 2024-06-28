<template>
    <div id="fqqx">
        <router-view></router-view>
        <el-row class="jd-top">
             <el-row class="jd-top-top">
             <el-col :span="6" class="">
                    选择项目：
                    <el-select id="projectSelect" v-model="projectSelectValue" @change="projectChange(0)" filterable clearable placeholder="请选择项目,可输入查找">
                        <el-option v-for="item in pOptions" :key="item.value" :label="item.label" :value="item.value"> </el-option> 
                    </el-select>
            </el-col>
            <el-col :span="6" class="">
                    选择迭代：
                    <el-select id="versionSelect" v-model="versionSelectValue" @change="projectChange(1)" filterable clearable placeholder="请选择迭代,可输入查找">
                        <el-option v-for="item in vOptions" :key="item.value" :label="item.label" :value="item.value"> </el-option> 
                    </el-select>
            </el-col>
            <el-date-picker  v-model="timevalue" type="daterange"@input="projectChange(2)"align="center" start-placeholder="任务创建开始日期"end-placeholder="任务创建结束日期"  range-separator="——":picker-options="pickerOptions"></el-date-picker>
             <el-col :span="6" class="">
             <el-button  @click="addRw()" type=""class="jd-addRw">发起缺陷</el-button>
             </el-col>
             </el-row>
        </el-row>
         <el-row class="jd-center">
           <el-row>
               <el-table :data="rWData" height="450" empty-text="暂无缺陷"class="rw-table" :header-cell-style="{'border-bottom': '1px solid #2197F1'}">
                    <el-table-column  align="center" prop="id" label="id"  width="0" v-if="false" sortable> </el-table-column>
                    <el-table-column  align="center" prop="pname" label="所属项目"  width="150"  sortable> </el-table-column>
                    <el-table-column align="center"  prop="vname" label="所属迭代"  width="150"  sortable> </el-table-column>
                    <el-table-column  align="center" prop="createusername" label="创建人"  width="150"  sortable> </el-table-column>
                    <el-table-column  align="center" prop="username" label="指派人"  width="150"  sortable> </el-table-column>
                    <el-table-column align="center"  prop="createtime" label="创建时间"  width="180"  sortable> </el-table-column>
                    <el-table-column align="center"  prop="des" label="描述"  width="300"  sortable> </el-table-column>
                    <el-table-column align="center"  prop="endusername" label="结束人"  v-if="false"  sortable>  </el-table-column>
                    <el-table-column align="center"  prop="endtime" label="结束时间"   v-if="false"  sortable>  </el-table-column>
                    <el-table-column align="center"  prop="Gstatus" label="状态"  width="150"  sortable> 
                        <template slot-scope="scope">
                             <span v-if="scope.row.Gstatus==1" style="color:#DC143C">未完成</span>
                            <span v-if="scope.row.Gstatus==2" style="color:	#7FFF00">已完成</span>
                            <span v-if="scope.row.Gstatus==3" >已转发</span>
                            <span v-if="scope.row.Gstatus==4" >已关闭</span>
                             <span v-if="scope.row.versionstatus==2" >已迭代</span>
                        </template>
                    </el-table-column>
                    <el-table-column align="center"  label="操作" width="250">
                        <template slot-scope="scope">
                            <el-button  @click="toDetil(scope.row)" type="text" size="small">详情</el-button>
                            <el-button v-if="scope.row.Gstatus==1&&scope.row.versionstatus!=2" @click="toDo(scope.row,1)" type="text" size="small">完成</el-button>
                            <el-button v-if="scope.row.Gstatus==1&&scope.row.versionstatus!=2" @click="toDo(scope.row,2)" type="text" size="small">转发</el-button>
                            <el-button v-if="scope.row.Gstatus==1&&scope.row.versionstatus!=2" @click="toDo(scope.row,3)" type="text" size="small">关闭</el-button>
                        </template>
                    </el-table-column>
                </el-table>
           </el-row>
        </el-row>
        <el-dialog :visible.sync="addRwDialog" customClass="global-bk"   width="30%"center>
             <template slot="title">
              <div style="text-align: center; color: #fff; font-size: 20px;">发起缺陷</div>    
            </template>
            <el-form :model="form" ref="mmForm" >
                <el-form-item label="选择指定的项目迭代" label-width="150px" prop="addRwVValue">
                    <el-select id="addRwVSelect" v-model="form.addRwVValue" @change="addRwVChange" filterable clearable placeholder="请选择项目,可输入查找"style="width:300px;margin-right: 100px;">
                        <el-option v-for="item in addRwVOptions" :key="item.id" :label="item.versionname" :value="item.id"> </el-option> 
                    </el-select>
                </el-form-item>
                <el-form-item label="选择缺陷指派人" label-width="150px" prop="selectUser">
                    <el-select id="userSelect" v-model="form.selectUser"clearable filterable placeholder="请选择项目,可输入查找"style="width:300px;margin-right: 100px;">
                        <el-option-group v-for="group in userOptions" :key="group.label" :label="group.label">
                        <el-option v-for="item in group.options" :key="item.value" :label="item.label" :value="item.value"> </el-option>
                        </el-option-group>
                    </el-select>
                </el-form-item>
                <el-form-item label="描述" label-width="150px" prop="des">
                    <el-input v-model="form.des"   type="textarea" :autosize="{ minRows: 1, maxRows: 5}" class="addrw-item" ></el-input>
                </el-form-item>
            </el-form>
          <div slot="footer" class="dialog-footer">
            <el-button type="primary" @click="submitaddRw()">确 定</el-button>
          </div>
        </el-dialog>
         <el-dialog :visible.sync="rwxqdialogVisible" customClass="global-bk"   width="40%"center>
            <template slot="title">
              <div style="text-align: center; color: #fff; font-size: 20px;">详情</div>    
            </template>
                <span class="global-color" v-html="rwxq"></span>
        </el-dialog>
        <el-dialog :visible.sync="isDo"width="30%"center customClass="global-bk">
            <span style="text-align: center;color: #fff;font-size: 20px;">确定完成吗？</span>
            <span slot="footer" class="dialog-footer">
                <el-button @click="isDo = false">取 消</el-button>
                <el-button type="primary" @click="dorw(valtemp)">确 定</el-button>
            </span>
        </el-dialog>
         <el-dialog :visible.sync="isClose"width="30%"center customClass="global-bk">
            <span style="text-align: center;color: #fff;font-size: 20px;">确定关闭吗？</span>
            <span slot="footer" class="dialog-footer">
                <el-button @click="isClose = false">取 消</el-button>
                <el-button type="primary" @click="doclose(valtemp)">确 定</el-button>
            </span>
        </el-dialog>
        <el-dialog :visible.sync="ortherUserdialogVisible" customClass="global-bk"   width="40%"center>
            <template slot="title">
              <div style="text-align: center; color: #fff; font-size: 20px;">选择转接人</div>    
            </template>
          <el-row style="height:100px">
               <el-select id="ortherUserSelect"ref="ortherUserSelect" v-model="ortherUserValue" @change="toUser" filterable clearable placeholder="请选择转接人,可输入查找">
                        <el-option v-for="item in ortherUserOptions" :key="item.id" :label="item.username" :value="item.id"> </el-option> 
                    </el-select>
          </el-row>
        </el-dialog>
     </div>
</template>
<script>
import axios from 'axios'
import"./assets/css/fqqx.css"
export default {
  name:'fqqx',
  data(){
      return{
          activeName:'',
          userId:'',
          user:{},
          qx:false,
          rWData:[],
          addRwDialog:false,
          addRwVSelectName:'',
          addRwVOptions:[],
          form:{addRwVValue:'',selectUser:'',des:''},
          userOptions: [ { label: '开发', options: [] }, { label: '测试',  options: [] }, { label: '需求', options: [] }, { label: '项目经理',  options: [] }],
          rwxqdialogVisible:false,
          rwxq:'',
          isDo:false,
          valtemp:{},
          ortherUserdialogVisible:false,    
          ortherUserOptions:[],
          ortherUserValue:'',
          isClose:false,
          timevalue:['',''],
          pOptions:[],
          vOptions:[],
          projectSelectValue:'',
          versionSelectValue:'',
          pickerOptions: {disabledDate(time) {return time.getTime() > Date.now() - 8.64e6}},  
           percentage: 10,
          colors: [{color: '#f56c6c', percentage: 20},{color: '#e6a23c', percentage: 40},
          {color: '#5cb87a', percentage: 60},{color: '#1989fa', percentage: 80},{color: '#6f7ad3', percentage: 100}]
      }
  },
 methods:{

     jdInit(){
         var _this=this;
         this.$axios.post("/user/getqx",
         {userId:_this.user.id,identity:_this.user.identity,
         starttime:_this.$dateFormat("YYYY-mm-dd HH:MM:SS",( _this.timevalue==null?"":_this.timevalue[0])),
         endtime:_this.$dateFormat("YYYY-mm-dd HH:MM:SS", (_this.timevalue==null?"":_this.timevalue[1])),
         pId:_this.projectSelectValue,vId:_this.versionSelectValue}).then(resp => {
            if (resp ) {
              console.log(resp)
              if(resp.data.code!=200){
                  this.$message({"message":resp.data.msg,center: true,showClose:true,type:'error',duration:800});
              }else{
                  _this.pOptions= [];
                  for(var a=0;a<resp.data.data.map.length;a++){
                       _this.pOptions.push({
                        value:resp.data.data.map[a].id,
                        label:resp.data.data.map[a].name
                       })
                  }
                 _this.rWData=resp.data.data.list;
                  _this.form={addRwVValue:'',selectUser:'',des:''};
                  _this.isDo=false;
                  _this.addRwDialog=false;
                  _this.ortherUserdialogVisible=false;
                   _this.isClose=false;
                 }
               }
            })
     },
     addRw(){
          var _this=this;
          this.$axios.post("/user/getaddRWV",{userId:_this.user.id}).then(resp => {
            if (resp ) {
              console.log(resp)
              if(resp.data.code!=200){
                  this.$message({"message":resp.data.msg,center: true,showClose:true,type:'error',duration:800});
              }else{
                    _this.addRwVOptions=resp.data.data;
                    _this.addRwDialog=true;
                 }
               }
            })
     },
     addRwVChange(){
        var _this=this;
        if(_this.form.addRwVValue==''){
            _this.userOptions= [ { label: '开发', options: [] }, { label: '测试',  options: [] }, { label: '需求', options: [] }, { label: '项目经理',  options: [] }];
            _this.form.selectUser='';
        }else{
            setTimeout(function() {
                 _this.addRwVSelectName= $("#addRwVSelect").val()
            }, 100);
           this.$axios.post("/user/getaddRWByV",{vId:_this.form.addRwVValue}).then(resp => {
            if (resp ) {
              console.log(resp)
              if(resp.data.code!=200){
                  this.$message({"message":resp.data.msg,center: true,showClose:true,type:'error',duration:800});
              }else{
                  _this.userOptions= [ { label: '开发', options: [] }, { label: '测试',  options: [] }, { label: '需求', options: [] }, { label: '项目经理',  options: [] }];
                    for(var i=0;i<resp.data.data.length;i++){
                        for( var j=0;j<_this.userOptions.length;j++){
                            if(resp.data.data[i].identity==_this.userOptions[j].label){
                                    _this.userOptions[j].options.push({'label':resp.data.data[i].name,'value':resp.data.data[i].id})
                            }
                        }
                    }
                 }
               }
            })
        }
    },
    submitaddRw(){
        var _this=this;
        this.$axios.post("/user/addQx",{createUserId:_this.user.id,vId:_this.form.addRwVValue,selectUser:_this.form.selectUser,des:_this.form.des}).then(resp => {
            if (resp ) {
              console.log(resp)
              if(resp.data.code!=200){
                  this.$message({"message":resp.data.msg,center: true,showClose:true,type:'error',duration:800});
              }else{
                 this.$message({"message":resp.data.msg,center: true,showClose:true,type:'success',duration:800});
                 _this.projectChange(0,0);
                 }
               }
            })
    },
    toDetil(val){
         var _this=this ;
        _this.rwxq="创建人: "+val.createusername+" 创建时间: "+val.createtime
        if(val.Gstatus!=1){
             _this.rwxq+="<br/><br/>"+"结束人："+val.endusername+" 结束时间："+val.endtime;
        }
       _this.rwxqdialogVisible=true;
    },
    toDo(val,a){
        var _this=this;
        this.valtemp=val;
        if(a==1){
            this.isDo=true;
        }else if(a==2){
            this.$axios.post("/user/selectTeamByUV",{userId:val.userid,vId:val.vId}).then(resp => {
            if (resp ) {
              if(resp.data.code!=200){
                  this.$message({"message":resp.data.msg,center: true,showClose:true,type:'error',duration:800});
              }else{
                 _this.ortherUserOptions=resp.data.data;
                 _this.ortherUserdialogVisible=true;
                 }
               }
            })
        }else if(a==3){
             this.isClose=true;
        }
    },
     dorw(val){
        this.$axios.post("/user/updateBugStauts",{bugId:val.id,userId:this.user.id}).then(resp => {
            if (resp ) {
              console.log(resp)
              if(resp.data.code!=200){
                  this.$message({"message":resp.data.msg,center: true,showClose:true,type:'error',duration:800});
              }else{
                this.projectChange(0,0);
                 }
               }
            })
    },
    toUser(){
        var _this=this;
        this.$axios.post("/user/zjbug",{loginUserId:_this.user.id,toUserId:_this.ortherUserValue,bugId:_this.valtemp.id}).then(resp => {
            if (resp ) {
              if(resp.data.code!=200){
                  this.$message({"message":resp.data.msg,center: true,showClose:true,type:'error',duration:800});
              }else{
                  _this.jdInit();
                 }
               }
            })
       
    },
    doclose(val){
        var _this=this;
        this.$axios.post("/user/closeQx",{loginUserId:_this.user.id,bugId:_this.valtemp.id}).then(resp => {
            if (resp ) {
              if(resp.data.code!=200){
                  this.$message({"message":resp.data.msg,center: true,showClose:true,type:'error',duration:800});
              }else{
                    _this.projectChange(0,0);
                 }
               }
            })
    },
    projectChange(val,val2){
        var _this=this;
        if(val==0){
            if(val2!=0){
                _this.versionSelectValue='';
            }
            this.$axios.post("/user/projectDetil",{pId:_this.projectSelectValue}).then(resp => {
            if (resp ) {
              console.log(resp)
              if(resp.data.code!=200){
                  this.$message({"message":resp.data.msg,center: true,showClose:true,type:'error',duration:800});
              }else{
                   _this.vOptions= [];
                  for(var a=0;a<resp.data.data.versionlist.length;a++){
                       if(resp.data.data.versionlist[a].status==2){
                          var str=" (已迭代)"
                      } else if(resp.data.data.versionlist[a].status==0){
                          var str=" (已关闭)"
                      }
                      else{ var str=" "}
                       _this.vOptions.push({
                        value:resp.data.data.versionlist[a].id,
                        label:resp.data.data.versionlist[a].name+str,
                        worknum:resp.data.data.versionlist[a].worknum
                       })
                  }
                 }
               }
            })
        }else if(val==9){
             _this.versionSelectValue=val2.value;
        }
        this.jdInit()
    },
  },
 mounted () {
   },
 created(){
     this.$getUser();
     this.jdInit();
     if(this.user.identity==1){
         this.qx=true;
     }
   }
}
</script>
<style scoped>

</style>
