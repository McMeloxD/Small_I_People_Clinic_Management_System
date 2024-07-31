<template>
  <div class="app">
    <h1 align="center" style="color: #3b3939">修改密码</h1>
    <el-form ref="form" :model="form"  :rules="rules" label-width="80px" >
      <el-form-item label="旧密码" style="width: 750px" prop="oldpwd">
        <el-input type="password"  v-model="form.oldpwd"></el-input>
      </el-form-item>
      <el-form-item label="新密码" style="width: 750px" prop="newpwd">
        <el-input type="password" v-model="form.newpwd"></el-input>
      </el-form-item>
      <el-form-item label="确认密码" style="width: 750px" prop="newpwd2">
        <el-input type="password" v-model="form.newpwd2"></el-input>
      </el-form-item>

      <div align="center">
        <el-form-item>
          <el-button type="primary" @click="save('form')">保存</el-button>
          <el-button @click="toHome">返回</el-button>
        </el-form-item>
      </div>
    </el-form>
  </div>
</template>

<script>


import { editPwd  } from '@/api/user'

export default {
  name: 'editpwd',
  data() {
    return {
      loading: true,
      form: {
        oldpwd:'',
        newpwd:'',
        newpwd2:''
      },
      username: this.$store.getters.name,
      rules: {
        oldpwd: [
          { required: true, message: '密码不能为空', trigger: 'blur' }
        ],
        newpwd: [
          { required: true, message: '密码不能为空', trigger: 'blur' }
        ],
        newpwd2: [
          { required: true, message: '密码不能为空', trigger: 'blur' }
        ],
      }
    }
  },
  methods: {
    toHome() {
      this.$router.push({ path: '/' })
    },
    // 去修改
    save(forName) {
      if (this.form.newpwd == this.form.newpwd2){
      this.$refs[forName].validate((valid) => {
        if (valid) {
          this.loading = true
          let editInfo = {
            username : this.username,
            oldPwd : this.form.oldpwd,
            newPwd : this.form.newpwd
          }
          editPwd(editInfo).then(async(res) => {
              if (res.code == 20000) {
                this.$message({
                  type: 'success',
                  message: res.msg,
                  duration: 1000
                })
                // 强制退出重新登录
                await this.$store.dispatch('user/logout')
                this.$router.push(`/login?redirect=${this.$route.fullPath}`)
              } else {
                this.$message({
                  type: 'error',
                  message: '保存失败',
                  duration: 1000
                })
              }
            })
        } else {
          return false
        }
      })
      }else {
        this.$message({
          type: 'error',
          message: '两次密码不一致!',
          duration: 1000
        })
      }
    },
  },
  created() {
    this.fetchData()
  }

}
</script>

<style>
body {
  background: rgb(246, 246, 246);
}

.app {
  width: 800px;
  height: 600px;
  margin: 20px auto;
  background: white;
  padding-top: 10px;
  box-shadow: 0 0 5px 0 rgba(219, 217, 217, 0.75);
}
</style>
