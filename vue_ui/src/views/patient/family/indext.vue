<template>
  <div>
    <el-card class="box-card">
      <!--搜索框-->
      <el-form :inline="true" :model="keyword" class="demo-form-inline" ref="searchForm">
        <el-form-item label="患者编码" prop="patientNum">
          <el-input v-model="keyword.patientNum" size="small" placeholder="患者编码" />
        </el-form-item>
        <el-form-item label="家属姓名" prop="familyName">
          <el-input v-model="keyword.familyName" size="small" placeholder="家属姓名" />
        </el-form-item>
        <el-form-item>
          <el-button type="primary" plain size="small" @click="search" icon="el-icon-zoom-in">查询</el-button>
          <el-button type="primary" plain size="small" @click="resetSearchForm('searchForm')" icon="el-icon-refresh">重置</el-button>
          <el-button type="primary" plain size="small" @click="openAddDialog('searchForm')" icon="el-icon-circle-plus-outline">添加</el-button>
          <el-button type="primary" plain size="small" @click="toPatient('searchForm')" icon="el-icon-refresh-right">返回</el-button>
        </el-form-item>
      </el-form>
      <!--主体表格 -->
      <el-table v-loading="loading" :data="familyList" >
        <el-table-column prop="familyId" label="序号" width="180"/>
        <el-table-column prop="patientNum" label="患者编码" width="180"/>
        <el-table-column prop="relation" label="家庭关系" width="180">
          <template slot-scope="scope">
            {{ getRelationLabel(scope.row.familyRelation) }}
          </template>
        </el-table-column>
        <el-table-column prop="familyName" label="姓名" width="180"/>
        <el-table-column prop="familySex" label="性别" width="180"/>
        <el-table-column prop="workUnit" label="工作单位" width="180"/>
        <el-table-column prop="familyDob" label="出生日期" width="180"/>
        <el-table-column prop="familyPhone" label="联系电话" width="180"/>
        <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
          <template slot-scope="scope">
            <el-button size="mini" type="text" icon="el-icon-edit" @click="openEditDialog(scope.$index,scope.row)">修改</el-button>
            <el-button size="mini" type="text" icon="el-icon-delete" @click="handleDelete(scope.$index,scope.row)">删除</el-button>
          </template>
        </el-table-column>
      </el-table>
      <el-pagination
        :current-page="currentPage"
        :page-sizes="[ 10, 20]"
        :page-size="100"
        layout="total, sizes, prev, pager, next, jumper"
        :total="total"
        @size-change="handleSizeChange"
        @current-change="handleCurrentChange"
      />
    </el-card>
    <!--添加-->
    <el-dialog :title="title" :visible.sync="addfamily" width="28%">
      <el-form ref="familyRulesForm" :model="family" :rules="familyRules">
        <el-form-item label="患者编码" prop="patientNum" label-width="100px" key="1" >
          <el-input v-model="family.patientNum" autocomplete="off"  style="width: 200px" />
        </el-form-item>
        <el-form-item label="家庭关系" prop="familyRelation" label-width="110px" key="3">
          <el-radio-group v-model="family.familyRelation">
            <el-radio label="1">父子</el-radio>
            <el-radio label="2">母子</el-radio>
            <el-radio label="3">姐弟</el-radio>
            <el-radio label="4">兄妹</el-radio>
            <el-radio label="5">其他</el-radio>
          </el-radio-group>
        </el-form-item>
        <el-form-item label="姓名" prop="familyName" label-width="100px" key="2">
          <el-input v-model="family.familyName" autocomplete="off" style="width: 200px" />
        </el-form-item>

        <el-form-item label="性别" prop="familySex" label-width="110px">
          <el-radio-group v-model="family.familySex">
            <el-radio label="1">男</el-radio>
            <el-radio label="2">女</el-radio>
          </el-radio-group>
        </el-form-item>
        <el-form-item label="工作单位" prop="workUnit" label-width="100px">
          <el-input v-model="family.workUnit" autocomplete="off" style="width: 200px" />
        </el-form-item>
        <el-form-item label="出生日期" prop="familyDob" label-width="100px">
          <el-input v-model="family.familyDob" autocomplete="off" style="width: 200px" />
        </el-form-item>
        <el-form-item label="联系电话" prop="familyPhone" label-width="100px">
          <el-input v-model="family.familyPhone" autocomplete="off" style="width: 200px" />
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button @click="cancelAddFamily('measureRulesForm')">取 消</el-button>
        <el-button type="primary" @click="addYFamily('measureRulesForm')">提交</el-button>
      </div>
    </el-dialog>
  </div>
