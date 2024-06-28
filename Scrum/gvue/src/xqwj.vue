<template>
    <div id="xqwj">
        <router-view></router-view>
        <el-row class="xqwj-top">
            <el-col :span="23" class="xqwj-top-left global-bk2">
                <el-row>
                     <el-col :span="10" class="xqwj-select">
                        选择项目：
                        <el-select id="projectSelect" v-model="value" @change="projectChange" filterable clearable placeholder="请选择项目,可输入查找">
                        <el-option v-for="item in options" :key="item.value" :label="item.label" :value="item.value"> </el-option> 
                    </el-select>
                    </el-col>
                     <el-col :span="8" class="xqwj-upload" >
                      <el-upload v-if="user.identity==2||user.identity==1" class="upload-demo" drag  action="https://jsonplaceholder.typicode.com/posts/" :show-file-list="false" multiple :before-upload="beforeUpload">
                            <i class="el-icon-upload"></i>
                            <div class="el-upload__text">将文件拖到此处，或<em>点击上传</em></div>
                        </el-upload>
                    </el-col>
                </el-row>
                
            </el-col>
        </el-row>
         <el-row class="xqwj-center">
            <el-col :span="23" class="xqwj-top-left global-bk2" >
                 <el-col :span="23" >
               
                <el-table :data="fileData" height="500"  empty-text="暂无需求文件"class="xqwj-table" :header-cell-style="{'border-bottom': '1px solid #2197F1'}">
                 <el-table-column  align="center" prop="id" label="id"  width="0" v-if="false" sortable> </el-table-column>
                <el-table-column  align="center" prop="name" label="文件名"  width="375"  sortable> </el-table-column>
                <el-table-column  align="center" prop="userName" label="上传人"  width="175"  sortable> </el-table-column>
                 <el-table-column  align="center" prop="createtime" label="上传时间"  width="175"  sortable> </el-table-column>
                 <el-table-column  align="center" prop="vName" label="上传版本号"  width="175"  sortable> </el-table-column>
                <el-table-column align="center"  label="操作" width="200">
                        <template slot-scope="scope">
                            <el-button @click="download(scope.row.id,scope.row.name)" type="text" size="small">下载</el-button>
                        </template>
                     </el-table-column>
            </el-table>
             </el-col>
            </el-col>
        </el-row>
     </div>
</template>
<script>
import axios from 'axios'

import"./assets/css/xqwj.css"
export default {
  name:'xqwj',
  data(){
      return{
          visible: false,
          loading: null,
          userId:'',
          projectSelectValue:'',
          versionSelectValue:'',
          user:{},
          options:[],
          value:'',
          fileList: [], // 用来存放上传的文件
          experiment: { file: '', },
          fileData:[],
      }
  },
 methods:{
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
    projectChange(){
        var _this=this;
        this.$axios.post("/user/getFlieByUV",{vId:this.value,uId:this.user.id,type:1}).then(resp => {
            if (resp ) {
              if(resp.data.code!=200){
                  this.$message({"message":resp.data.msg,center: true,showClose:true,type:'error',duration:800});
              }else{
                  _this.fileData=resp.data.data;
                 
                 }
               }
            })
    }, 
    beforeUpload(file){
        if (this.value==""){
        this.$message.error("请先选择项目");
        return false;
        }
        const imgData= { accept: 'image/gif,image/jpeg,image/png,image/jpg,application/msword,application/vnd.ms-excel,text/plain,application/vnd.openxmlformats-officedocument.wordprocessingml.document'};
        let isJPG = true;
        if(imgData.accept.indexOf(file.type) == -1){
            isJPG = false;
        }
        const isLt2M = file.size / 1024 /1024 < 10;
        if(!isJPG){
        this.$message.error('请上传图片/文档/表格/文本格式!');
        return false;
        }
        if (!isLt2M){
        this.$message.error("上传文件大小不能超过 10MB!");
        return false;
        }
        let formData  = new FormData()
        formData .append('file', file)
        var date = new Date();

        formData .append('vId', this.value)
        formData .append('type',"1")
        formData .append('uId',this.user.id)
        this.fullScreenLoading()
        this.$axios.post("/user/upload",formData  ).then((res) =>{
        setTimeout(() => {
          		this.loading.close();
          		if (res.code == 201) {
          			this.$message.error(res.data.msg)
          		}else{
                      this.projectChange()
          			this.$message.success(res.data.msg)
          		}
        		}, 1000);
        })
        return isJPG && isLt2M;
    },
      	uploadFileErrorHandler(res){
      		this.$message.error("上传失败,请检查网络连接")
      	},
      	uploadFileOnProgressHandler(res){
      		// this.$message("上传中...")
      	},
      	fullScreenLoading() {
        	this.loading = this.$loading({
		          lock: true,
		          text: '文件上传中...',
		          spinner: 'el-icon-loading',
		          background: 'rgba(0, 0, 0, 0.7)'
        		});
          },
          download(id, name) {
            this.$axios.get("/user/download/fileId/" + id, {
                responseType: 'blob'
            }).then(function(response) {
                const content = response.data;
                const blob= new Blob([content]);
                if ('download' in document.createElement('a')) {
                    // 非IE下载
                    const elink = document.createElement('a');
                    elink.download = name;
                    elink.style.display = 'none';
                    elink.href = URL.createObjectURL(blob);
                    document.body.appendChild(elink);
                    elink.click();
                    // 释放URL对象
                    URL.revokeObjectURL(elink.href);
                    document.body.removeChild(elink);
                } else {
                    navigator.msSaveBlob(blob, name)
                }
            }, function(err) {
            })
	    }
    
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
