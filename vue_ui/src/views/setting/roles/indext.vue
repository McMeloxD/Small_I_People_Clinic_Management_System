<template>
  <div>
    <el-card class="card1">
      <div>
        <el-button type="primary" plain @click="opeenemploy">员工列表</el-button>
        <el-button type="primary" plain @click="opeendepart">科室列表</el-button>
        <el-button type="primary" plain @click="oppenrole">角色列表</el-button>
        <el-button type="success" id="tj" icon="el-icon-plus" @click="openAddDialog">添加</el-button>
      </div>
      <hr/>
      <!--搜索框-->
      <el-form :inline="true" :model="keyword" class="demo-form-inline">
        <el-form-item label="角色名称" prop="departmentsName">
          <el-input v-model="keyword.rolesName" size="small" placeholder="角色名称" />
        </el-form-item>
        <el-form-item>
          <el-button type="primary" size="small" @click="search" icon="el-icon-zoom-in">查询</el-button>
        </el-form-item>
      </el-form>
      <!--主体表格 -->
      <el-table v-loading="loading" :data="rolesList"  >
        <el-table-column prop="rolesId" label="序号" width="100"/>
        <el-table-column prop="rolesIdCard" label="编号" width="100"/>
        <el-table-column prop="rolesName" label="角色名称" width="100"/>
        <el-table-column prop="rolesText" label="角色简介" width="500"/>
        <el-table-column prop="rolesCreateTime" label="创建时间" width="200"/>
        <el-table-column prop="rolesCreateBy" label="创建人员" width="100"/>
        <el-table-column prop="rolesStatus" label="角色状态" width="100">
        </el-table-column>
        <el-table-column label="操作" align="center" class-name="small-padding fixed-width" width="140">
          <template slot-scope="scope">
            <el-button size="mini" type="text" icon="el-icon-edit" @click="openEditDialog(scope.$index,scope.row)">编辑</el-button>
            <el-button size="mini" type="text" icon="el-icon-delete" @click="handleDelete(scope.$index,scope.row)">删除</el-button>
          </template>
        </el-table-column>
      </el-table>
      <!--添加/编辑-->
      <el-dialog :title="title" :visible.sync="addeditroles" width="28%">
        <el-form ref="rolesRulesForm" :model="roles" :rules="rolesRules">
          <el-form-item label="编号" prop="rolesIdCard" label-width="100px" key="1" >
            <el-input v-model="roles.rolesIdCard" autocomplete="off"  style="width: 200px" />
          </el-form-item>
          <el-form-item label="角色名称" prop="departmentsName" label-width="100px" key="2">
            <el-input v-model="roles.rolesName" autocomplete="off" style="width: 200px" />
          </el-form-item>
          <el-form-item label="角色简介">
            <el-input type="textarea" v-model="roles.rolesText"></el-input>
          </el-form-item>
          <el-form-item label="创建时间" prop="rolesCreateTime" label-width="100px">
            <el-col :span="11">
              <el-date-picker type="date" placeholder="选择日期" v-model="roles.rolesCreateTime" style="width: 100%;" value-format="yyyy-MM-dd"/>
            </el-col>
          </el-form-item>
          <el-form-item label="创建人员" prop="rolesCreateBy" label-width="100px">
            <el-input v-model="roles.rolesCreateBy" autocomplete="off" style="width: 200px" />
          </el-form-item>
        </el-form>
        <div slot="footer" class="dialog-footer">
          <el-button @click="cancelAddRoles('measureRulesForm')">取 消</el-button>
          <el-button type="primary" @click="addYRoles('measureRulesForm')">提交</el-button>
        </div>
      </el-dialog>
      <el-pagination
        :current-page="currentPage"
        :page-sizes="[5,10,20]"
        :page-size="100"
        layout="total, sizes, prev, pager, next, jumper"
        :total="total"
        @size-change="handleSizeChange"
        @current-change="handleCurrentChange"
      />
    </el-card>
  </div>
</template>

