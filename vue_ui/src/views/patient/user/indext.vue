<template>
<div>
  <el-card class="box-card">
    <div class="an">
    <el-button type="primary" icon="el-icon-plus" @click="openAddDialog">增加患者</el-button>
      <el-button type="warning" icon="el-icon-s-promotion">导出</el-button>
    </div>
    <!--搜索框-->
    <el-form :inline="true" :model="keyword" class="demo-form-inline" ref="searchForm">
      <el-form-item label="患者编码" prop="patientNum">
        <el-input v-model="keyword.patientNum" size="small" placeholder="患者编码" />
      </el-form-item>
      <el-form-item label="患者姓名" prop="patientName">
        <el-input v-model="keyword.patientName" size="small" placeholder="患者姓名" />
      </el-form-item>
      <el-form-item>
        <el-button type="primary" size="small" @click="search" icon="el-icon-zoom-in">查询</el-button>
        <el-button type="primary" size="small"  icon="el-icon-orange" @click="toFamily">关系</el-button>
        <el-button type="primary" plain size="small" @click="resetSearchForm('searchForm')" icon="el-icon-refresh">重置</el-button>
      </el-form-item>
    </el-form>
  <!--   表格 -->
  <el-table v-loading="loading" :data="patientList" @selection-change="handleSelectionChange">
    <el-table-column type="selection" width="55" align="center" />
    <el-table-column label="序号" align="center" prop="id" />
    <el-table-column label="患者编码" align="center" prop="patientNum" />
    <el-table-column label="患者姓名" align="center" prop="patientName" />
    <el-table-column label="性别" align="center" prop="sex" >
      <template slot-scope="scope">
        <el-tag :type="scope.row.patientSex === '1'?'':'danger'">
          <span>{{ scope.row.patientSex === '1'?'男':'女' }}</span></el-tag>
      </template>
    </el-table-column>
    <el-table-column label="年龄" align="center" prop="patientAge" />
    <el-table-column label="手机号码" align="center" prop="patientPhone" />
    <el-table-column label="操作人员" align="center" prop="operator" >admin</el-table-column>
    <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
      <template slot-scope="scope">
        <el-button size="mini" type="text" icon="el-icon-edit" @click="openEditDialog(scope.$index,scope.row)"
        >修改</el-button>

        <el-button
          size="mini"
          type="text"
          icon="el-icon-delete"
          @click="handleDelete(scope.$index,scope.row)"
        >删除</el-button>
      </template>
    </el-table-column>
  </el-table>
    <el-pagination
      :current-page="currentPage"
      :page-sizes="[5, 10, 20]"
      :page-size="100"
      layout="total, sizes, prev, pager, next, jumper"
      :total="total"
      @size-change="handleSizeChange"
      @current-change="handleCurrentChange"
    />
  </el-card>
    <!--添加-->
    <el-dialog :title="title" :visible.sync="addpatient" width="28%">
      <el-form ref="patientRulesForm" :model="patient" :rules="patientRules">
        <el-form-item label="患者编码" prop="patientNum" label-width="100px" key="1" >
          <el-input v-model="patient.patientNum" autocomplete="off" style="width: 200px" />
        </el-form-item>
        <el-form-item label="患者姓名" prop="patientName" label-width="100px" key="2">
          <el-input v-model="patient.patientName" autocomplete="off" style="width: 200px" />
        </el-form-item>
        <el-form-item label="性别" prop="patientSex" label-width="110px" key="3">
          <el-radio-group v-model="patient.patientSex">
            <el-radio label="1">男</el-radio>
            <el-radio label="2">女</el-radio>
          </el-radio-group>
        </el-form-item>
        <el-form-item label="年龄" prop="patientAge" label-width="100px">
          <el-input v-model="patient.patientAge" autocomplete="off" style="width: 200px" />
        </el-form-item>
        <el-form-item label="身份证号码" prop="patientIdCard" label-width="100px">
          <el-input v-model="patient.patientIdCard" autocomplete="off" style="width: 200px" />
        </el-form-item>
        <el-form-item label="手机号" prop="patientPhone" label-width="100px">
          <el-input v-model="patient.patientPhone" autocomplete="off" style="width: 200px" />
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button @click="cancelAddPatient('measureRulesForm')">取 消</el-button>
        <el-button type="primary" @click="addYPatient('measureRulesForm')">提交</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
  import { addPatient, deleteById, editPatient, getpList } from '@/api/pat'


  export default {
    data() {
      return {
        // 遮罩层
        loading: true,
        // 单位表格数据
        patientList: [],
        // 存储主单位数据
        primaryUnitList: [],
        // 分页的数量
        pageNum: 1,
        // 每页的大小
        pageSize: 5,
        currentPage: 1,
        addpatient: false,
        total: 0,
        title: '',
        keyword: {
          patientNum: null,
          patientName: null
        },
       patient: {
          patientNum: null,
          patientName: null,
          patientSex: null,
          patientAge: null,
          patientIdCard: null,
          patientPhone: null
       },
        patientRules: {
          patientNum: [{ required: true, message: '患者编码不能为空', trigger: 'blur' }],
          patientName: [{ required: true, message: '患者姓名不能为空', trigger: 'blur' }],
          patientSex: [{ required: true, message: '患者性别不能为空', trigger: 'blur' }],
          patientAge: [{ required: true, message: '患者年龄不能为空', trigger: 'blur' }],
          patientIdCard:[{ required: true, message: '患者身份证号码不能为空', trigger: 'blur' }],
          patientPhone:[{ required: true, message: '患者手机号不能为空', trigger: 'blur' }]
        },

    }
    },
    // 生命周期钩子函数(vue对象创建完,自动调用该方法)
    created() {
      this.fetchData()
    },
    methods: {
      load () {
        this.count += 2
      },
      // 查询数据
        fetchData() {
          let params = {
            patientNum: this.keyword.patientNum,
            patientName: this.keyword.patientName,
            pageNum: this.pageNum,
            pageSize: this.pageSize
          }
          // getList是api/unit中自己
          getpList(params).then(res => {
            let pageInfo = res.data
            this.loading = false
            this.patientList = pageInfo.list
            this.total = pageInfo.total
          })
        },
        // 多选框选中数据
        handleSelectionChange(selectionRowArr) {
          this.ids = [];
          console.log("111",selectionRowArr)
          this.multipSelection = selectionRowArr;
          for (let i = 0; i < selectionRowArr.length; i++) {
            console.log("222",selectionRowArr[i])
            this.ids.push(selectionRowArr[i].patientNum)
          }
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
      // 删除
      handleDelete(index, row) {
        this.$confirm('是否确认删除用户编号为"' + row.patientNum + '"的数据项？', '提示', {
          confirmButtonText: '确定',
          cancelButtonText: '取消',
          type: 'warning'
        }).then(() => {
          let params = {
            patientNum: row.patientNum
          }
          deleteById(params).then(res => {
            console.log(row.patientNum)
            console.log(res)
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
      // 刷新页面
      resetSearchForm(formName) {
        this.$refs[formName].resetFields()
        this.fetchData()
      },
      //查询
      search() {
        this.fetchData()
      },
      // 弹出添加患者信息对话框
      openAddDialog() {
        this.addpatient = true
        this.title = '添加患者信息'
      },
      // 弹出修改患者信息对话框
      openEditDialog(index, row) {
        this.addpatient = true
        this.title = '修改患者信息'
        this.patient = row
        this.patientId = row.patientId
        console.log(row)
      },
      // 取消添加
      cancelAddPatient(){
          //关闭弹框
          this.addpatient = false
      },
      // 添加/修改患者
      addYPatient(){
          this.$refs.patientRulesForm.validate((valid) => {
            console.log('patient:', this.patient)
            if (valid) {
              if (this.title === '添加患者信息') {
                console.log('patient:', this.patient)
                addPatient(this.patient).then(res => {
                  console.log(res)
                  this.$message({
                    message: '添加成功',
                    type: 'success'
                  })
                  this.fetchData()
                  this.$refs.patientRulesForm.resetFields()
                  this.addpatient = false
                })
              } else if (this.title === '修改患者信息') {
                editPatient(this.patient).then(res => {
                  console.log(res)
                  this.patient.patientNum = res.data.patientNum
                  console.log('patient:', this.patient.patientNum)
                  if (res.data.code === 20000) {
                    this.$message({
                      message: '修改成功',
                      type: 'success'
                    })
                  }
                  this.fetchData()
                  this.$refs.patientRulesForm.resetFields()
                  this.addpatient = false
                })
              }
            }
          })
      },
   // 跳转家属页面
      toFamily() {
        this.$router.push({
          path: '/patient/family',
        })
      }
    }
  }
</script>

<style scoped>
.an {
  float: right;
}

.box-card {
  width: 97%;
  margin-left: 22px;
  margin-top: 20px;
}
</style>
