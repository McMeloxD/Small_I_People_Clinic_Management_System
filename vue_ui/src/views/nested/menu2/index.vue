<template>
  <div>
    <el-card class="box-card">
      <!--搜索框-->
      <el-form :inline="true" :model="keyword" class="demo-form-inline">
        <el-form-item label="订单类型">
          <el-select v-model="keyword.orderType" placeholder="订单类型">
            <el-option label="全部"  value=""></el-option>
            <el-option label="药品零售" value="药品零售"></el-option>
            <el-option label="处方开立" value="处方开立"></el-option>
            <el-option label="挂号" value="挂号"></el-option>
          </el-select>
        </el-form-item>
        <!--根据订单编号/患者姓名搜索-->
        <el-form-item>
          <el-input v-model="keyword.patientName" placeholder="请输入患者姓名" style="width: 250px"></el-input>
          <el-input v-model="keyword.orderNumber" placeholder="请输入订单编号" style="width: 250px"></el-input>
        </el-form-item>
        <el-form-item>
          <el-button type="primary" @click="search" icon="el-icon-search">查询</el-button>
        </el-form-item>
        <el-form-item>
          <el-button type="danger" @click="handleDeletes" icon="el-icon-delete">批量删除</el-button>
        </el-form-item>
      </el-form>
      <!--表格内容-->
      <el-table :data="tableData" style="width: 100%;font-size: 13px" @selection-change="handleSelectionChange">
        <el-table-column type="selection" align="center" width="30px"></el-table-column>
        <el-table-column align="center" prop="buillId" label="序号" width="80px"></el-table-column>
        <el-table-column align="center" prop="orderNumber" label="订单编号" width="80px"></el-table-column>
        <el-table-column align="center" prop="orderType" label="订单类型" width="80px"></el-table-column>
        <el-table-column align="center" prop="patientName" label="姓名" width="80px"></el-table-column>
        <el-table-column align="center" prop="patientSex" label="性别" width="60px">
          <template slot-scope="scope">
            <el-tag :type="scope.row.patientSex == 1 ? '' : 'danger'">
              <span v-if="scope.row.patientSex == 1">男</span>
              <span v-if="scope.row.patientSex == 2">女</span>
            </el-tag>
          </template>
        </el-table-column>
        <el-table-column align="center" prop="patientAge" label="年龄" width="50px"></el-table-column>
        <el-table-column align="center" prop="patientContact" label="手机号码" width="100px"></el-table-column>
        <el-table-column align="center" prop="department" label="科室"></el-table-column>
        <el-table-column align="center" prop="doctorName" label="接诊医生"></el-table-column>
        <el-table-column align="center" prop="createTime" label="创建时间"></el-table-column>
        <el-table-column align="center" prop="amountReceivable" label="应收金额(元)"></el-table-column>
        <el-table-column align="center" prop="receiveAmount" label="实收金额(元)"></el-table-column>
        <el-table-column align="center" prop="paymentMethod" label="支付方式">
          <template slot-scope="scope">
            <el-tag :type="scope.row.paymentMethod == 1 ? 'danger' : scope.row.paymentMethod == 2 ? '' : 'success'">
              <span v-if="scope.row.paymentMethod == 1">现金</span>
              <span v-else-if="scope.row.paymentMethod == 2">支付宝</span>
              <span v-else-if="scope.row.paymentMethod == 3">微信</span>
            </el-tag>
          </template>
        </el-table-column>
        <el-table-column align="center" prop="chargingState" label="收费状态">
          <template slot-scope="scope">
            <el-tag :type="scope.row.chargingState == 1 ? 'danger' : scope.row.chargingState == 2 ? 'success' : 'info'">
              <span v-if="scope.row.chargingState == 1">待收费</span>
              <span v-else-if="scope.row.chargingState == 2">已收费</span>
              <span v-else-if="scope.row.chargingState == 3">已退费</span>
            </el-tag>
          </template>
        </el-table-column>
        <el-table-column align="center" prop="address" label="操作">
          <template slot-scope="scope">
            <el-button type="text" size="mini" @click="handleClick(scope.row)">编辑</el-button>
            <el-button size="mini" type="text" @click="handleDelete(scope.row)">删除</el-button>
          </template>
        </el-table-column>
      </el-table>
    </el-card>
    <!--分页-->
    <el-card class="box-card">
      <el-pagination
        @size-change="handleSizeChange"
        @current-change="handleCurrentChange"
        :current-page="currentPage"
        :page-sizes="[5,10,20]"
        :page-size="100"
        layout="total, sizes, prev, pager, next, jumper"
        :total="total">
      </el-pagination>
    </el-card>
    <!--编辑-->
    <el-dialog title="收费管理" :visible.sync="dialogFormVisible" width="650px">
      <el-form :inline="true" :model="charge" class="demo-form-inline">
        <el-form-item label="订单类型">
          <el-select v-model="charge.orderType">
            <el-option label="处方开立" value="处方开立"></el-option>
            <el-option label="药品零售" value="药品零售"></el-option>
            <el-option label="挂号" value="挂号"></el-option>
          </el-select>
        </el-form-item>
        <el-form-item label="姓名">
          <el-input v-model="charge.patientName"style="width: 220px"></el-input>
        </el-form-item>
        <el-form-item label="性别">
          <el-radio-group v-model="charge.patientSex">
            <el-radio :label = 1>男</el-radio>
            <el-radio :label = 2>女</el-radio>
          </el-radio-group>
        </el-form-item>
        <el-form-item label="年龄">
          <el-input v-model="charge.patientAge"></el-input>
        </el-form-item>
        <el-form-item label="手机号">
          <el-input v-model="charge.patientContact"style="width: 220px"></el-input>
        </el-form-item>
        <el-form-item label="科室">
          <el-input v-model="charge.department"></el-input>
        </el-form-item>
        <el-form-item label="接诊医生">
          <el-input v-model="charge.doctorName"style="width: 220px"></el-input>
        </el-form-item>
        <el-form-item label="应收金额(元)">
          <el-input v-model="charge.amountReceivable"></el-input>
        </el-form-item>
        <el-form-item label="实收金额(元)">
          <el-input v-model="charge.receiveAmount"></el-input>
        </el-form-item>
        <el-form-item label="支付方式">
            <el-radio-group v-model="charge.paymentMethod">
              <el-radio :label = 1>现金</el-radio>
              <el-radio :label = 2>支付宝</el-radio>
              <el-radio :label = 3>微信</el-radio>
            </el-radio-group>
        </el-form-item>
        <el-form-item label="收费状态">
          <el-radio-group v-model="charge.chargingState">
            <el-radio :label = 1>待收费</el-radio>
            <el-radio :label = 2>已收费</el-radio>
            <el-radio :label = 3>已退费</el-radio>
          </el-radio-group>
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
import {delById, getList, update,delByIds} from "@/api/all";