<script>

  import { addRoles, editRoles, getRolesList, deleteById } from '@/api/rol'

  export default {
    data(){
      return {
        rolesList: [],
        loading: true,
        addeditroles: false,
        pageNum: 1,
        pageSize: 10,
        total: 0,
        currentPage: 1,
        keyword : {
          rolesName: null
        },
        title: '',
        roles: {
          rolesId: null,
          rolesIdCard: null,
          rolesName: null,
          rolesText: null,
          rolesCreateTime: null,
          rolesCreateBy: null,
          rolesStatus: null
        },
        rolesRules: {
          rolesIdCard: [{ required: true, message: '科室编号不能为空', trigger: 'blur' }],
          rolesName: [{ required: true, message: '科室名称不能为空', trigger: 'blur' }],
          rolesText: [{ required: true, message: '科室简介不能为空', trigger: 'blur' }],
          rolesCreateTime: [{ required: true, message: '创建时间不能为空', trigger: 'blur'}],
          rolesCreateBy: [{ required: true, message: '创建人员不能为空', trigger: 'blur' }],
          rolesStatus: [{ required: true, message: '科室状态不能为空', trigger: 'blur' }]
        }
      }
    },
    //生命周期函数
    created() {
      this.fetchData()
    },
    methods: {
      fetchData() {
        let params = {
          pageNum: this.pageNum,
          pageSize: this.pageSize,
          rolesName: this.keyword.rolesName
        }
        getRolesList(params).then(res => {
          let pageInfo = res.data
          console.log(pageInfo)
          this.loading = false
          this.rolesList = pageInfo.list
          this.total = pageInfo.total
        })
      },
      // 页面大小改变时触发
      handleSizeChange(val) {
        this.pageSize = val
        this.fetchData()
      },
      // 当前页码改变时触发
      handleCurrentChange(val) {
        this.pageNum = val
        this.fetchData()
      },
      // 模糊查询
      search() {
        this.fetchData()
      },
      // 删除科室信息
      handleDelete(index, row) {
        this.$confirm('是否确认删除科室编号为"' + row.departmentsId + '"的数据项？', '提示', {
          confirmButtonText: '确定',
          cancelButtonText: '取消',
          type: 'warning'
        }).then(() => {
          let params = {
            rolesId: row.rolesId
          }
          deleteById(params).then(res => {
            if (res.code === 20000) {
              this.$message({
                message: '删除成功',
                type: 'success'
              })
              this.fetchData()
            } else {
              this.$message({
                message: '删除失败',
                type: 'error'
              })
            }
          })
        })
      },

      // 弹出添加角色对话框
      openAddDialog() {
        this.title = '添加角色信息'
        this.addeditroles = true
        this.departments = {
          rolesId: null,
          rolesIdCard: null,
          rolesName: null,
          rolesText: null,
          rolesCreateTime: null,
          rolesCreateBy: null,
          rolesStatus: null
        }
      },
      // 弹出修改角色对话框
      openEditDialog(index, row) {
        this.addeditroles = true
        this.title = '修改科室信息'
        this.roles = row
      },
      // 关闭添加角色对话框
      cancelAddRoles(formName) {
        this.addfamily = false
        this.$refs[formName].resetFields()
      },
      // 添加/修改角色信息
      addYRoles() {
        this.$refs.rolesRulesForm.validate((valid) => {
          if (valid) {
            if (this.title === '添加角色信息') {
              addRoles(this.roles).then(res => {
                console.log(res)
                this.$message({
                  message: '添加成功',
                  type: 'success'
                })
                this.fetchData()
                this.$refs.rolesRulesForm.resetFields()
                this.addeditroles = false
              })
            } else if (this.title === '修改科室信息') {
              editRoles(this.roles).then(res => {
                console.log(res)
                this.$message({
                  message: '修改成功',
                  type: 'success'
                })
                this.fetchData()
                this.$refs.rolesRulesForm.resetFields()
                this.addeditroles = false
              })
            }
          }
        })
      },
      // 跳转员工页面
      opeenemploy(){
        this.$router.push({ path: '/setting/employees' })
      },
      // 跳转科室页面
      opeendepart(){
        this.$router.push({ path: '/setting/departments' })
      }
    }
  }
</script>

<style scoped>
  .card1 {
    margin-top: 20px;
    margin-left: 80px;
    margin-right: 80px;
  }
  #tj {
    width: 150px;
    float: right;
  }
</style>
