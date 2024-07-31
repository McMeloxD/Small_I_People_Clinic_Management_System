<template>
<div>
  <el-card class="card1">
    <div>
      <el-button type="primary" plain>员工列表</el-button>
      <el-button type="primary" plain @click="opeendepart">科室列表</el-button>
      <el-button type="primary" plain @click="oppenrole">角色列表</el-button>
      <el-button type="primary" plain @click="oppenTuxEmployees">统计图</el-button>
      <el-button type="success" id="tj" icon="el-icon-plus" @click="openAddDialog">添加</el-button>
    </div>
    <hr/>
    <!--搜索框-->
    <el-form :inline="true" :model="keyword" class="demo-form-inline" ref="searchForm">
      <el-form-item label="所属科室" prop="departmentsName">
        <el-select v-model="keyword.departmentsName" placeholder="全科">
          <el-option label="全科" value="全科"/>
          <el-option label="外科" value="外科"/>
          <el-option label="内科" value="内科"/>
        </el-select>
      </el-form-item>
      <el-form-item label="员工姓名" prop="patientName">
        <el-input v-model="keyword.employeesName" size="small" placeholder="员工姓名" />
      </el-form-item>
      <el-form-item>
        <el-button type="primary" size="small" @click="search" icon="el-icon-zoom-in">查询</el-button>
      </el-form-item>
    </el-form>
  <!--主体表格 -->

  <el-table v-loading="loading" :data="employeesList"  >
    <el-table-column prop="employeesId" label="序号" width="80"/>
    <el-table-column prop="employeesIdCard" label="工号" width="100"/>
    <el-table-column prop="employeesName" label="员工姓名" width="100"/>
    <el-table-column prop="employeesSex" label="员工性别" width="100">
      <template slot-scope="scope">
        <el-tag :type="scope.row.employeesSex === '1'?'':'danger'">
          <span>{{ scope.row.employeesSex === '1'?'男':'女' }}</span></el-tag>
      </template>
    </el-table-column>
    <el-table-column prop="employeesAge" label="员工年龄" width="100"/>
    <el-table-column prop="employeesPhone" label="联系电话" width="140"/>
    <el-table-column prop="employeesClinic" label="所属门诊" width="110"/>
    <el-table-column prop="departmentsName" label="科室名称" width="110"/>
    <el-table-column prop="roleName" label="角色名称" width="110"/>
    <el-table-column prop="employeesCreateTime" label="创建时间" width="150"/>
    <el-table-column prop="employeesBy" label="创建人员" width="80"/>
    <el-table-column label="操作" align="center" class-name="small-padding fixed-width" width="140">
      <template slot-scope="scope">
        <el-button size="mini" type="text" icon="el-icon-edit" @click="openEditDialog(scope.$index,scope.row)">编辑</el-button>
        <el-button size="mini" type="text" icon="el-icon-delete" @click="handleDelete(scope.$index,scope.row)">删除</el-button>
      </template>
    </el-table-column>
  </el-table>
    <!--添加/编辑-->
    <el-dialog :title="title" :visible.sync="addeditemployees" width="28%">
      <el-form ref="employeesRulesForm" :model="employees" :rules="employeesRules">
        <el-form-item label="员工工号" prop="employeesIdCard" label-width="100px" key="1" >
          <el-input v-model="employees.employeesIdCard" autocomplete="off"  style="width: 200px" />
        </el-form-item>>
        <el-form-item label="姓名" prop="employeesName" label-width="100px" key="2">
          <el-input v-model="employees.employeesName" autocomplete="off" style="width: 200px" />
        </el-form-item>

        <el-form-item label="性别" prop="employeesSex" label-width="110px">
          <el-radio-group v-model="employees.employeesSex">
            <el-radio label="1">男</el-radio>
            <el-radio label="2">女</el-radio>
          </el-radio-group>
        </el-form-item>
        <el-form-item label="年龄" prop="employeesAge" label-width="100px">
          <el-input v-model="employees.employeesAge" autocomplete="off" style="width: 200px" />
        </el-form-item>
        <el-form-item label="联系电话" prop="employeesPhone" label-width="100px">
          <el-input v-model="employees.employeesPhone" autocomplete="off" style="width: 200px" />
        </el-form-item>
        <el-form-item label="所属门诊" prop="employeesClinic" label-width="100px">
          <el-input v-model="employees.employeesClinic" autocomplete="off" style="width: 200px" />
        </el-form-item>
        <el-form-item label="科室名称" prop="departmentsName" label-width="100px">
          <el-input v-model="employees.departmentsName" autocomplete="off" style="width: 200px" />
        </el-form-item>
        <el-form-item label="角色名称" prop="roleName" label-width="100px">
          <el-input v-model="employees.roleName" autocomplete="off" style="width: 200px" />
        </el-form-item>
        <el-form-item label="创建时间" prop="employeesCreateTime" label-width="100px">
          <el-col :span="11">
            <el-date-picker type="date" placeholder="选择日期" v-model="employees.employeesCreateTime" style="width: 100%;"/>
          </el-col>
          <el-col class="line" :span="2">-</el-col>
          <el-col :span="11">
            <el-time-picker placeholder="选择时间" v-model="employees.employeesCreateTime" style="width: 100%;"></el-time-picker>
          </el-col>
        </el-form-item>
        <el-form-item label="创建人员" prop="employeesBy" label-width="100px">
          <el-input v-model="employees.employeesBy" autocomplete="off" style="width: 200px" />
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button @click="cancelAddEmployees('measureRulesForm')">取 消</el-button>
        <el-button type="primary" @click="addYEmployees('measureRulesForm')">提交</el-button>
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
  import { getEmployeesList, deleteById, addEmployees, editEmployees } from '@/api/setup'


  export default {
    data() {
      return {
        loading: true,
        employeesList: [],
        currentPage: 1,
        pageNum: 1,
        pageSize: 5,
        total: 0,
        title: '',
        addeditemployees: false,
        employees: {
          employeesId: null,
          employeesIdCard: null,
          employeesName: null,
          employeesSex: null,
          employeesAge: null,
          employeesPhone: null,
          employeesClinic: null,
          departmentsName: null,
          roleName: null,
          employeesCreateTime: null,
          employeesBy: null,
        },
        employeesRules: {
          employeesIdCard: [{ required: true, message: '员工工号不能为空', trigger: 'blur' }],
          employeesName: [{ required: true, message: '员工姓名不能为空', trigger: 'blur' }],
          employeesSex: [{ required: true, message: '员工性别不能为空', trigger: 'blur' }],
          employeesAge: [{ required: true, message: '员工年龄不能为空', trigger: 'blur' }],
          employeesPhone: [{ required: true, message: '联系电话不能为空', trigger: 'blur' }],
          employeesClinic: [{ required: true, message: '所属门诊不能为空', trigger: 'blur' }],
          departmentsName: [{ required: true, message: '科室名称不能为空', trigger: 'blur' }]
        },
        keyword : {
          employeesName: null,
          departmentsName: null
        }
      }
    },
    created() {
      this.fetchData()
    },
    methods: {
      fetchData() {
        let params = {
          employeesName: this.keyword.employeesName,
          departmentsName: this.keyword.departmentsName,
          pageNum: this.pageNum,
          pageSize: this.pageSize
        }
        getEmployeesList(params).then(res => {
          let pageInfo = res.data
          console.log(pageInfo)
          this.loading = false
          this.employeesList = pageInfo.list
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
      // 重置表单
      resetSearchForm(formName) {
        this.$refs[formName].resetFields()
        this.fetchData()
      },
      // 删除
      handleDelete(index, row) {
        this.$confirm('是否确认删除用户编号为"' + row.employeesId + '"的数据项？', '提示', {
          confirmButtonText: '确定',
          cancelButtonText: '取消',
          type: 'warning'
        }).then(() => {
          let params = {
            employeesId: row.employeesId
          }
          deleteById(params).then(res => {
            console.log(row.employeesId)
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
      // 弹出添加患者家庭关系对话框
      openAddDialog() {
        this.addeditemployees = true
        this.title = '添加员工信息'
        this.employees = {
          employeesId: null,
          employeesIdCard: null,
          employeesName: null,
          employeesSex: null,
          employeesAge: null,
          employeesPhone: null,
          employeesClinic: null,
          departmentsName: null,
          roleName: null,
          employeesCreateTime: null,
          employeesBy: null,
        }
      },
      // 弹出修改患者家庭关系对话框
      openEditDialog(index, row) {
        this.addeditemployees = true
        this.title = '修改员工信息'
        this.employees = row
        this.employeesId = row.employeesId
        console.log(row)
      },
      // 关闭添加患者家庭关系对话框
      cancelAddEmployees(formName) {
        this.addfamily = false
        this.$refs[formName].resetFields()
      },
      // 添加/修改患者家庭关系
      addYEmployees() {
        this.$refs.employeesRulesForm.validate((valid) => {
          console.log('employees:', this.employees)
          if (valid) {
            if (this.title === '添加员工信息') {
              addEmployees(this.employees).then(res => {
                console.log(res)
                this.$message({
                  message: '添加成功',
                  type: 'success'
                })
                this.fetchData()
                this.$refs.employeesRulesForm.resetFields()
                this.addeditemployees = false
              })
            } else if (this.title === '修改员工信息') {
              editEmployees(this.employees).then(res => {
                console.log(res)
                  this.$message({
                    message: '修改成功',
                    type: 'success'
                  })
                this.fetchData()
                this.$refs.employeesRulesForm.resetFields()
                this.addeditemployees = false
              })
            }
          }
        })
      },
      // 跳转科室页面
      opeendepart(){
        this.$router.push({ path: '/setting/departments' })
      },
      // 跳转角色页面
      oppenrole(){
        this.$router.push({ path: '/setting/roles' })
      },
      // 打开统计图
      oppenTuxEmployees(){
       this.$router.push({ path: '/setting/txEmployees' })
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
