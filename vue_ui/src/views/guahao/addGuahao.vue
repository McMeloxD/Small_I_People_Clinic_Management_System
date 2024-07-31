<template>
  <div class="cao">
    <!-- 工具栏和搜索栏 -->
    <el-form>
      <el-form-item>
        <el-button
          type="primary"
          icon="el-icon-plus"
          @click="openAddDialog"
        >新增挂号
        </el-button
        >
        <el-button
          type="warning"
          icon="el-icon-s-promotion"
          @click="Export()"
        >导出表格
        </el-button
        >
      </el-form-item>
    </el-form>

    <!--  模糊查询栏  -->
    <el-form :inline="true" :model="keyword" ref="searchForm" class="demo-form-inline">
      <el-form-item>
        <el-col :span="12">
          <el-form-item label="挂号科室" prop="departments">
            <el-select v-model="keyword.departments" style="width: 80px;" placeholder="全部" @change="scFindDoc">
              <el-option label="全部" value=""></el-option>
              <el-option label="全科" value="全科"></el-option>
              <el-option label="内科" value="内科"></el-option>
              <el-option label="外科" value="外科"></el-option>
              <el-option label="儿科" value="儿科"></el-option>
              <el-option label="妇科" value="妇科"></el-option>
              <el-option label="眼科" value="眼科"></el-option>
            </el-select>
          </el-form-item>
        </el-col>
        <el-col :span="8">
          <el-form-item label="就诊医生" prop="doctorName">
            <el-select v-model="keyword.doctorName" placeholder="请选择科室" style="width: 130px;" @change="findys">
              <el-option v-for="doctor in this.Seachdoclist" :value="doctor.doctorName" :key="doctor.doctorName"
                         :label="doctor.doctorName"
              ></el-option>
            </el-select>
          </el-form-item>
        </el-col>
        <el-col :span="1">
          <el-button type="success" size="medium" @click="search" icon="el-icon-search">查询</el-button>
        </el-col>
        <el-col :span="12">
          <el-form-item label="挂号日期" prop="dateArr">
            <el-date-picker
              v-model="keyword.dateArr"
              type="daterange"
              range-separator="至"
              start-placeholder="开始日期"
              end-placeholder="结束日期"
              value-format="yyyy-MM-dd"
              @change="dateBh"
            >
            </el-date-picker>
          </el-form-item>
        </el-col>
        <el-col :span="8">
          <el-form-item label="患者名称" label-width="70px" prop="patientName">
            <!--  输入框有input事件和change事件,但input在输入框内容发生改变时自动回调,而change必须是输入完后输入框失去焦点才会触发  -->
            <el-input size="small" clearable v-model="keyword.patientName" placeholder="输入患者名称"
                      @input="inputChange"
            ></el-input>
          </el-form-item>
        </el-col>
        <el-col :span="1">
          <el-button type="info" plain size="medium " @click="resetSearchForm('searchForm')" icon="el-icon-refresh">重置
          </el-button>
        </el-col>
      </el-form-item>
    </el-form>

    <!-- 数据展示栏 -->
    <el-table v-loading="loading" :data="GuahaoInfoList" id="table_excel">
      <el-table-column label="序号" align="center" prop="id" width="70px"/>
      <el-table-column label="挂号单号" align="center" prop="registrationCoding" width="150px"/>
      <el-table-column label="患者姓名" align="center" prop="patientName" width="100px"/>
      <el-table-column label="性别" align="center" prop="patientSex" width="70px">
        <template slot-scope="scope">
          <el-tag :type="scope.row.patientSex == '1'?'':'danger'">
            <span>{{ scope.row.patientSex == '1' ? '男' : '女' }}</span></el-tag>
        </template>
      </el-table-column>
      <el-table-column label="年龄" align="center" prop="patientAge" width="70px"/>
      <el-table-column label="科室" align="center" prop="departments" width="100px"/>
      <el-table-column label="接诊医生" align="center" prop="doctorName" width="100px"/>
      <el-table-column label="挂号时间" align="center" prop="registrationDate" width="150px"/>
      <el-table-column label="应收金额(元)" align="center" prop="receivable" width="100px">
        <template slot-scope="scope">
          <span>{{ scope.row.receivable.toFixed(2) }}</span>
        </template>
      </el-table-column>
      <el-table-column label="就诊状态" align="center" prop="registrationState" width="100px">
        <template slot-scope="scope">
          <el-tag :type="scope.row.registrationState == '1'?'success':'danger'">
            <span>{{ scope.row.registrationState == '1' ? '已就诊' : '未就诊' }}</span></el-tag>
        </template>
      </el-table-column>
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="warning" plain
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
          >编辑
          </el-button>
          <el-button
            size="mini"
            type="primary" plain
            icon="el-icon-edit"
            @click="handleJiuZhen(scope.row)"
          >就诊
          </el-button>
          <el-button
            size="mini"
            type="danger" plain
            icon="el-icon-circle-close"
            @click="handleDelete(scope.row)"
          >删除
          </el-button>
        </template>
      </el-table-column>
    </el-table>
    <el-pagination
      background
      @size-change="handleSizeChange"
      @current-change="handleCurrentChange"
      :current-page="currentPage"
      :page-sizes="[5, 10, 20]"
      :page-size="100"
      layout="total, sizes, prev, pager, next, jumper"
      :total="total"
    >
    </el-pagination>

    <!--添加和修改 的对话框-->
    <el-dialog :title="dialogName" :visible.sync="addOrEditDialog" width="40%" center :show-close="false">
      <el-form :model="infos" :rules="rules" ref="addOrEditForm">
        <el-form-item>
          <el-col :span="12">
            <el-form-item label="科室" prop="departments">
              <el-select v-model="infos.departments" style="width: 100px;" placeholder="请选择" @change="selectKeshi">
                <el-option label="全科" value="全科"></el-option>
                <el-option label="内科" value="内科"></el-option>
                <el-option label="外科" value="外科"></el-option>
                <el-option label="儿科" value="儿科"></el-option>
                <el-option label="妇科" value="妇科"></el-option>
                <el-option label="眼科" value="眼科"></el-option>
              </el-select>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="就诊医生" prop="doctorName">
              <el-select v-model="infos.doctorName" placeholder="请选择" style="width: 100px;">
                <el-option v-for="doctor in this.doclist" :value="doctor.doctorName" :key="doctor.doctorName"
                           :label="doctor.doctorName"
                ></el-option>
              </el-select>
            </el-form-item>
          </el-col>
        </el-form-item>
        <el-form-item>
          <el-col :span="12">
            <el-form-item label="诊疗费">
              <el-select v-model="infos.consultationFee" style="width: 100px;" placeholder="请选择">
                <el-option label="免费(0.00元)" :value=0.00></el-option>
                <el-option label="诊疗费(50.00元)" :value=10.00></el-option>
              </el-select>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="挂号费">
              <el-select v-model="infos.registrationFee" style="width: 100px;" placeholder="请选择">
                <el-option label="免费(0.00元)" :value=0.00></el-option>
                <el-option label="普通挂号(10.00元)" :value=10.00></el-option>
                <el-option label="专家挂号(20.00元)" :value=20.00></el-option>
              </el-select>
            </el-form-item>
          </el-col>
        </el-form-item>
        <el-form-item>
          <el-col :span="12">
            <el-form-item label="就诊类型" prop="receptionType">
              <el-radio-group v-model="infos.receptionType">
                <el-radio label="1">初诊</el-radio>
                <el-radio label="2">复诊</el-radio>
              </el-radio-group>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="患者性别" prop="patientSex">
              <el-radio-group v-model="infos.patientSex">
                <el-radio label="1">男</el-radio>
                <el-radio label="2">女</el-radio>
              </el-radio-group>
            </el-form-item>
          </el-col>
        </el-form-item>
        <el-form-item>
          <el-col :span="12">
            <el-form-item label="患者姓名" prop="patientName" label-width="80px">
              <el-input
                v-model="infos.patientName"
                autocomplete="off"
                style="width: 150px"
                placeholder="请输入名称"
              ></el-input>
            </el-form-item>
          </el-col>
          <el-col :span="12">
            <el-form-item label="患者年龄" prop="patientAge" label-width="80px">
              <el-input
                v-model="infos.patientAge"
                autocomplete="off"
                style="width: 110px"
                placeholder="请输入年龄"
              ></el-input>
            </el-form-item>
          </el-col>
        </el-form-item>
        <el-form-item label="挂号时间" prop="registrationDate">
          <el-col :span="10">
            <el-date-picker type="date" placeholder="选择日期" v-model="infos.registrationDate"
                            value-format="yyyy-MM-dd" style="width: 70%;"
            ></el-date-picker>
          </el-col>
        </el-form-item>


      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button @click="cancelAddMeasure('addOrEditForm')">取 消</el-button>
        <el-button type="primary" @click="addMeasure('addOrEditForm')"
        >提交
        </el-button
        >
      </div>
    </el-dialog>
  </div>
