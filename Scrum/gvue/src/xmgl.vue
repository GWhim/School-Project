<template>
    <div id="xmgl">
        <router-view></router-view>
        
           <el-row class="xmgl-top">
                <el-col :span="23" class="top-bg">
                    <el-row> 
                        <el-col :span="5"class="xm-title"><span  >项目一览 </span></el-col>
                        <el-col :span="5"class="addXm"><el-button v-if="user.identity==1" @click="addNewProject" style="width:80%">添加新项目 > ></el-button></el-col>
                     </el-row>
                     <el-row>
                        <el-col :span="24"class="xmgl-table-col">
                            <el-table :data="cyglData" height="700" empty-text="暂无数据"class="xmgl-table" :header-cell-style="{'border-bottom': '1px solid #2197F1'}">
                                <el-table-column  align="center" prop="id" label="id"  width="0" v-if="false" sortable> </el-table-column>
                                <el-table-column  align="center" prop="name" label="项目名"  width="150"  sortable> </el-table-column>
                                 <el-table-column align="center"  prop="versionname" label="最新迭代"  width="150"  sortable> 
                                     <template slot-scope="scope">
                                       <span v-if="scope.row.versionname==null" style="color:	#DC143C">已关闭</span>
                                         <span v-if="scope.row.versionname">{{scope.row.versionname}}</span>
                                    </template>
                                </el-table-column>
                                <el-table-column align="center"  prop="createtime" label="项目创建时间"  width="200"  sortable> </el-table-column>
                                <el-table-column  align="center" prop="dec" label="描述"  width="160"  sortable> </el-table-column>
                                <el-table-column align="center"  prop="creatusername" label="创建人"  width="150"  sortable> </el-table-column>
                                <el-table-column align="center"  prop="versionnum" label="累计迭代数"  width="150"  sortable> </el-table-column>
                               
                                <el-table-column align="center"  prop="allusernum" label="历史总参与人数"  width="190"  sortable> </el-table-column>
                                 <el-table-column align="center"  prop="usernum" label="当前参与人数"  width="170"  sortable> </el-table-column>
                                <el-table-column align="center"  label="操作" width="250">
                                    <template slot-scope="scope">
                                        <el-button @click="detil(scope.row)" type="text" size="small">详情</el-button>
                                        <el-button v-if="scope.row.type==1&&user.identity==1"@click="toNewVersion(scope.row)" type="text" size="small">生成新迭代</el-button>
                                        <el-button  v-if="scope.row.type==1&&user.identity==1"@click="clsoeProject(scope.row)" type="text" size="small">关闭项目</el-button>
                                    </template>
                                </el-table-column>
                            </el-table>
                        </el-col>
                     </el-row>
                </el-col>
           </el-row>
        
        <el-dialog :visible.sync="addProjectDialog" customClass="global-bk"   width="40%"center>
            <template slot="title">
              <div style="text-align: center; color: #fff; font-size: 20px;">添加新项目</div>    
            </template>
            <el-form :model="addProjectForm"  ref="addPForm"  >
                <el-form-item label="项目名称" label-width="150px" prop="pName">
                <el-input v-model="addProjectForm.pName" class="global-color" width="100px" >
                </el-input>
                </el-form-item>
                <el-form-item label="描述" label-width="150px" prop="dec">
                    <el-input v-model="addProjectForm.dec"   class="global-color" ></el-input>
                </el-form-item>
                <el-form-item label="初始迭代名" label-width="150px" prop="vName">
                    <el-input v-model="addProjectForm.vName" class="global-color"></el-input>
                </el-form-item>
                 <el-form-item label="参与人" label-width="150px" prop="team">
                      <el-select v-model="addProjectForm.team" multiple filterable clearable  default-first-option placeholder="请选择参与人，可输入搜索" style="width:520px">
                        <el-option-group v-for="group in userOptions" :key="group.label" :label="group.label">
                            <el-option v-for="item in group.options" :key="item.value" :label="item.label" :value="item.value"> </el-option>
                        </el-option-group>
                    </el-select>
                </el-form-item>
          </el-form>
          <div slot="footer" class="dialog-footer">
            <el-button type="primary" @click="submitAdd()" :loading="adding">确 定</el-button>
          </div>
        </el-dialog>
         <el-dialog :visible.sync="detilDialog" customClass="global-bk"   width="70%"center>
            <template slot="title">
              <div style="text-align: center; color: #fff; font-size: 20px;">项目详情</div>    
            </template>
            <el-row>
                <el-col :span="13">
            <el-table :data="detilVData" height="450" empty-text="请联系管理员"class="xmgl-detil-table" :header-cell-style="{'border-bottom': '1px solid #2197F1'}">
                  <el-table-column align="center"label="历史迭代">
                 <el-table-column  align="center" prop="id" label="id"  width="0" v-if="false" sortable> </el-table-column>
                <el-table-column  align="center" prop="name" label="迭代名"  width="175"  sortable> </el-table-column>
                 <el-table-column  align="center" prop="createtime" label="创建时间"  width="175"  sortable> </el-table-column>
                 <el-table-column  align="center" prop="createName" label="创建人"  width="175"  sortable> </el-table-column>
                 <el-table-column  align="center"  label="当前状态"  width="175"  sortable> 
                       <template slot-scope="scope">
                           <span v-if="scope.row.status==0"style="color:	#DC143C" >已关闭</span>
                            <span v-if="scope.row.status==1" style="color:	#7FFF00">正在进行</span>
                            <span v-if="scope.row.status==2">已迭代</span>
                         </template>
                 </el-table-column>
                 </el-table-column>
            </el-table>
            </el-col>
             <el-col :span="6" class="xmgl-detil-table-right">
            <el-table :data="detilTData" height="450" empty-text="没有参与成员"class="xmgl-detil-table-user" :header-cell-style="{'border-bottom': '1px solid #2197F1'}">
                  <el-table-column align="center"label="当前参与人">
                 <el-table-column  align="center" prop="id" label="id"  width="0" v-if="false" sortable> </el-table-column>
                <el-table-column  align="center" prop="name" label="姓名"  width="175"  sortable> </el-table-column>
                 <el-table-column  align="center" prop="identity" label="职位"  width="175"  sortable> </el-table-column>
                </el-table-column>
            </el-table>
             </el-col>
            </el-row>
          <div slot="footer" class="dialog-footer">
            <el-button type="primary" @click="detilDialog=false" >确 定</el-button>
          </div>
        </el-dialog>

        <el-dialog :visible.sync="toNewVersionDialog" customClass="global-bk" :before-close="handleClose"  width="40%"center>
            <template slot="title">
              <div style="text-align: center; color: #fff; font-size: 20px;">产生新迭代</div>    
            </template>
            <el-form :model="addVForm"  ref="addVForm"  >
                <el-form-item label="最新迭代名称" label-width="150px" prop="pName">
                <el-input v-model="addVForm.vName" class="global-color" width="100px" >
                </el-input>
                </el-form-item>
                 <el-form-item label="参与人" label-width="150px" prop="team">
                      <el-select v-model="addVForm.team" multiple filterable clearable  default-first-option placeholder="请选择参与人，可输入搜索" style="width:520px">
                        <el-option-group v-for="group in userOptions" :key="group.label" :label="group.label">
                            <el-option v-for="item in group.options" :key="item.value" :label="item.label" :value="item.value"> </el-option>
                        </el-option-group>
                    </el-select>
                </el-form-item>
          </el-form>
          <div slot="footer" class="dialog-footer">
            <el-button type="primary" @click="submitAddV()" :loading="adding">确 定</el-button>
          </div>
        </el-dialog>
         <el-dialog :visible.sync="toNewVersionUserDialog" customClass="global-bk"   width="60%"center>
            <template slot="title">
              <div style="text-align: center; color: #fff; font-size: 20px;">请确认给项目[ {{pName}} ]产生新迭代，以下任务/BUG还未完成</div>    
            </template>
            <el-table :data="versionWorkData" height="450" empty-text="请联系管理员"class="xmgl-vWork-table" :header-cell-style="{'border-bottom': '1px solid #2197F1'}">
                <el-table-column  align="center" prop="name" label="任务/BUG进行人"  width="200"  sortable> </el-table-column>
                <el-table-column  align="center" prop="des" label="描述"  width="250"  > </el-table-column>
                 <el-table-column  align="center" prop="createtime" label="创建时间"  width="175"  sortable> </el-table-column>
                 <el-table-column  align="center" prop="createname" label="创建人"  width="175"  sortable> </el-table-column>
                 <el-table-column  align="center"  label="类型"  width="175"  sortable> 
                       <template slot-scope="scope">
                           <span v-if="scope.row.type==1">任务</span>
                            <span v-if="scope.row.type==2" >BUG</span>
                         </template>
                 </el-table-column>
                 </el-table-column>
            </el-table>
          <div slot="footer" class="dialog-footer">
            <el-button type="primary" @click="submitNewV" >确 定</el-button>
          </div>
        </el-dialog>
        <el-dialog  :visible.sync="toNewVersionUserDialog2" width="30%" center customClass="toexit">
        <span style="text-align: center;
            color: #fff;
            font-size: 20px;">确定给项目[ {{pName}} ]产生新迭代吗？</span>
        <span slot="footer" class="dialog-footer">
            <el-button @click="toNewVersionUserDialog2 = false">取 消</el-button>
            <el-button type="primary" @click="submitNewV()">确 定</el-button>
        </span>
        </el-dialog>
     </div>
