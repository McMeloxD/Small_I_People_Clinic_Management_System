<template>
  <div class="app">
    <h1 align="center" style="color: #3b3939">个人信息</h1>
    <el-form ref="form" :model="form" label-width="80px">
      <el-form-item label="用户名" style="width: 750px">
        <el-input v-model="form.username"></el-input>
      </el-form-item>
      <el-form-item label="手机号码" style="width: 750px">
        <el-input v-model="form.phonenumber"></el-input>
      </el-form-item>
      <el-form-item label="头像" style="width: 750px">
        <el-col :span="4">
          <el-form-item>
            <el-image
              style="width: 100px; height: 100px"
              :src="this.form.avatar == null?'桶地址'+avatar:'桶地址'+this.form.avatar"
              >
              <div slot="error" class="image-slot">
                <i class="el-icon-loading"></i>
              </div>
            </el-image>
          </el-form-item>
        </el-col>
        <el-col :span="8">
          <el-form-item>
            <el-upload
              class="avatar-uploader"
              action=''
              :http-request="uploadFile"
              :show-file-list="false"
              :on-change="handleChange"
              accept=".jpg,.png"
              >
              <i class="el-icon-plus avatar-uploader-icon"></i>
            </el-upload>
          </el-form-item>
        </el-col>
      </el-form-item>
      <el-form-item label="性别" prop="receptionType">
        <el-radio-group v-model="form.sex">
          <el-radio label="男">男</el-radio>
          <el-radio label="女">女</el-radio>
        </el-radio-group>
      </el-form-item>
      <el-form-item label="最后登录时间" label-width="110px">
        <el-input v-model="form.loginDate" style="width: 640px" disabled></el-input>
      </el-form-item>
      <el-form-item label="最后登录ip" label-width="110px">
        <el-input v-model="form.ipAddress" style="width: 640px" disabled></el-input>
      </el-form-item>
      <el-form-item label="最后登录地址" label-width="110px">
        <el-input v-model="form.address" style="width: 640px" disabled></el-input>
      </el-form-item>
      <div align="center">
        <el-form-item>
          <el-button type="primary" @click="save">保存</el-button>
          <el-button @click="toHome">返回</el-button>
        </el-form-item>
      </div>
    </el-form>
  </div>
</template>

<script>


import { findProfileInfo, saveInfo, upload} from '@/api/user'
import { mapGetters } from 'vuex'

export default {
  name: 'Yourprofile',
  data() {
    return {
      loading: true,
      form: {},
      username: this.$store.getters.name,
      file:null
    }
  },
  methods: {
    toHome() {
      this.$router.push({ path: '/' })
    },
    /** 查询单位列表 */
    fetchData() {
      //组装查询参数
      findProfileInfo({ username: this.username }).then(res => {
        if (res.code == 20000) {
          this.form = res.data
          this.loading = false
        } else {
          this.$message({
            type: 'error',
            message: '查询失败',
            duration: 1000
          })
        }
      })
    },
    // 保存个人信息
    save() {
      this.loading = true
      saveInfo(this.form).then(async(res) => {
        if (res.code == 20000) {
          this.$message({
            type: 'success',
            message: '保存成功~',
            duration: 1000
          })
          // 更改后重新调用登录获取最新token,再调用getinfo设置username和头像
          this.$store.dispatch('user/login', this.form).then((res) => {
            this.$store.dispatch('user/getInfo')
            this.$router.push({ path: this.redirect })
          })
        }
      })
    },
    handleChange(file){
      this.file = file.raw;
    },
    uploadFile(){
      const file = this.file;
      const formData = new FormData();
      formData.append("file", file); // 由后端接口决定,后端参数叫file
      upload(formData).then((res) => {
        this.$message({
          message: "上传成功",
          type: "success",
        });
        // 替换当前显示头像
        this.form.avatar = res.data
      });
    }
  },
  created() {
    this.fetchData()
  },
  computed: {
    ...mapGetters([
      'avatar'
    ])
  },

}
</script>

<style>
body {
  background: rgb(246, 246, 246);
}

.app {
  width: 800px;
  height: 700px;
  margin: 20px auto;
  background: white;
  padding-top: 10px;
  box-shadow: 0 0 5px 0 rgba(219, 217, 217, 0.75);
}

.avatar-uploader .el-upload {
  border: 1px dashed #423f3f;
  border-radius: 6px;
  cursor: pointer;
  position: relative;
  overflow: hidden;
  font-size: 28px;
  color: #8c939d;
  width: 100px;
  height: 100px;
  line-height: 100px;
  text-align: center;
}

</style>