</template>

<script>
import {
  findAllGuahaoInfos,
  delByCoding,
  findDoctors,
  addGuahaoInfo,
  editGuahaoInfo,
  jiuZhen,
  findAllGuahaoInfosBfy
} from '@/api/guahao'

export default {
  name: 'addGuaHao',
  data() {
    return {
      // 遮罩层
      loading: true,
      currentPage: 1, // 当前页面
      total: 0, // 总条数
      pageNum: 1, // 当前页面
      pageSize: 5, // 每页大小
      GuahaoInfoList: [], //所有信息
      addOrEditDialog: false, //新增/编辑窗口开关
      dialogName: '添加单位', //窗口名字
      doclist: [],
      Seachdoclist: [],
      title: '挂号记录',
      infos: {
        departments: '',
        doctorName: '',
        receptionType: '',
        registrationFee: '',
        consultationFee: '',
        registrationDate: null,
        patientName: '',
        patientSex: '',
        patientAge: ''
      },
      keyword: {
        departments: null,
        doctorName: null,
        dateArr: [], //这里不写默认空数组就会报错找不到参数0和1!!!!妈的
        patientName: ''
      },
      rules: {
        departments: [
          { required: true, message: '科室不能为空', trigger: 'blur' }
        ],
        doctorName: [
          { required: true, message: '就诊医生不能为空', trigger: 'blur' }
        ],
        receptionType: [
          { required: true, message: '就诊类型不能为空', trigger: 'blur' }
        ],
        patientSex: [
          { required: true, message: '患者性别不能为空', trigger: 'blur' }
        ],
        patientName: [
          { required: true, message: '患者姓名不能为空', trigger: 'blur' }
        ],
        patientAge: [
          { required: true, message: '患者年龄不能为空', trigger: 'blur' }
        ],
        registrationDate: [
          { required: true, message: '日期不能为空', trigger: 'blur' }
        ]
      }
    }
  },
  methods: {
    /** 查询单位列表 */
    fetchData() {
      //组装查询参数

      let params = {
        pageNum: this.pageNum,
        pageSize: this.pageSize,
        departments: this.keyword.departments,
        doctorName: this.keyword.doctorName,
        startDate: this.keyword.dateArr[0],
        endDate: this.keyword.dateArr[1],
        patientName: this.keyword.patientName
      }

      findAllGuahaoInfos(params).then(res => {
        if (res.code == 20000) {
          this.loading = false
          this.GuahaoInfoList = res.data.list
          this.pageNum = res.data.pageNum
          this.total = res.data.total
        } else {
          this.$message({
            type: 'error',
            message: '查询失败',
            duration: 1000
          })
        }
      })
    },
    // 监听患者名称输入框变化
    inputChange() {
      // 监听变化直接查库刷新
      this.loading = true
      this.fetchData()
    },
    //监听接诊医生模糊查询
    findys() {
      // 监听变化直接查库刷新
      this.loading = true
      this.fetchData()
    },
    // 监听日期变化
    dateBh() {
      // 监听变化直接查库刷新
      this.loading = true
      this.fetchData()
    },
    // 搜索框查找医生
    scFindDoc() {
      // 查找医生
      findDoctors({ departments: this.keyword.departments }).then(res => {
        // 每次变化先将上次的医生数组清空
        this.keyword.doctorName = ''
        this.Seachdoclist = res.data
      })
      // 监听变化直接查库刷新
      if (this.keyword.departments == '') {
        this.keyword.doctorName = null
        this.loading = true
        this.fetchData()
      } else {
        this.loading = true
        this.fetchData()
      }

    },
    // 模糊搜索
    search() {
      this.loading = true
      this.fetchData()
    },
    // 重置表单
    resetSearchForm(formName) {
      this.$refs[formName].resetFields()
      this.Seachdoclist = []
      this.loading = true
      this.fetchData()
    },
    handleSizeChange(val) {
      // 处理页面大小改变时触发
      this.loading = true
      this.pageSize = val
      this.fetchData()
    },
    handleCurrentChange(val) {
      // 当前页码改变时触发
      this.loading = true
      this.pageNum = val
      this.fetchData()
    },
    handleJiuZhen(row) {
      if (row.registrationState != 1){
        this.$confirm('确认将患者["' + row.patientName + '"]病单改为已就诊?', '提示', {
          confirmButtonText: '确认',
          cancelButtonText: '取消',
          type: 'warning'
        }).then(() => {
          this.loading = true
          jiuZhen({ patientName: row.patientName }).then(res => {
            if (res.code == 20000) {
              this.$message({
                type: 'success',
                message: '修改成功',
                duration: 1000
              })
              this.fetchData()
            } else {
              this.$message({
                type: 'error',
                message: '修改失败',
                duration: 1000
              })
            }
          })
        })
      }else {
        this.$message({
          type: 'error',
          message: '该患者已就诊!',
          duration: 1000
        })
      }
    },
    //对话框点击确定
    addMeasure(formName) {
      console.log(this.infos)
      this.$refs[formName].validate((valid) => {
        if (valid) {
          this.loading = true
          if (this.dialogName == '新增挂号') {
            addGuahaoInfo(this.infos).then((res) => {
              if (res.code == 20000) {
                this.$message({
                  type: 'success',
                  message: '添加成功',
                  duration: 1000
                })
                this.fetchData()
                this.addOrEditDialog = false
                this.infos = {}
              } else {
                this.$message({
                  type: 'error',
                  message: '添加失败',
                  duration: 1000
                })
              }
            })
          } else if (this.dialogName == '编辑信息') {
            editGuahaoInfo(this.infos).then((res) => {
              if (res.code == 20000) {
                this.$message({
                  type: 'success',
                  message: '修改成功',
                  duration: 1000
                })
                this.fetchData()
                this.addOrEditDialog = false
                this.infos = {}
              } else {
                this.loading = false
                this.$message({
                  type: 'error',
                  message: '修改失败',
                  duration: 1000
                })

              }
            })
          } else {
            return false
          }
        } else {
          return false
        }
      })
    },
    //选中科室,调数据库查医生
    selectKeshi() {
      findDoctors({ departments: this.infos.departments }).then(res => {
        // 每次变化先将上次的医生数组清空
        this.infos.doctorName = ''
        this.doclist = res.data
      })
    },
    //修改挂号信息
    handleUpdate(row) {
      this.dialogName = '编辑信息'
      this.infos = row
      // 将回显的数据转为字符串,单选按钮就会正常回显
      this.infos.receptionType = String(this.infos.receptionType)
      this.infos.patientSex = String(this.infos.patientSex)
      this.addOrEditDialog = true
    },
    //删除信息
    handleDelete(row) {
      this.$confirm('确认删除单号为["' + row.registrationCoding + '"]的记录?', '提示', {
        confirmButtonText: '确认',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(() => {
        this.loading = true
        delByCoding({ coding: row.registrationCoding }).then(res => {
          if (res.code == 20000) {
            this.$message({
              type: 'success',
              message: '删除成功',
              duration: 1000
            })
            this.fetchData()
          } else {
            this.$message({
              type: 'error',
              message: '删除失败',
              duration: 1000
            })
          }
        })
      })
    },
    //打开新增挂号对话框
    openAddDialog() {
      this.dialogName = '新增挂号'
      this.addOrEditDialog = true
    },

    //对话框点击取消
    cancelAddMeasure(formName) {
      this.$refs[formName].resetFields()
      this.infos = {}
      this.loading = true
      this.fetchData()
      this.addOrEditDialog = false
    },

    //导出
    Export() {
      //获得数据
      findAllGuahaoInfosBfy().then(res => {
        let list = res.data
        //表格表头,导出表头
        let tableHeader = [['序号', '挂号单号', '患者姓名', '性别', '年龄', '科室', '接诊医生',
          '挂号时间', '应收金额(元)', '就诊状态']]
        list.forEach((item) => {
          let rowData = []
          //导出内容的字段
          rowData = [
            item.id,
            item.registrationCoding,
            item.patientName,
            item.patientSex,
            item.patientAge,
            item.departments,
            item.doctorName,
            item.registrationDate,
            item.receivable,
            item.registrationState
          ]
          tableHeader.push(rowData)
        })
        // 因为配置了全局,所以可以用this.$直接调用,不需要导入
        let wb = this.$XLSX.utils.book_new()
        let ws = this.$XLSX.utils.aoa_to_sheet(tableHeader)
        this.$XLSX.utils.book_append_sheet(wb, ws, this.title) // 工作簿名称
        this.$XLSX.writeFile(wb, this.title + '.xlsx') // 保存的文件名
      })
    }
  },
  created() {
    this.fetchData()
  }
}

</script>
<style scoped>
.cao {
  margin-left: 20px;
  margin-top: 20px;
  font-family: "Helvetica Neue", Helvetica, "PingFang SC", "Hiragino Sans GB", "Microsoft YaHei", "微软雅黑", Arial, sans-serif;
}
</style>
