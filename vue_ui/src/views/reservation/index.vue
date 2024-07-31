<template>
  <div>

    <el-form :inline="true" :model="keyword" class="demo-form-inline">
      <el-form-item>
        <el-input v-model="keyword.patientName" placeholder="请输入患者姓名" style="width: 250px" clearable></el-input>
      </el-form-item>
      <el-form-item>
        <el-button type="primary" @click="search" icon="el-icon-search">查询</el-button>
      </el-form-item>
    </el-form>

    <el-table :data="tableData" style="width: 100%">
      <el-table-column align="center" prop="appointmentId" label="预约序号" width="180"></el-table-column>
      <el-table-column align="center" prop="patients.patientName" label="患者姓名" width="180"></el-table-column>
      <el-table-column align="center" prop="patients.patientSex" label="患者性别" width="180">
        <template slot-scope="scope">
          <el-tag :type="scope.row.patients.patientSex == 1 ? '' : 'danger'">
            <span v-if="scope.row.patients.patientSex == 1">男</span>
            <span v-if="scope.row.patients.patientSex == 2">女</span>
          </el-tag>
        </template>
      </el-table-column>
      <el-table-column align="center" prop="patients.patientAge" label="患者年龄"></el-table-column>
      <el-table-column align="center" prop="patients.patientPhone" label="患者联系方式"></el-table-column>
      <el-table-column align="center" prop="appointmentDate" label="预约日期"></el-table-column>
      <el-table-column align="center" prop="doctorName" label="医生姓名"></el-table-column>
      <el-table-column align="center" label="操作" width="150px">
        <template slot-scope="scope">
          <el-button type="text" size="mini" @click="handleClick(scope.row)">编辑</el-button>
          <el-button size="mini" type="text" @click="handleDelete(scope.row)">删除</el-button>
        </template>
      </el-table-column>
    </el-table>

    <!--分页-->
    <el-card class="box-card">
      <el-pagination
        @size-change="handleSizeChange"
        @current-change="handleCurrentChange"
        :current-page="currentPage"
        :page-sizes="[10,20,30]"
        :page-size="100"
        layout="total, sizes, prev, pager, next, jumper"
        :total="total">
      </el-pagination>
    </el-card>



    <!--编辑-->
    <el-dialog title="预约管理" :visible.sync="dialogFormVisible" width="650px">
      <el-form :inline="true" :model="appointments" class="demo-form-inline">
        <el-form-item label="姓名">
          <el-input v-model="appointments.patientName"style="width: 220px"></el-input>
        </el-form-item>
        <el-form-item label="性别">
          <el-radio-group v-model="appointments.patientSex">
            <el-radio :label = 1>男</el-radio>
            <el-radio :label = 2>女</el-radio>
          </el-radio-group>
        </el-form-item>
        <el-form-item label="年龄">
          <el-input v-model="appointments.patientAge"></el-input>
        </el-form-item>
        <el-form-item label="联系方式">
          <el-input v-model="appointments.patientPhone"style="width: 220px"></el-input>
        </el-form-item>
        <el-form-item label="预约日期">
          <el-date-picker
            v-model="appointments.appointmentDate"
            type="date"
            placeholder="选择日期">
          </el-date-picker>
        </el-form-item>
        <el-form-item label="接诊医生">
          <el-input v-model="appointments.doctorName"style="width: 220px"></el-input>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button @click="quxiao">取 消</el-button>
        <el-button type="primary" @click="addItemTyp">确 定</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import {getappointments,delById,update} from "@/api/reservation";
export default {
  data() {
    return {
      dialogFormVisible: false,
      //编辑，回显数据
      appointments:{
        appointmentId:'',
        patientName:'',
        patientSex:'',
        patientAge:'',
        patientPhonepatientPhone:'',
        appointmentDate:'',
        doctorName:''
      },
      keyword:{
        patientName:''
      },
      tableData: [],
      pageNum:1,
      pageSize:10,
      currentPage:1,
      total:0,
    }
  },
  methods:{
    //修改
    addItemTyp() {
      update(this.appointments).then(res => {
        if (res.code == 20000) {
          this.$message({
            type: 'success',
            message: '修改成功!',
            duration: 1000
          });
          this.fetchData();
        }
      })
      this.dialogFormVisible = false
    },
    //取消
    quxiao() {
      this.fetchData();
      this.dialogFormVisible = false
    },
    //编辑
    handleClick(row) {
      console.log("66",row)
      this.dialogFormVisible = true
      this.appointments = row
      this.appointments.patientName = row.patients.patientName;
      this.appointments.patientSex = row.patients.patientSex;
      this.appointments.patientAge = row.patients.patientAge;
      this.appointments.patientPhone = row.patients.patientPhone;
    },
    //重置
    resetting() {},
    //查询
    search() {
      this.fetchData()
    },
    //删除
    handleDelete(row) {
      this.$confirm('是否确认删除"'+row.appointmentId+'"的信息吗？', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(() => {
        console.log("1111111111",row)
        let params = {
          id:row.appointmentId
        }
        delById(params).then(res => {
          if (res.code == 20000) {
            this.$message({
              type: 'success',
              message: '删除成功!',
              duration: 1000
            });
            this.fetchData();
          }
        })
      }).catch(() => {
        this.$message({
          type: 'info',
          message: '已取消删除',
          duration: 1000
        });
      });
    },
    fetchData() {
      let params = {
        pageNum:this.pageNum,
        pageSize:this.pageSize,
        patientName:this.keyword.patientName
      }
      getappointments(params).then(res => {
        console.log("999",res)
        this.tableData = res.data.list;
        this.total = res.data.total;
      })
    },
    //页面大小改变时触发
    handleSizeChange(val) {
      this.pageSize = val
      this.fetchData()
    },
    //当前页码改变时触发
    handleCurrentChange(val) {
      this.pageNum = val;
      this.fetchData()
    }
  },
  // 生命周期钩子函数(vue对象创建完,自动调用该方法)
  created() {
    this.fetchData()
  },
}
</script>

<style scoped>

</style>