export default {
  name: '',
  data() {
    return {
      //存入选择的时间段
      value1: '',
      //后端传过来的数据
      tableData: [],
      pageNum:1,
      pageSize:5,
      currentPage:1,
      total:0,
      //搜索关键字
      keyword:{
        patientName:'',
        orderNumber:'',
        orderType:'',
      },
      chargingState:2,
      //编辑，回显数据
      charge: {
        orderType: '',
        patientName: '',
        patientSex: '',
        patientAge: '',
        patientContact: '',
        department: '',
        doctorName: '',
        amountReceivable: '',
        receiveAmount:'',
        paymentMethod:'',
        chargingState: ''
      },
      dialogFormVisible: false,
      //存储要批量删除的id
      chargeList:[],
      //存储要批量删除的名字
      chargeListName:[],
      // 存储多选框选中的所有数据(对象)
      multipleSelection:[]
    }
  },
  methods:{
    //批量删除
    handleDeletes() {
      if (this.chargeList.length == 0) {
        this.$message({
          type: 'info',
          message: '请选择您要删除的数据!',
          duration: 1000
        });
      } else {
        this.$confirm('是否确认删除用户"['+this.chargeListName+']"的信息吗？', '提示', {
          confirmButtonText: '确定',
          cancelButtonText: '取消',
          type: 'warning'
        }).then(() => {
          const isString = this.chargeList.join(",")
          delByIds(isString).then(res => {
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
      }
    },
    //多选框
    handleSelectionChange(val) {
      this.chargeList = []
      this.multipleSelection = val
      for (let i = 0;i < this.multipleSelection.length;i++) {
        let user = this.multipleSelection[i]
        this.chargeList.push(user.orderNumber)
        this.chargeListName.push(user.patientName)
      }
    },
    //修改
    addItemTyp() {
      update(this.charge).then(res => {
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
      this.dialogFormVisible = true
      this.charge = row
    },
    //删除
    handleDelete(row) {
      this.$confirm('是否确认删除"'+row.patientName+'"的信息吗？', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(() => {
        console.log("1111111111",row)
        let params = {
          id:row.orderNumber
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
    //查询
    search() {
      this.fetchData()
    },
    //获取数据
    fetchData() {
      let param = {
        pageSize:this.pageSize,
        pageNum:this.pageNum,
        patientName:this.keyword.patientName,
        orderNumber:this.keyword.orderNumber,
        orderType:this.keyword.orderType,
        chargingState:this.chargingState
      }
      getList(param).then(res => {
        let pageInfo = res.data;
        this.tableData = pageInfo.list;
        this.total = pageInfo.total
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

<style scoped lang="scss">
.box-card {
  width: 100%;
  height: 100%;
}
</style>