</template>
<script>
  import { addFamily, deleteById, editFamily, getFamilyList } from '@/api/fam'
  export default {
    data() {
      return {
        familyList: [],
        loading: true,
        patientId: null,
        currentPage: 1,
        pageNum: 1,
        pageSize: 10,

        total: 0,
        title: '',
        ids: [],
        keyword: {
          patientNum: null,
          patientName: null
        },
        family: {
          familyId: null,
          familyNum: null,
          familyRelation: null,
          familyName: null,
          familySex: null,
          workUnit: null,
          familyDob: null,
          familyPhone: null
        },
        addfamily: false,
        familyRules: {
          familyNum: [{ required: true, message: '患者编码不能为空', trigger: 'blur' }],
          familyRelation: [{ required: true, message: '家庭关系不能为空', trigger: 'blur' }],
          familyName: [{ required: true, message: '姓名不能为空', trigger: 'blur' }],
          familySex: [{ required: true, message: '性别不能为空', trigger: 'blur' }],
          workUnit: [{ required: true, message: '工作单位不能为空 ', trigger: 'blur'
          }]
        },
      };
    },
    // 生命周期钩子函数(vue对象创建完,自动调用该方法)
    created() {
      this.fetchData()
    },
    methods: {
      getRelationLabel(familyRelation) {
        switch (familyRelation) {
          case 1:
            return '父子';
          case 2:
            return '母子';
          case 3:
            return '姐弟';
          case 4:
            return '兄妹';
          case 5:
            return '其他';
          default:
            return '';
        }
      },
      //返回患者页面
      toPatient() {
        this.$router.push({
          path: '/patient/user'
        })
      },
      // 查询数据
      fetchData() {
        let params = {
          patientNum: this.keyword.patientNum,
          patientName: this.keyword.patientName,
          pageNum: this.pageNum,
          pageSize: this.pageSize
        }
        // getList是api中自己
       getFamilyList(params).then(res => {
         let pageInfo = res.data
         this.loading = false
         this.familyList = pageInfo.list
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
      // 弹出添加患者家庭关系对话框
      openAddDialog() {
        this.addfamily = true
        this.title = '添加患者信息'
      },
      // 弹出修改患者家庭关系对话框
      openEditDialog(index, row) {
        this.addfamily = true
        this.title = '修改患者信息'
        this.family = row
        this.familyId = row.familyId
        console.log(row)
      },
      // 关闭添加患者家庭关系对话框
      cancelAddFamily(formName) {
        this.addfamily = false
        this.$refs[formName].resetFields()
      },
      // 添加/修改患者家庭关系
      addYFamily() {
        this.$refs.familyRulesForm.validate((valid) => {
          console.log('family:', this.family)
          if (valid) {
            if (this.title === '添加患者信息') {
              console.log('family:', this.family)
              addFamily(this.family).then(res => {
                console.log(res)
                this.$message({
                  message: '添加成功',
                  type: 'success'
                })
                this.fetchData()
                this.$refs.familyRulesForm.resetFields()
                this.addfamily = false
              })
           } else if (this.title === '修改患者信息') {
              editFamily(this.family).then(res => {
                console.log(res)
                  this.$message({
                    message: '修改成功',
                    type: 'success'
                  })
                this.fetchData()
                this.$refs.familyRulesForm.resetFields()
                this.addfamily = false
              })
           }
          }
})
      },

      // 根据id删除
      handleDelete(index, row) {
        this.$confirm('是否确认删除用户编号为"' + row.familyId + '"的数据项？', '提示', {
          confirmButtonText: '确定',
          cancelButtonText: '取消',
          type: 'warning'
        }).then(() => {
          let params = {
            familyId: row.familyId
          }
          console.log(params)
          deleteById(params).then(res => {
            console.log(row.familyId)
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
      }
    }
  };
</script>

<style scoped>
  .box-card {
    width: 97%;
    margin-left: 22px;
    margin-top: 10px;
  }
</style>