</template>
<script>
import axios from 'axios'
import"./assets/css/xmgl.css"
export default {
  name:'xmgl',
  data(){
      return{
          user:{},
          pId:'',
          pName:'',
          userId:'',
          cyglData:[],
          projectDialog:false,
          addProjectDialog:false,
          detilDialog:false,
          toNewVersionDialog:false,
          toNewVersionUserDialog:false,
          toNewVersionUserDialog2:false,
          clsoeProjectDialog:false,
          addProjectForm:{pName:'',dec:'', vName:'',team:[],},
          addVForm:{vName:'',team:[],},
          userOptions: [ { label: '开发', options: [] }, { label: '测试',  options: [] }, { label: '需求', options: [] }, { label: '项目经理',  options: [] }],
          detilVData:[],
          detilTData:[],
          versionWorkData:[],
          adding:false,
      }
  },
 methods:{
        openDialog(){},
        getUser(){
            if(this.$route.params.user){ this.user=this.$route.params.user;}else{
                this.user={id:localStorage.getItem('userId'),name:localStorage.getItem('userName'),identity:localStorage.getItem('identity')}
            }  
        },
        initData(){
            var _this=this;
            this.$axios.post("/user/xmglData",{userId:_this.user.id}).then(resp => {
                if (resp ) {
                if(resp.data.code!=200){
                    this.$message({"message":resp.data.msg,center: true,showClose:true,type:'error',duration:800});
                }else{
                    _this.cyglData=resp.data.data;
                    }
                }
                })
        },
        // getUser(){
        //     if(this.$route.params.user){ this.user=this.$route.params.user;}else{
        //         this.user={id:localStorage.getItem('userId'),name:localStorage.getItem('userName'),identity:localStorage.getItem('identity')}
        //     }  
        // },
        addNewProject(){
            var _this=this;
             this.$axios.post("/user/getAllUser",{versionId:''}).then(resp => {
            if (resp ) {
              if(resp.data.code!=200){
                  this.$message({"message":resp.data.msg,center: true,showClose:true,type:'error',duration:800});
              }else{
                   _this.userOptions= [ { label: '开发', options: [] }, { label: '测试', options: [] }, { label: '需求', options: []
                    }, { label: '项目经理', options: [] }];
                  for(var i=0;i<resp.data.data.length;i++){
                      for( var j=0;j<_this.userOptions.length;j++){
                           if(resp.data.data[i].identity==_this.userOptions[j].label){
                                _this.userOptions[j].options.push({'label':resp.data.data[i].name,'value':resp.data.data[i].id})
                             }
                      }
                  }
                  console.log( _this.userOptions)
                 }
               }
            })
            _this.addProjectDialog=true;
        },
        submitAdd(){
            var _this=this;
             _this.adding=true;
              this.$axios.post("/user/addProject",{userId:_this.user.id, pName:_this.addProjectForm.pName, dec:_this.addProjectForm.dec, 
              vName:_this.addProjectForm.vName, team:JSON.stringify(_this.addProjectForm.team) }).then(resp => {
            if (resp ) {
              if(resp.data.code!=200){
                  this.$message({"message":resp.data.msg,center: true,showClose:true,type:'error',duration:800});
              }else{
                   _this.initData();
                    _this.addProjectForm={ pName:'', dec:'', vName:'', team:[], },
                    _this.adding=false;
                    _this.addProjectDialog=false;
                 }
               }
            })
        },
        detil(val){
            var _this=this;
            this.$axios.post("/user/projectDetil",{pId:val.id}).then(resp => {
            if (resp ) {
              if(resp.data.code!=200){
                  this.$message({"message":resp.data.msg,center: true,showClose:true,type:'error',duration:800});
              }else{
                  _this.detilVData=resp.data.data.versionlist;
                  _this.detilTData= resp.data.data.teamlist;
                  _this.detilDialog=true;
                 }
               }
            })
        },
        toNewVersion(val){
          var _this=this;
             this.$axios.post("/user/getAllUser",{versionId:''}).then(resp => {
            if (resp ) {
              if(resp.data.code!=200){
                  this.$message({"message":resp.data.msg,center: true,showClose:true,type:'error',duration:800});
              }else{
                  _this.pId=val.id;
                   _this.pName=val.name;
                   _this.userOptions= [ { label: '开发', options: [] }, { label: '测试', options: [] }, { label: '需求', options: []
                    }, { label: '项目经理', options: [] }];
                  for(var i=0;i<resp.data.data.length;i++){
                      for( var j=0;j<_this.userOptions.length;j++){
                           if(resp.data.data[i].identity==_this.userOptions[j].label){
                                _this.userOptions[j].options.push({'label':resp.data.data[i].name,'value':resp.data.data[i].id})
                             }
                      }
                  }
                  _this.getAllUserByPId(val.id)
                 }
               }
            })
           _this.toNewVersionDialog=true;
        },
        getAllUserByPId(val){
            var vvvv=[];
            vvvv.push("a","b","c")
            console.log(vvvv)
            console.log(this.addVForm.team)
          var _this=this;
          this.$axios.post("/user/getAllUserByPId",{pId:val}).then(resp => {
            if (resp ) {
              if(resp.data.code!=200){
                  this.$message({"message":resp.data.msg,center: true,showClose:true,type:'error',duration:800});
              }else{
                   _this.addVForm.team=[];
                  for(var i=0;i<resp.data.data.length;i++){
                       _this.addVForm.team.push(resp.data.data[i].id);
                  }
                 }
               }
            })
        },
        submitAddV(){
            var _this=this;
          this.$axios.post("/user/toNewVersion",{pId:_this.pId}).then(resp => {
            if (resp ) {
              if(resp.data.code!=200){
                  this.$message({"message":resp.data.msg,center: true,showClose:true,type:'error',duration:800});
              }else{
                  if(resp.data.data.length==0){
                    _this. toNewVersionUserDialog2=true;
                  }else{
                    _this.versionWorkData=resp.data.data;
                    _this.toNewVersionUserDialog=true;
                  }
                 }
               }
            })
        },
        submitNewV(){
            var _this=this;
            this.$axios.post("/user/addversion",{vName:_this.addVForm.vName,team:JSON.stringify(_this.addVForm.team),pId:_this.pId,createUserId:_this.user.id}).then(resp => {
            if (resp ) {
              if(resp.data.code!=200){
                  this.$message({"message":resp.data.msg,center: true,showClose:true,type:'error',duration:800});
              }else{
                   _this.addVForm={vName:'',team:[],};
                    _this.initData();
                    _this.toNewVersionDialog=false;
                    _this.toNewVersionUserDialog=false;
                    _this.toNewVersionUserDialog2=false;
                   
                 }
               }
            })
        },
        handleClose(){
               this.addVForm.vName='';
                this.toNewVersionDialog=false;
        },
        clsoeProject(val ){
            var _this=this
            this.$confirm('确认关闭？')
          .then(_ => {
            this.$axios.post("/user/closeP",{userId:_this.user.id,pId:val.id}).then(resp => {
                if (resp ) {
                if(resp.data.code!=200){
                    this.$message({"message":resp.data.msg,center: true,showClose:true,type:'error',duration:800});
                }else{
                    _this.initData();
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
     this.getUser();
     this.initData();
   
   }
}
</script>
<style scoped>

</style>
