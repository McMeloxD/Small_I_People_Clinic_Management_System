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
      <el-form-item label="科室名称" prop="departmentsName">
        <el-input v-model="keyword.departmentsName" size="small" placeholder="科室名称" />
      </el-form-item>
      <el-form-item>
        <el-button type="primary" size="small" @click="search" icon="el-icon-zoom-in">查询</el-button>
      </el-form-item>
    </el-form>
  <!--主体表格 -->
  <el-table v-loading="loading" :data="departmentsList"  >
    <el-table-column prop="departmentsId" label="序号" width="100"/>
    <el-table-column prop="departmentsIdCard" label="编号" width="100"/>
    <el-table-column prop="departmentsName" label="科室名称" width="100"/>
    <el-table-column prop="departmentsText" label="科室简介" width="500"/>
    <el-table-column prop="departmentsCreateTime" label="创建时间" width="200"/>
    <el-table-column prop="departmentsCreateBy" label="创建人员" width="100"/>
    <el-table-column prop="departmentsStatus" label="部门状态" width="100">
    </el-table-column>
    <el-table-column label="操作" align="center" class-name="small-padding fixed-width" width="140">
      <template slot-scope="scope">
        <el-button size="mini" type="text" icon="el-icon-edit" @click="openEditDialog(scope.$index,scope.row)">编辑</el-button>
        <el-button size="mini" type="text" icon="el-icon-delete" @click="handleDelete(scope.$index,scope.row)">删除</el-button>
      </template>
    </el-table-column>
  </el-table>
    <!--添加/编辑-->
    <el-dialog :title="title" :visible.sync="addeditdepartments" width="28%">
      <el-form ref="departmentsRulesForm" :model="departments" :rules="departmentsRules">
        <el-form-item label="编号" prop="employeesIdCard" label-width="100px" key="1" >
          <el-input v-model="departments.departmentsIdCard" autocomplete="off"  style="width: 200px" />
        </el-form-item>>
        <el-form-item label="科室名称" prop="departmentsName" label-width="100px" key="2">
          <el-input v-model="departments.departmentsName" autocomplete="off" style="width: 200px" />
        </el-form-item>
        <el-form-item label="科室简介">
          <el-input type="textarea" v-model="departments.departmentsText"></el-input>
        </el-form-item>
        <el-form-item label="创建时间" prop="departmentsCreateTime" label-width="100px">
          <el-col :span="11">
            <el-date-picker type="date" placeholder="选择日期" v-model="departments.departmentsCreateTime" style="width: 100%;"/>
          </el-col>
          <el-col class="line" :span="2">-</el-col>
          <el-col :span="11">
            <el-time-picker placeholder="选择时间" v-model="departments.departmentsCreateTime" style="width: 100%;"></el-time-picker>
          </el-col>
        </el-form-item>
        <el-form-item label="创建人员" prop="departmentsCreateBy" label-width="100px">
          <el-input v-model="departments.departmentsCreateBy" autocomplete="off" style="width: 200px" />
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button @click="cancelAddDepartments('measureRulesForm')">取 消</el-button>
        <el-button type="primary" @click="addYDepartments('measureRulesForm')">提交</el-button>
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
  import { addDepartments, deleteById, editDepartments, getDepartmentsList } from '@/api/depart'

  export default {
    data(){
      return {
        departmentsList: [],
        loading: true,
        addeditdepartments: false,
        pageNum: 1,
        pageSize: 10,
        total: 0,
        currentPage: 1,
        keyword : {
          departmentsName: null
        },
        title: '',
        departments: {
          departmentsId: null,
          departmentsIdCard: null,
          departmentsName: null,
          departmentsText: null,
          departmentsCreateTime: null,
          departmentsCreateBy: null,
          departmentsStatus: null
        },
        departmentsRules: {
          departmentsIdCard: [{ required: true, message: '科室编号不能为空', trigger: 'blur' }],
          departmentsName: [{ required: true, message: '科室名称不能为空', trigger: 'blur' }],
          departmentsText: [{ required: true, message: '科室简介不能为空', trigger: 'blur' }],
          departmentsCreateTime: [{ required: true, message: '创建时间不能为空', trigger: 'blur'}],
          departmentsCreateBy: [{ required: true, message: '创建人员不能为空', trigger: 'blur' }],
          departmentsStatus: [{ required: true, message: '科室状态不能为空', trigger: 'blur' }]
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
          departmentsName: this.keyword.departmentsName
        }
        getDepartmentsList(params).then(res => {
          let pageInfo = res.data
          console.log(pageInfo)
          this.loading = false
          this.departmentsList = pageInfo.list
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
            departmentsIdCard: row.departmentsIdCard
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

      // 弹出添加科室对话框
      openAddDialog() {
        this.title = '添加科室信息'
        this.addeditdepartments = true
        this.departments = {
          departmentsId: null,
          departmentsIdCard: null,
          departmentsName: null,
          departmentsText: null,
          departmentsCreateTime: null,
          departmentsCreateBy: null,
          departmentsStatus: null
        }
      },
      // 弹出修改科室对话框
      openEditDialog(index, row) {
        this.addeditdepartments = true
        this.title = '修改科室信息'
        this.departments = row
      },
      // 关闭添加科室对话框
      cancelAddDepartments(formName) {
        this.addfamily = false
        this.$refs[formName].resetFields()
      },
      // 添加/修改科室信息
      addYDepartments() {
        this.$refs.departmentsRulesForm.validate((valid) => {
          console.log('departments:', this.departments)
          if (valid) {
            if (this.title === '添加科室信息') {
              addDepartments(this.departments).then(res => {
                console.log(res)
                this.$message({
                  message: '添加成功',
                 type: 'success'
                })
                this.fetchData()
                this.$refs.departmentsRulesForm.resetFields()
                this.addeditdepartments = false
              })
            } else if (this.title === '修改科室信息') {
              editDepartments(this.departments).then(res => {
                console.log(res)
                this.$message({
                  message: '修改成功',
                  type: 'success'
                })
                this.fetchData()
                this.$refs.departmentsRulesForm.resetFields()
                this.addeditdepartments = false
              })
            }
          }
        })
      },
      // 跳转员工页面
      opeenemploy(){
        this.$router.push({ path: '/setting/employees' })
      },
      // 跳转角色页面
      oppenrole(){
        this.$router.push({ path: '/setting/roles' })
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
